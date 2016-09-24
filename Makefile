# Makefile for TYPO3 development environments
# Project: docker-lamp/typo3
# Author:  Christoph Martel <c.martel@21torr.com>
# Version: 17.08.2016 



check_defined = \
    $(foreach 1,$1,$(__check_defined))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1))

create:
	@echo "[Make] Creating new containerized TYPO3 project."
	$(call check_defined, TYPO3_ADMIN_USER, TYPO3_ADMIN_PASS, TYPO3_SITE_TYPE)
	@cd php && composer install
	@touch php/htdocs/FIRST_INSTALL
	@mkdir -p php/htdocs/typo3conf		
	@cp config/AdditionalConfiguration.php php/htdocs/typo3conf/AdditionalConfiguration.php
	@docker-compose up --build -d
	@echo "[Make] Installing site."
	@docker exec -it dockerlamp_app_1 /usr/src/php/vendor/bin/typo3cms \
		install:setup --non-interactive --admin-user-name=admin --admin-password=adminadmin --site-setup-type=site | true
	@echo "[Make] Done."
	@echo "[Make] Visit http://127.0.0.1:8000/typo3. Login with username admin and password adminadmin."


clean:
	@echo "[Make] Wipe and down."
	@rm -f php/composer.lock
	@rm -f php/htdocs/check.php
	@rm -rf php/htdocs/fileadmin/
	@rm -rf php/htdocs/typo3conf/
	@rm -rf php/htdocs/typo3temp/
	@rm -rf php/htdocs/uploads/
	@rm -rf php/vendor
	@rm -rf php/htdocs/typo3
	@rm -f php/htdocs/FIRST_INSTALL
	@rm -f php/htdocs/*.php
	@docker-compose down
