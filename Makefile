create:
	@cd php && composer install
	@touch php/htdocs/FIRST_INSTALL
	@mkdir -p php/htdocs/typo3conf		
	@cp config/AdditionalConfiguration.php php/htdocs/typo3conf/AdditionalConfiguration.php

clean:
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
