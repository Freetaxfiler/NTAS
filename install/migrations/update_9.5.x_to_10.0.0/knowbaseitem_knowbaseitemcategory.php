<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$default_charset = DBConnection::getDefaultCharset();
$default_collation = DBConnection::getDefaultCollation();
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

/* Update link KB_item-category from 1-1 to 1-n */
if (!$DB->tableExists('ntas_knowbaseitems_knowbaseitemcategories')) {
    $query = "CREATE TABLE `ntas_knowbaseitems_knowbaseitemcategories` (
      `id` int {$default_key_sign} NOT NULL AUTO_INCREMENT,
      `knowbaseitems_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      `knowbaseitemcategories_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      KEY `knowbaseitems_id` (`knowbaseitems_id`),
      KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`)
      ) ENGINE = InnoDB ROW_FORMAT = DYNAMIC DEFAULT CHARSET = {$default_charset} COLLATE = {$default_collation};";
    $DB->doQuery($query);
}

if ($DB->fieldExists('ntas_knowbaseitems', 'knowbaseitemcategories_id')) {
    $iterator = $DB->request([
        'SELECT' => ['id', 'knowbaseitemcategories_id'],
        'FROM'   => 'ntas_knowbaseitems',
        'WHERE'  => ['knowbaseitemcategories_id' => ['>', 0]],
    ]);
    if (count($iterator)) {
        //migrate existing data
        foreach ($iterator as $row) {
            $DB->insert("ntas_knowbaseitems_knowbaseitemcategories", [
                'knowbaseitemcategories_id'   => $row['knowbaseitemcategories_id'],
                'knowbaseitems_id'            => $row['id'],
            ]);
        }
    }
    $migration->dropField('ntas_knowbaseitems', 'knowbaseitemcategories_id');
}
