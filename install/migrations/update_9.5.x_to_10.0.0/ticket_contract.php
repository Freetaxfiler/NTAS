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

if (!$DB->tableExists('ntas_tickets_contracts')) {
    $query = "CREATE TABLE `ntas_tickets_contracts` (
      `id` int {$default_key_sign} NOT NULL AUTO_INCREMENT,
      `tickets_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      `contracts_id` int {$default_key_sign} NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
      KEY `contracts_id` (`contracts_id`)
   ) ENGINE = InnoDB ROW_FORMAT = DYNAMIC DEFAULT CHARSET = {$default_charset} COLLATE = {$default_collation};";
    $DB->doQuery($query);
}

if (!$DB->fieldExists("ntas_entities", "contracts_id_default")) {
    $migration->addField(
        "ntas_entities",
        "contracts_id_default",
        "int {$default_key_sign} NOT NULL DEFAULT 0",
        [
            'after'     => "anonymize_support_agents",
            'value'     => -2,               // Inherit as default value
            'update'    => '0',              // Not enabled for root entity
            'condition' => 'WHERE `id` = 0',
        ]
    );

    $migration->addKey("ntas_entities", "contracts_id_default");
}
