<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
//fix database schema inconsistency is_dynamic without is_deleted
$tables = ["ntas_items_remotemanagements", "ntas_items_devicecameras_imageresolutions", "ntas_items_devicecameras_imageformats"];
foreach ($tables as $table) {
    $migration->addField($table, 'is_deleted', 'bool', ['value' => 0, 'after' => 'is_dynamic']);
    $migration->addKey($table, "is_deleted");
}

//new right value for locked_field (previously based on config UPDATE)
$migration->addRight('locked_field', CREATE | UPDATE, ['config' => UPDATE]);

//add date_install
$migration->addField("ntas_items_operatingsystems", 'install_date', 'date');

//add remote_addr
$migration->addField("ntas_agents", 'remote_addr', 'string');

//new right value for snmpcredential (previously based on config UPDATE)
$migration->addRight('snmpcredential', ALLSTANDARDRIGHT, ['config' => UPDATE]);

//new right value for refusedequipment (previously based on config UPDATE)
$migration->addRight('refusedequipment', READ | UPDATE | PURGE, ['config' => UPDATE]);

//new right value for agent (previously based on config UPDATE)
$migration->addRight('agent', READ | UPDATE | PURGE, ['config' => UPDATE]);

//add new fields for Agent
$migration->addField("ntas_agents", 'use_module_wake_on_lan', 'bool');
$migration->addField("ntas_agents", 'use_module_computer_inventory', 'bool');
$migration->addField("ntas_agents", 'use_module_esx_remote_inventory', 'bool');
$migration->addField("ntas_agents", 'use_module_remote_inventory', 'bool');
$migration->addField("ntas_agents", 'use_module_network_inventory', 'bool');
$migration->addField("ntas_agents", 'use_module_network_discovery', 'bool');
$migration->addField("ntas_agents", 'use_module_package_deployment', 'bool');
$migration->addField("ntas_agents", 'use_module_collect_data', 'bool');
