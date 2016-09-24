# Makefile for TYPO3 development environments
# Project: docker-lamp/symfony
# Author:  Christoph Martel <chris@codeways.org>
# Version: 17.08.2016 



check_defined = \
    $(foreach 1,$1,$(__check_defined))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1))

create: clean
	@mkdir -p bin
	@curl -LsS https://symfony.com/installer -o bin/symfony
	@chmod a+x bin/symfony
	@symfony new php lts
	#awk -F":" '{ if ($1 == "    database_host") $2 = " demo"; print $1": "$2 }' parameters.yml > parameters.yml


clean:
	@rm -rf php

