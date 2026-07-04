<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 */
$default_charset = DBConnection::getDefaultCharset();
$default_collation = DBConnection::getDefaultCollation();
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

if (!$DB->tableExists('ntas_items_lines')) {
    $query = "CREATE TABLE `ntas_items_lines` (
      `id` int {$default_key_sign} NOT NULL AUTO_INCREMENT,
      `lines_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      `itemtype` varchar(100) DEFAULT NULL,
      `items_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      UNIQUE KEY `unicity` (`lines_id`,`itemtype`,`items_id`),
      KEY `item` (`itemtype`,`items_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET={$default_charset} COLLATE={$default_collation} ROW_FORMAT=DYNAMIC;";
    $DB->doQuery($query);
}
