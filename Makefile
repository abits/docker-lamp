# Makefile for TYPO3 development environments
# Project: docker-lamp/symfony
# Author:  Christoph Martel <chris@codeways.org>
# Version: 17.08.2016 

RUN_IN_DOCKER=docker exec dockerlamp_app_1 sh -c 

check_defined = \
    $(foreach 1,$1,$(__check_defined))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1))

create: clean
	@docker-compose up --build -d
	@$(RUN_IN_DOCKER) "curl -LsS https://symfony.com/installer -o bin/symfony"
	@$(RUN_IN_DOCKER) "chmod a+x bin/symfony"
	@$(RUN_IN_DOCKER) "bin/symfony new php lts"
	@$(RUN_IN_DOCKER) "inject /usr/src/php/app/config/parameters.yml > /usr/src/php/app/config/parameters.tmp"
	@$(RUN_IN_DOCKER) "mv /usr/src/php/app/config/parameters.tmp /usr/src/php/app/config/parameters.yml" 

clean:
	@rm -rf php
	@docker-compose down

