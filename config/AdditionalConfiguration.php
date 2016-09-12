<?php
	$GLOBALS['TYPO3_CONF_VARS']['DB']['database'] = getenv("MYSQL_ENV_MYSQL_DATABASE");
	$GLOBALS['TYPO3_CONF_VARS']['DB']['host']     = getenv("MYSQL_PORT_3306_TCP_ADDR");
	$GLOBALS['TYPO3_CONF_VARS']['DB']['username'] = getenv("MYSQL_ENV_MYSQL_USER");
	$GLOBALS['TYPO3_CONF_VARS']['DB']['password'] = getenv("MYSQL_ENV_MYSQL_PASSWORD");
?>