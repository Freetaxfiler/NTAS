<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 * @var array $ADDTODISPLAYPREF
 * @var DBmysql $DB
 */
$default_charset = DBConnection::getDefaultCharset();
$default_collation = DBConnection::getDefaultCollation();
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

if (!$DB->tableExists('ntas_softwarelicenses_users')) {
    $query = "CREATE TABLE `ntas_softwarelicenses_users` (
        `id` int {$default_key_sign} NOT NULL AUTO_INCREMENT,
        `softwarelicenses_id` int {$default_key_sign} NOT NULL DEFAULT '0',
        `users_id` int {$default_key_sign} NOT NULL DEFAULT '0',
        PRIMARY KEY (`id`),
        KEY `softwarelicenses_id` (`softwarelicenses_id`),
        KEY `users_id` (`users_id`)
      ) ENGINE=InnoDB DEFAULT CHARSET = {$default_charset} COLLATE = {$default_collation} ROW_FORMAT=DYNAMIC";
    $DB->doQuery($query);
}
