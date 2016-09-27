# Makefile for TYPO3 development environments
# Project: docker-lamp/symfony
# Author:  Christoph Martel <chris@codeways.org>
# Version: 17.08.2016 

EXEC_IN_DOCKER=docker-compose exec app sh -c 
RUN_IN_DOCKER=docker-compose run app sh -c 

check_defined = \
    $(foreach 1,$1,$(__check_defined))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1))

create: clean
	@docker-compose build
	@$(RUN_IN_DOCKER) "mkdir -p /usr/src/php/bin/"
	@$(RUN_IN_DOCKER) "curl -LsS https://symfony.com/installer -o /usr/src/php/bin/symfony"
	@$(RUN_IN_DOCKER) "chmod a+x /usr/src/php/bin/symfony"
	@$(RUN_IN_DOCKER) "/usr/src/php/bin/symfony new php lts"
	@docker-compose up --build -d
	@$(EXEC_IN_DOCKER) "inject /usr/src/php/app/config/parameters.yml > /usr/src/php/app/config/parameters.tmp"
	@$(EXEC_IN_DOCKER) "mv /usr/src/php/app/config/parameters.tmp /usr/src/php/app/config/parameters.yml" 

clean:
	@rm -rf php
	@docker-compose down

