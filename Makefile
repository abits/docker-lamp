create:
	@cd php && composer install
	#@touch php/htdocs/FIRST_INSTALL
	@cp config/AdditionalConfiguration.php php/htdocs/typo3conf/AdditionalConfiguration.php

