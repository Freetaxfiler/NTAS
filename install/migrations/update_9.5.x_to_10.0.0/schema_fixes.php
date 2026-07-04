<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$default_key_sign = DBConnection::getDefaultPrimaryKeySignOption();

// Remove the `NOT NULL` flag of comment fields and fix collation
$tables = [
    'ntas_apiclients',
    'ntas_applianceenvironments',
    'ntas_appliances',
    'ntas_appliancetypes',
    'ntas_devicesimcards',
    'ntas_knowbaseitems_comments',
    'ntas_lines',
    'ntas_rulerightparameters',
    'ntas_ssovariables',
    'ntas_virtualmachinestates',
    'ntas_virtualmachinesystems',
    'ntas_virtualmachinetypes',
];
foreach ($tables as $table) {
    $migration->changeField($table, 'comment', 'comment', 'text');
}

// Add `DEFAULT CURRENT_TIMESTAMP` to some date fields
$tables = [
    'ntas_alerts',
    'ntas_crontasklogs',
    'ntas_notimportedemails',
];
foreach ($tables as $table) {
    $migration->changeField($table, 'date', 'date', 'timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP');
}

// Fix charset for ntas_notimportedemails table
$migration->addPreQuery(
    sprintf(
        'ALTER TABLE %s CONVERT TO CHARACTER SET %s COLLATE %s',
        $DB->quoteName('ntas_notimportedemails'),
        DBConnection::getDefaultCharset(),
        DBConnection::getDefaultCollation()
    )
);
// Put back `subject` type to text (charset convertion changed it from text to mediumtext)
$migration->changeField('ntas_notimportedemails', 'subject', 'subject', 'text', ['nodefault' => true]);

// Drop malformed keys
$malformed_keys = [
    'ntas_ipaddresses' => [
        'textual',
    ],
    'ntas_items_softwareversions' => [
        'is_deleted',
        'is_template',
    ],
    'ntas_registeredids' => [
        'item',
    ],
];
foreach ($malformed_keys as $table => $keys) {
    foreach ($keys as $key) {
        $migration->dropKey($table, $key);
        $migration->migrationOneTable($table);
    }
}

// Drop useless keys
$useless_keys = [
    'ntas_appliances_items' => [
        'appliances_id',
    ],
    'ntas_appliances_items_relations' => [
        'itemtype',
        'items_id',
    ],
    'ntas_certificates_items' => [
        'device',
    ],
    'ntas_changetemplatehiddenfields' => [
        'changetemplates_id',
    ],
    'ntas_changetemplatemandatoryfields' => [
        'changetemplates_id',
    ],
    'ntas_contracts_items' => [
        'FK_device',
    ],
    'ntas_dashboards_rights' => [
        'dashboards_dashboards_id',
    ],
    'ntas_domains_items' => [
        'domains_id',
        'FK_device',
    ],
    'ntas_dropdowntranslations' => [
        'typeid',
    ],
    'ntas_entities' => [
        'entities_id',
    ],
    'ntas_impactrelations' => [
        'source_asset',
    ],
    'ntas_ipaddresses_ipnetworks' => [
        'ipaddresses_id',
    ],
    'ntas_items_devicebatteries' => [
        'computers_id',
    ],
    'ntas_items_devicecases' => [
        'computers_id',
    ],
    'ntas_items_devicecontrols' => [
        'computers_id',
    ],
    'ntas_items_devicedrives' => [
        'computers_id',
    ],
    'ntas_items_devicefirmwares' => [
        'computers_id',
    ],
    'ntas_items_devicegenerics' => [
        'computers_id',
    ],
    'ntas_items_devicegraphiccards' => [
        'computers_id',
    ],
    'ntas_items_deviceharddrives' => [
        'computers_id',
    ],
    'ntas_items_devicememories' => [
        'computers_id',
    ],
    'ntas_items_devicemotherboards' => [
        'computers_id',
    ],
    'ntas_items_devicenetworkcards' => [
        'computers_id',
    ],
    'ntas_items_devicepcis' => [
        'computers_id',
    ],
    'ntas_items_devicepowersupplies' => [
        'computers_id',
    ],
    'ntas_items_deviceprocessors' => [
        'computers_id',
    ],
    'ntas_items_devicesensors' => [
        'computers_id',
    ],
    'ntas_items_devicesoundcards' => [
        'computers_id',
    ],
    'ntas_items_disks' => [
        'itemtype',
        'items_id',
    ],
    'ntas_items_operatingsystems' => [
        'items_id',
    ],
    'ntas_items_softwarelicenses' => [
        'itemtype',
        'items_id',
    ],
    'ntas_items_softwareversions' => [
        'item',
        'itemtype',
        'items_id',
    ],
    'ntas_itilfollowups' => [
        'itemtype',
        'item_id',
    ],
    'ntas_itilsolutions' => [
        'itemtype',
        'item_id',
    ],
    'ntas_knowbaseitemcategories' => [
        'entities_id',
    ],
    'ntas_knowbaseitems_items' => [
        'item',
        'itemtype',
        'item_id',
    ],
    'ntas_networknames' => [
        'name',
    ],
    'ntas_networkports' => [
        'on_device',
    ],
    'ntas_notifications_notificationtemplates' => [
        'notifications_id',
    ],
    'ntas_olalevels_tickets' => [
        'tickets_id',
    ],
    'ntas_problemtemplatehiddenfields' => [
        'problemtemplates_id',
    ],
    'ntas_problemtemplatemandatoryfields' => [
        'problemtemplates_id',
    ],
    'ntas_reservations' => [
        'reservationitems_id',
    ],
    'ntas_slalevels_tickets' => [
        'tickets_id',
    ],
    'ntas_tickettemplatehiddenfields' => [
        'tickettemplates_id',
    ],
    'ntas_tickettemplatemandatoryfields' => [
        'tickettemplates_id',
    ],
];
foreach ($useless_keys as $table => $keys) {
    foreach ($keys as $key) {
        $migration->dropKey($table, $key);
        $migration->migrationOneTable($table);
    }
}

// Add missing keys (based on tools:check_database_keys detection)
$missing_keys = [
    'ntas_apiclients' => [
        'entities_id',
        'is_recursive',
        'name',
    ],
    'ntas_appliances' => [
        'date_mod',
        'is_recursive',
    ],
    'ntas_appliancetypes' => [
        'is_recursive',
    ],
    'ntas_authldapreplicates' => [
        'name',
    ],
    'ntas_authldaps' => [
        'name',
    ],
    'ntas_authmails' => [
        'name',
    ],
    'ntas_blacklistedmailcontents' => [
        'name',
    ],
    'ntas_businesscriticities' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_calendarsegments' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_cartridgeitems' => [
        'is_recursive',
    ],
    'ntas_certificates' => [
        'is_recursive',
    ],
    'ntas_clusters' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_computerantiviruses' => [
        'manufacturers_id',
    ],
    'ntas_computervirtualmachines' => [
        'virtualmachinetypes_id',
    ],
    'ntas_configs' => [
        'name',
    ],
    'ntas_consumableitems' => [
        'is_recursive',
    ],
    'ntas_contacts' => [
        'is_recursive',
    ],
    'ntas_contracts' => [
        'is_recursive',
        'is_template',
    ],
    'ntas_crontasks' => [
        'name',
    ],
    'ntas_dashboards_dashboards' => [
        'name',
    ],
    'ntas_dashboards_rights' => [
        'item' => ['itemtype', 'items_id'],
    ],
    'ntas_datacenters' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_dcrooms' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_devicesensors' => [
        'devicesensormodels_id',
    ],
    'ntas_documents' => [
        'is_recursive',
    ],
    'ntas_documents_items' => [
        'entities_id',
        'is_recursive',
        'date_mod',
    ],
    'ntas_domainrecords' => [
        'is_recursive',
    ],
    'ntas_domainrecordtypes' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_domainrelations' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_domains' => [
        'is_recursive',
    ],
    'ntas_domaintypes' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_enclosures' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_entities' => [
        'authldaps_id',
        'calendars_id',
        'entities_id_software',
        'name',
    ],
    'ntas_fieldblacklists' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_fieldunicities' => [
        'entities_id',
        'is_active',
        'is_recursive',
        'name',
    ],
    'ntas_groups' => [
        'is_recursive',
    ],
    'ntas_groups_users' => [
        'is_dynamic',
    ],
    'ntas_holidays' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_impactcompounds' => [
        'name',
    ],
    'ntas_ipaddresses' => [
        'name',
    ],
    'ntas_ipnetworks' => [
        'ipnetworks_id',
        'is_recursive',
    ],
    'ntas_ipnetworks_vlans' => [
        'vlans_id',
    ],
    'ntas_items_devicebatteries' => [
        'locations_id',
        'states_id',
    ],
    'ntas_items_devicefirmwares' => [
        'locations_id',
        'states_id',
    ],
    'ntas_items_devicegenerics' => [
        'locations_id',
        'states_id',
    ],
    'ntas_items_devicesensors' => [
        'locations_id',
        'states_id',
    ],
    'ntas_items_kanbans' => [
        'users_id',
        'date_creation',
        'date_mod',
    ],
    'ntas_items_operatingsystems' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_items_softwareversions' => [
        'is_deleted',
        'is_deleted_item',
        'is_template_item',
    ],
    'ntas_itilsolutions' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_knowbaseitemcategories' => [
        'knowbaseitemcategories_id',
    ],
    'ntas_knowbaseitems_comments' => [
        'knowbaseitems_id',
        'parent_comment_id',
        'users_id',
        'date_creation',
        'date_mod',
    ],
    'ntas_knowbaseitems_items' => [
        'knowbaseitems_id',
        'date_creation',
        'date_mod',
    ],
    'ntas_knowbaseitems_revisions' => [
        'users_id',
    ],
    'ntas_knowbaseitemtranslations' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_lines' => [
        'is_deleted',
        'groups_id',
        'linetypes_id',
        'locations_id',
        'states_id',
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_links' => [
        'is_recursive',
        'name',
    ],
    'ntas_mailcollectors' => [
        'name',
    ],
    'ntas_manuallinks' => [
        'name',
    ],
    'ntas_monitors' => [
        'date_mod',
    ],
    'ntas_networkaliases' => [
        'fqdns_id',
    ],
    'ntas_networkequipments' => [
        'is_recursive',
    ],
    'ntas_networkports' => [
        'name',
    ],
    'ntas_networkportwifis' => [
        'networkportwifis_id',
    ],
    'ntas_objectlocks' => [
        'users_id',
    ],
    'ntas_olalevels' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_olas' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_operatingsystemeditions' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_operatingsystemkernels' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_operatingsystemkernelversions' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_passivedcequipments' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_pdumodels' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_pdus' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_pdus_plugs' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_pdus_racks' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_planningexternalevents' => [
        'name',
    ],
    'ntas_planningexternaleventtemplates' => [
        'name',
    ],
    'ntas_plugins' => [
        'name',
    ],
    'ntas_printers' => [
        'is_recursive',
    ],
    'ntas_profilerights' => [
        'name',
    ],
    'ntas_profiles' => [
        'name',
    ],
    'ntas_projects' => [
        'is_deleted',
    ],
    'ntas_queuednotifications' => [
        'notificationtemplates_id',
    ],
    'ntas_rackmodels' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_racks' => [
        'date_creation',
        'date_mod',
        'name',
    ],
    'ntas_recurrentchanges' => [
        'calendars_id',
        'name',
    ],
    'ntas_refusedequipments' => [
        'name',
    ],
    'ntas_registeredids' => [
        'item' => ['itemtype', 'items_id'],
    ],
    'ntas_remindertranslations' => [
        'date_creation',
        'date_mod',
    ],
    'ntas_reminders' => [
        'name',
    ],
    'ntas_rulerightparameters' => [
        'name',
    ],
    'ntas_rules' => [
        'name',
    ],
    'ntas_savedsearches' => [
        'name',
    ],
    'ntas_softwarecategories' => [
        'name',
    ],
    'ntas_softwarelicenses' => [
        'is_recursive',
        'softwarelicenses_id',
    ],
    'ntas_softwarelicensetypes' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_softwares' => [
        'is_recursive',
    ],
    'ntas_slalevels' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_slas' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_ssovariables' => [
        'name',
    ],
    'ntas_states' => [
        'entities_id',
        'is_recursive',
    ],
    'ntas_suppliers' => [
        'is_recursive',
    ],
    'ntas_ticketrecurrents' => [
        'calendars_id',
        'name',
    ],
    'ntas_tickets_tickets' => [
        'tickets_id_2',
    ],
    'ntas_transfers' => [
        'name',
    ],
    'ntas_users' => [
        'auths_id',
        'default_requesttypes_id',
    ],
    'ntas_virtualmachinestates' => [
        'name',
    ],
    'ntas_virtualmachinesystems' => [
        'name',
    ],
    'ntas_virtualmachinetypes' => [
        'name',
    ],
    'ntas_vlans' => [
        'is_recursive',
    ],
    'ntas_wifinetworks' => [
        'is_recursive',
    ],
];
foreach ($missing_keys as $table => $fields) {
    foreach ($fields as $key => $field) {
        $migration->addKey($table, $field, is_numeric($key) ? '' : $key);
    }
}

// Add missing `date_creation` field on tables that already have `date_mod` field
$tables = [
    'ntas_apiclients',
    'ntas_appliances',
    'ntas_authmails',
    'ntas_transfers',
];
foreach ($tables as $table) {
    $migration->addField($table, 'date_creation', 'timestamp');
    $migration->addKey($table, 'date_creation');
}

// Add missing `date_mod` field on tables that already have `date_creation` field
$tables = [
    'ntas_lockedfields',
];
foreach ($tables as $table) {
    $migration->addField($table, 'date_mod', 'timestamp');
    $migration->addKey($table, 'date_mod');
}

// Rename `date` fields to `date_creation` when value is just a DB insert timestamp
$tables = [
    'ntas_knowbaseitems',
    'ntas_notepads',
    'ntas_projecttasks',
];
foreach ($tables as $table) {
    if ($DB->fieldExists($table, 'date', false)) {
        $migration->dropKey($table, 'date');
        $migration->migrationOneTable($table);
        $migration->changeField($table, 'date', 'date_creation', 'timestamp');
        $migration->addKey($table, 'date_creation');
    }
}
$migration->changeSearchOption(KnowbaseItem::class, 5, 121);
$migration->changeSearchOption(ProjectTask::class, 15, 121);

// Rename `ntas_objectlocks` `date_mod` to `date`
if ($DB->fieldExists('ntas_objectlocks', 'date_mod', false)) {
    $migration->dropKey('ntas_objectlocks', 'date_mod');
    $migration->migrationOneTable('ntas_objectlocks');
    $migration->changeField('ntas_objectlocks', 'date_mod', 'date', 'timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP');
    $migration->addKey('ntas_objectlocks', 'date');
}

// Rename `date_creation` to `date` when field refers to a valuable date and not just to db insert timestamps
$tables = [
    'ntas_knowbaseitems_revisions',
    'ntas_networkportconnectionlogs',
];
foreach ($tables as $table) {
    if ($DB->fieldExists($table, 'date_creation', false)) {
        $migration->dropKey($table, 'date_creation');
        $migration->migrationOneTable($table);
        $migration->changeField($table, 'date_creation', 'date', 'timestamp');
        $migration->addKey($table, 'date');
    }
}

// Replace -1 default values on entities_id foreign keys (visibility tables)
$tables = [
    'ntas_groups_knowbaseitems',
    'ntas_groups_reminders',
    'ntas_groups_rssfeeds',
    'ntas_knowbaseitems_profiles',
    'ntas_profiles_reminders',
    'ntas_profiles_rssfeeds',
];
foreach ($tables as $table) {
    $migration->addField($table, 'no_entity_restriction', 'boolean', ['update' => 0]);
    $migration->migrationOneTable($table); // Ensure 'no_entity_restriction' is created
    $DB->update(
        $table,
        ['entities_id' => 0, 'no_entity_restriction' => 1],
        ['entities_id' => -1]
    );
    $migration->changeField($table, 'entities_id', 'entities_id', "int {$default_key_sign} DEFAULT NULL");
    $migration->migrationOneTable($table); // Ensure 'entities_id' is nullable
    $DB->update(
        $table,
        ['entities_id' => 'NULL'],
        ['no_entity_restriction' => 1]
    );
}

// Replace -1 default values on ntas_rules.entities_id
$DB->update(
    'ntas_rules',
    ['entities_id' => 0],
    ['entities_id' => -1]
);

// Replace unused -1 default values on entities_id foreign keys
$tables = [
    'ntas_fieldunicities',
    'ntas_savedsearches',
];
foreach ($tables as $table) {
    $migration->changeField($table, 'entities_id', 'entities_id', "int {$default_key_sign} NOT NULL DEFAULT 0");
}

// Replace -1 default values on ntas_queuednotifications.items_id
$DB->update(
    'ntas_queuednotifications',
    ['items_id' => 0],
    ['items_id' => -1]
);
