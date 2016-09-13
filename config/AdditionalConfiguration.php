<?php
	/**
	 * Here we extract the values from our docker environment and override
	 * the TYPO3 configuration. 
	 */
	$GLOBALS['TYPO3_CONF_VARS']['DB']['database'] = getenv('MYSQL_ENV_MYSQL_DATABASE');
	$GLOBALS['TYPO3_CONF_VARS']['DB']['host']     = getenv('MYSQL_PORT_3306_TCP_ADDR');
	$GLOBALS['TYPO3_CONF_VARS']['DB']['username'] = getenv('MYSQL_ENV_MYSQL_USER');
	$GLOBALS['TYPO3_CONF_VARS']['DB']['password'] = getenv('MYSQL_ENV_MYSQL_PASSWORD');

	/**
	 * Extra configuration in order to make TYPO3 complain less.
	 */
	$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLocale'] = 'de_DE.UTF-8';
	$GLOBALS['TYPO3_CONF_VARS']['SYS']['trustedHostsPattern'] = '127.0.0.1:8000';