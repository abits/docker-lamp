create:
	@cd php && composer install
	#@touch php/htdocs/FIRST_INSTALL
	@cp config/AdditionalConfiguration.php php/htdocs/typo3conf/AdditionalConfiguration.php

clean:
	@rm php/composer.lock
	@rm php/htdocs/check.php
	@rm -rf php/htdocs/fileadmin/
	@rm -rf php/htdocs/typo3conf/
	@rm -rf php/htdocs/typo3temp/
	@rm -rf php/htdocs/uploads/
	@rm -rf php/vendor