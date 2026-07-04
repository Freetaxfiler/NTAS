<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\Asset\Asset_PeripheralAsset;
use Glpi\CalDAV\Contracts\CalDAVCompatibleItemInterface;
use Glpi\Socket;

/**
 * Relation constants between tables.
 *
 * This mapping is used for to detect links between objects.
 * For example, it is used to detect if items are associated to another item that
 * is going to be deleted, in order to prevent deletion or ask for user what to do with
 * linked items.
 *
 * Format is:
 * [
 *    'referenced_table_name' => [
 *       'linked_table_name_1' => 'foreign_key_1',
 *       'linked_table_name_2' => ['foreign_key_2', 'foreign_key_3'],
 *       'linked_table_name_2' => [['items_id', 'itemtype']],
 *    ]
 * ]
 * where:
 *  - 'referenced_table_name' is the name of a table having its id referenced in other tables,
 *  - 'linked_table_name_*' is the name of a table that have foreign keys referencing the table 'referenced_table_name',
 *  - 'foreign_key_*' is the name of the field that is a foreign key (can be ['items_id', 'itemtype']).
 *
 * /!\ "_" prefix is used to disable usage check on relations while deleting an item when they are
 *     handled by application.
 *     Applications handle specific usage check and links updates :
 *      - in `CommonDBTM::cleanRelationTable()` method,
 *      - in `$item::cleanDBonPurge()` method,
 *      - using `$forward_entity_to` values,
 *      - by `CommonTreeDropdown` logic for recursive keys.
 *     Relations will still be used to check ability to disable recursivity on an element.
 *
 * /!\ Table's names are in alphabetic order - Please respect it
 *
 * @var array $RELATION
 */
$RELATION = [

    'ntas_agents' => [
        'ntas_refusedequipments' => 'agents_id',
        'ntas_rulematchedlogs'   => 'agents_id',
        'ntas_unmanageds'        => 'agents_id',
    ],

    'ntas_agenttypes' => [
        '_ntas_agents' => 'agenttypes_id',
    ],

    'ntas_applianceenvironments' => [
        'ntas_appliances' => 'applianceenvironments_id',
    ],

    'ntas_appliances'     => [
        '_ntas_appliances_items' => 'appliances_id',
    ],

    'ntas_appliances_items' => [
        '_ntas_appliances_items_relations' => 'appliances_items_id',
    ],

    'ntas_appliancetypes' => [
        'ntas_appliances' => 'appliancetypes_id',
    ],

    'ntas_assets_assetdefinitions' => [
        '_ntas_assets_assets' => 'assets_assetdefinitions_id',
        '_ntas_assets_assetmodels' => 'assets_assetdefinitions_id',
        '_ntas_assets_assettypes' => 'assets_assetdefinitions_id',
        '_ntas_assets_customfielddefinitions' => 'assets_assetdefinitions_id',
    ],

    'ntas_assets_assetmodels' => [
        'ntas_assets_assets' => 'assets_assetmodels_id',
    ],

    'ntas_assets_assettypes' => [
        'ntas_assets_assets' => 'assets_assettypes_id',
    ],

    'ntas_databaseinstancetypes' => [
        'ntas_databaseinstances' => 'databaseinstancetypes_id',
    ],

    'ntas_authldaps' => [
        'ntas_authldapreplicates' => 'authldaps_id',
        'ntas_entities'           => 'authldaps_id',
        'ntas_users'              => 'auths_id',
    ],

    'ntas_authmails' => [
        'ntas_users' => 'auths_id',
    ],

    'ntas_autoupdatesystems' => [
        'ntas_clusters'          => 'autoupdatesystems_id',
        'ntas_computers'         => 'autoupdatesystems_id',
        'ntas_databaseinstances' => 'autoupdatesystems_id',
        'ntas_monitors'          => 'autoupdatesystems_id',
        'ntas_networkequipments' => 'autoupdatesystems_id',
        'ntas_peripherals'       => 'autoupdatesystems_id',
        'ntas_phones'            => 'autoupdatesystems_id',
        'ntas_printers'          => 'autoupdatesystems_id',
        'ntas_refusedequipments' => 'autoupdatesystems_id',
        'ntas_unmanageds'        => 'autoupdatesystems_id',
        'ntas_assets_assets'     => 'autoupdatesystems_id',
    ],

    'ntas_budgets' => [
        'ntas_changecosts'   => 'budgets_id',
        'ntas_contractcosts' => 'budgets_id',
        'ntas_infocoms'      => 'budgets_id',
        'ntas_problemcosts'  => 'budgets_id',
        'ntas_projectcosts'  => 'budgets_id',
        'ntas_ticketcosts'   => 'budgets_id',
    ],

    'ntas_budgettypes' => [
        'ntas_budgets' => 'budgettypes_id',
    ],

    'ntas_businesscriticities' => [
        '_ntas_businesscriticities' => 'businesscriticities_id',
        'ntas_infocoms'             => 'businesscriticities_id',
    ],

    'ntas_cablestrands' => [
        'ntas_cables' => 'cablestrands_id',
    ],

    'ntas_cabletypes' => [
        'ntas_cables' => 'cabletypes_id',
    ],

    'ntas_calendars' => [
        '_ntas_calendars_holidays' => 'calendars_id',
        '_ntas_calendarsegments'   => 'calendars_id',
        'ntas_entities'            => 'calendars_id',
        'ntas_olas'                => 'calendars_id',
        'ntas_slas'                => 'calendars_id',
        'ntas_slms'                => 'calendars_id',
        'ntas_recurrentchanges'    => 'calendars_id',
        'ntas_ticketrecurrents'    => 'calendars_id',
        'ntas_pendingreasons'     => 'calendars_id',
    ],

    'ntas_cartridgeitems' => [
        '_ntas_cartridgeitems_printermodels' => 'cartridgeitems_id',
        '_ntas_cartridges'                   => 'cartridgeitems_id',
    ],

    'ntas_cartridgeitemtypes' => [
        'ntas_cartridgeitems' => 'cartridgeitemtypes_id',
    ],

    'ntas_certificates' => [
        '_ntas_certificates_items' => 'certificates_id',
    ],

    'ntas_certificatetypes' => [
        'ntas_certificates' => 'certificatetypes_id',
    ],

    'ntas_changes' => [
        '_ntas_changecosts'           => 'changes_id',
        '_ntas_changes_changes'       => [
            'changes_id_1',
            'changes_id_2',
        ],
        '_ntas_changes_groups'        => 'changes_id',
        '_ntas_changes_items'         => 'changes_id',
        '_ntas_changes_problems'      => 'changes_id',
        '_ntas_changes_suppliers'     => 'changes_id',
        '_ntas_changes_tickets'       => 'changes_id',
        '_ntas_changes_users'         => 'changes_id',
        '_ntas_changesatisfactions'   => 'changes_id',
        '_ntas_changetasks'           => 'changes_id',
        '_ntas_changevalidations'     => 'changes_id',
        '_ntas_itils_projects'        => [['items_id', 'itemtype']],
        '_ntas_itilfollowups'         => [['items_id', 'itemtype']],
        '_ntas_itils_validationsteps' => [['items_id', 'itemtype']],
        '_ntas_itilsolutions'         => [['items_id', 'itemtype']],
    ],

    'ntas_changetemplates' => [
        'ntas_entities'                        => 'changetemplates_id',
        'ntas_itilcategories'                  => [
            'changetemplates_id',
        ],
        'ntas_changes'                         => 'changetemplates_id',
        '_ntas_changetemplatehiddenfields'     => 'changetemplates_id',
        '_ntas_changetemplatemandatoryfields'  => 'changetemplates_id',
        '_ntas_changetemplatepredefinedfields' => 'changetemplates_id',
        '_ntas_changetemplatereadonlyfields'   => 'changetemplates_id',
        'ntas_profiles'                        => 'changetemplates_id',
        'ntas_recurrentchanges'                => 'changetemplates_id',
    ],

    'ntas_clusters' => [
        '_ntas_items_clusters' => 'clusters_id',
    ],

    'ntas_clustertypes' => [
        'ntas_clusters' => 'clustertypes_id',
    ],

    'ntas_computermodels' => [
        'ntas_computers' => 'computermodels_id',
    ],

    'ntas_computers' => [
        'ntas_networknames' => [['items_id', 'itemtype']], // FIXME Find a list that can be used to declare this polymorphic relation
    ],

    'ntas_computertypes' => [
        'ntas_computers' => 'computertypes_id',
    ],

    'ntas_consumableitems' => [
        '_ntas_consumables' => 'consumableitems_id',
    ],

    'ntas_consumableitemtypes' => [
        'ntas_consumableitems' => 'consumableitemtypes_id',
    ],

    'ntas_contacts' => [
        '_ntas_contacts_suppliers' => 'contacts_id',
    ],

    'ntas_contacttypes' => [
        'ntas_contacts' => 'contacttypes_id',
    ],

    'ntas_contracts' => [
        '_ntas_contractcosts'       => 'contracts_id',
        '_ntas_contracts_items'     => 'contracts_id',
        '_ntas_contracts_suppliers' => 'contracts_id',
        'ntas_entities'             => 'contracts_id_default',
        '_ntas_tickets_contracts'   => 'contracts_id',
        '_ntas_contracts_users'    => 'contracts_id',
    ],

    'ntas_contracttypes' => [
        'ntas_contracts' => 'contracttypes_id',
    ],

    'ntas_crontasklogs' => [
        '_ntas_crontasklogs' => 'crontasklogs_id',
    ],

    'ntas_crontasks' => [
        '_ntas_crontasklogs' => 'crontasks_id',
    ],

    'ntas_dashboards_dashboards' => [
        '_ntas_dashboards_filters' => 'dashboards_dashboards_id',
        '_ntas_dashboards_items'   => 'dashboards_dashboards_id',
        '_ntas_dashboards_rights'  => 'dashboards_dashboards_id',
    ],

    'ntas_databaseinstancecategories' => [
        'ntas_databaseinstances' => 'databaseinstancecategories_id',
    ],

    'ntas_databaseinstances' => [
        'ntas_databases' => 'databaseinstances_id',
    ],

    'ntas_datacenters' => [
        'ntas_dcrooms' => 'datacenters_id',
    ],

    'ntas_dcrooms' => [
        'ntas_racks' => 'dcrooms_id',
    ],

    'ntas_devicebatteries' => [
        'ntas_items_devicebatteries' => 'devicebatteries_id',
    ],

    'ntas_devicebatterymodels' => [
        'ntas_devicebatteries' => 'devicebatterymodels_id',
    ],

    'ntas_devicecameramodels' => [
        'ntas_devicecameras' => 'devicecameramodels_id',
    ],

    'ntas_devicecameras' => [
        'ntas_items_devicecameras' => 'devicecameras_id',
    ],

    'ntas_devicebatterytypes' => [
        'ntas_devicebatteries' => 'devicebatterytypes_id',
    ],

    'ntas_devicecasemodels' => [
        'ntas_devicecases' => 'devicecasemodels_id',
    ],

    'ntas_devicecases' => [
        'ntas_items_devicecases' => 'devicecases_id',
    ],

    'ntas_devicecasetypes' => [
        'ntas_devicecases' => 'devicecasetypes_id',
    ],

    'ntas_devicecontrolmodels' => [
        'ntas_devicecontrols' => 'devicecontrolmodels_id',
    ],

    'ntas_devicecontrols' => [
        'ntas_items_devicecontrols' => 'devicecontrols_id',
    ],

    'ntas_devicedrivemodels' => [
        'ntas_devicedrives' => 'devicedrivemodels_id',
    ],

    'ntas_devicedrives' => [
        'ntas_items_devicedrives' => 'devicedrives_id',
    ],

    'ntas_devicefirmwaremodels' => [
        'ntas_devicefirmwares' => 'devicefirmwaremodels_id',
    ],

    'ntas_devicefirmwares' => [
        'ntas_items_devicefirmwares' => 'devicefirmwares_id',
    ],

    'ntas_devicefirmwaretypes' => [
        'ntas_devicefirmwares' => 'devicefirmwaretypes_id',
    ],

    'ntas_devicegenericmodels' => [
        'ntas_devicegenerics' => 'devicegenericmodels_id',
    ],

    'ntas_devicegenerics' => [
        'ntas_items_devicegenerics' => 'devicegenerics_id',
    ],

    'ntas_devicegenerictypes' => [
        'ntas_devicegenerics' => 'devicegenerictypes_id',
    ],

    'ntas_devicegraphiccardmodels' => [
        'ntas_devicegraphiccards' => 'devicegraphiccardmodels_id',
    ],

    'ntas_devicegraphiccards' => [
        'ntas_items_devicegraphiccards' => 'devicegraphiccards_id',
    ],

    'ntas_deviceharddrivemodels' => [
        'ntas_deviceharddrives' => 'deviceharddrivemodels_id',
    ],

    'ntas_deviceharddrivetypes' => [
        'ntas_deviceharddrives' => 'deviceharddrivetypes_id',
    ],

    'ntas_deviceharddrives' => [
        'ntas_items_deviceharddrives' => 'deviceharddrives_id',
    ],

    'ntas_devicememories' => [
        'ntas_items_devicememories' => 'devicememories_id',
    ],

    'ntas_devicememorymodels' => [
        'ntas_devicememories' => 'devicememorymodels_id',
    ],

    'ntas_devicememorytypes' => [
        'ntas_devicememories' => 'devicememorytypes_id',
    ],

    'ntas_devicemotherboardmodels' => [
        'ntas_devicemotherboards' => 'devicemotherboardmodels_id',
    ],

    'ntas_devicemotherboards' => [
        'ntas_items_devicemotherboards' => 'devicemotherboards_id',
    ],

    'ntas_devicenetworkcardmodels' => [
        'ntas_devicenetworkcards' => 'devicenetworkcardmodels_id',
        'ntas_devicepcis'         => 'devicenetworkcardmodels_id', // FIXME This field should probably removed
    ],

    'ntas_devicenetworkcards' => [
        'ntas_items_devicenetworkcards' => 'devicenetworkcards_id',
    ],

    'ntas_devicepcimodels' => [
        'ntas_devicepcis' => 'devicepcimodels_id',
    ],

    'ntas_devicepcis' => [
        'ntas_items_devicepcis' => 'devicepcis_id',
    ],

    'ntas_devicepowersupplies' => [
        'ntas_items_devicepowersupplies' => 'devicepowersupplies_id',
    ],

    'ntas_devicepowersupplymodels' => [
        'ntas_devicepowersupplies' => 'devicepowersupplymodels_id',
    ],

    'ntas_deviceprocessormodels' => [
        'ntas_deviceprocessors' => 'deviceprocessormodels_id',
    ],

    'ntas_deviceprocessors' => [
        'ntas_items_deviceprocessors' => 'deviceprocessors_id',
    ],

    'ntas_devicesensormodels' => [
        'ntas_devicesensors' => 'devicesensormodels_id',
    ],

    'ntas_devicesensors' => [
        'ntas_items_devicesensors' => 'devicesensors_id',
    ],

    'ntas_devicesensortypes' => [
        'ntas_devicesensors' => 'devicesensortypes_id',
    ],

    'ntas_devicesimcards' => [
        'ntas_items_devicesimcards' => 'devicesimcards_id',
    ],

    'ntas_devicesimcardtypes' => [
        'ntas_devicesimcards' => 'devicesimcardtypes_id',
    ],

    'ntas_devicesoundcardmodels' => [
        'ntas_devicesoundcards' => 'devicesoundcardmodels_id',
    ],

    'ntas_devicesoundcards' => [
        'ntas_items_devicesoundcards' => 'devicesoundcards_id',
    ],

    'ntas_documentcategories' => [
        'ntas_documentcategories' => 'documentcategories_id',
        'ntas_documents'          => 'documentcategories_id',
    ],

    'ntas_documents' => [
        '_ntas_documents_items' => 'documents_id',
    ],

    'ntas_domainrelations' => [
        'ntas_domains_items' => 'domainrelations_id',
    ],

    'ntas_domains'    => [
        '_ntas_domainrecords' => 'domains_id',
        '_ntas_domains_items' => 'domains_id',
    ],

    'ntas_domaintypes' => [
        'ntas_domains'  => 'domaintypes_id',
    ],

    'ntas_domainrecordtypes'    => [
        'ntas_domainrecords'  => 'domainrecordtypes_id',
    ],

    'ntas_dropdowns_dropdowndefinitions' => [
        '_ntas_dropdowns_dropdowns' => 'dropdowns_dropdowndefinitions_id',
    ],

    'ntas_dropdowns_dropdowns' => [
        'ntas_dropdowns_dropdowns' => 'dropdowns_dropdowns_id',
    ],

    'ntas_enclosuremodels' => [
        'ntas_enclosures' => 'enclosuremodels_id',
    ],

    'ntas_enclosures' => [
        '_ntas_items_enclosures' => 'enclosures_id',
    ],

    'ntas_entities' => [
        'ntas_agents'                      => 'entities_id',
        'ntas_apiclients'                  => 'entities_id',
        'ntas_appliances'                  => 'entities_id',
        'ntas_appliancetypes'              => 'entities_id',
        'ntas_assets_assets'               => 'entities_id',
        'ntas_budgets'                     => 'entities_id',
        'ntas_businesscriticities'         => 'entities_id',
        'ntas_cables'                      => 'entities_id',
        'ntas_calendars'                   => 'entities_id',
        '_ntas_calendarsegments'           => 'entities_id',
        'ntas_cartridgeitems'              => 'entities_id',
        '_ntas_cartridges'                 => 'entities_id',
        'ntas_certificates'                => 'entities_id',
        'ntas_certificatetypes'            => 'entities_id',
        '_ntas_changecosts'                => 'entities_id',
        'ntas_changes'                     => 'entities_id',
        'ntas_changetemplates'             => 'entities_id',
        '_ntas_changevalidations'          => 'entities_id',
        'ntas_clusters'                    => 'entities_id',
        'ntas_clustertypes'                => 'entities_id',
        'ntas_computers'                   => 'entities_id',
        'ntas_dropdowns_dropdowns'         => 'entities_id',
        'ntas_consumableitems'             => 'entities_id',
        '_ntas_consumables'                => 'entities_id',
        'ntas_contacts'                    => 'entities_id',
        '_ntas_contractcosts'              => 'entities_id',
        'ntas_contracts'                   => 'entities_id',
        'ntas_databaseinstances'           => 'entities_id',
        '_ntas_databases'                  => 'entities_id', // forwarded by Database
        'ntas_datacenters'                 => 'entities_id',
        'ntas_dcrooms'                     => 'entities_id',
        'ntas_devicebatteries'             => 'entities_id',
        'ntas_devicecameras'               => 'entities_id',
        'ntas_devicecases'                 => 'entities_id',
        'ntas_devicecontrols'              => 'entities_id',
        'ntas_devicedrives'                => 'entities_id',
        'ntas_devicefirmwares'             => 'entities_id',
        'ntas_devicegenerics'              => 'entities_id',
        'ntas_devicegraphiccards'          => 'entities_id',
        'ntas_deviceharddrives'            => 'entities_id',
        'ntas_devicememories'              => 'entities_id',
        'ntas_devicemotherboards'          => 'entities_id',
        'ntas_devicenetworkcards'          => 'entities_id',
        'ntas_devicepcis'                  => 'entities_id',
        'ntas_devicepowersupplies'         => 'entities_id',
        'ntas_deviceprocessors'            => 'entities_id',
        'ntas_devicesensors'               => 'entities_id',
        'ntas_devicesimcards'              => 'entities_id',
        'ntas_devicesoundcards'            => 'entities_id',
        'ntas_documents'                   => 'entities_id',
        '_ntas_documents_items'            => 'entities_id',
        'ntas_domainrelations'             => 'entities_id',
        'ntas_domainrecords'               => 'entities_id',
        'ntas_domainrecordtypes'           => 'entities_id',
        'ntas_domains'                     => 'entities_id',
        'ntas_domaintypes'                 => 'entities_id',
        'ntas_enclosures'                  => 'entities_id',
        '_ntas_entities'                   => 'entities_id',
        'ntas_entities'                    => 'entities_id_software',
        '_ntas_entities_knowbaseitems'     => 'entities_id',
        '_ntas_entities_reminders'         => 'entities_id',
        '_ntas_entities_rssfeeds'          => 'entities_id',
        'ntas_fieldblacklists'             => 'entities_id',
        'ntas_fieldunicities'              => 'entities_id',
        'ntas_forms_forms'                 => 'entities_id',
        'ntas_forms_answerssets'           => 'entities_id',
        'ntas_fqdns'                       => 'entities_id',
        'ntas_groups'                      => 'entities_id',
        'ntas_groups_knowbaseitems'        => 'entities_id',
        'ntas_groups_reminders'            => 'entities_id',
        'ntas_groups_rssfeeds'             => 'entities_id',
        'ntas_holidays'                    => 'entities_id',
        'ntas_imageformats'                => 'entities_id',
        'ntas_imageresolutions'            => 'entities_id',
        '_ntas_infocoms'                   => 'entities_id',
        'ntas_ipaddresses'                 => 'entities_id',
        'ntas_ipnetworks'                  => 'entities_id',
        '_ntas_items_devicebatteries'      => 'entities_id',
        '_ntas_items_devicecases'          => 'entities_id',
        '_ntas_items_devicecameras'        => 'entities_id', // forwarded by DeviceCamera
        '_ntas_items_devicecontrols'       => 'entities_id',
        '_ntas_items_devicedrives'         => 'entities_id',
        '_ntas_items_devicefirmwares'      => 'entities_id',
        '_ntas_items_devicegenerics'       => 'entities_id',
        '_ntas_items_devicegraphiccards'   => 'entities_id',
        '_ntas_items_deviceharddrives'     => 'entities_id',
        '_ntas_items_devicememories'       => 'entities_id',
        '_ntas_items_devicemotherboards'   => 'entities_id',
        '_ntas_items_devicenetworkcards'   => 'entities_id',
        '_ntas_items_devicepcis'           => 'entities_id',
        '_ntas_items_devicepowersupplies'  => 'entities_id',
        '_ntas_items_deviceprocessors'     => 'entities_id',
        '_ntas_items_devicesensors'        => 'entities_id',
        '_ntas_items_devicesimcards'       => 'entities_id',
        '_ntas_items_devicesoundcards'     => 'entities_id',
        '_ntas_items_disks'                => 'entities_id',
        '_ntas_items_operatingsystems'     => 'entities_id',
        '_ntas_items_softwareversions'     => 'entities_id',
        '_ntas_itemvirtualmachines'        => 'entities_id',
        'ntas_itilcategories'              => 'entities_id',
        'ntas_itilfollowuptemplates'       => 'entities_id',
        'ntas_itilvalidationtemplates'     => 'entities_id',
        'ntas_knowbaseitemcategories'      => 'entities_id',
        'ntas_knowbaseitems'               => 'entities_id',
        'ntas_knowbaseitems_profiles'      => 'entities_id',
        'ntas_lineoperators'               => 'entities_id',
        'ntas_lines'                       => 'entities_id',
        'ntas_links'                       => 'entities_id',
        'ntas_locations'                   => 'entities_id',
        'ntas_monitors'                    => 'entities_id',
        '_ntas_networkaliases'             => 'entities_id',
        'ntas_networkequipments'           => 'entities_id',
        'ntas_networknames'                => 'entities_id',
        '_ntas_networkports'               => 'entities_id',
        'ntas_networkporttypes'            => 'entities_id',
        'ntas_notifications'               => 'entities_id',
        '_ntas_olalevels'                  => 'entities_id',
        '_ntas_olas'                       => 'entities_id',
        'ntas_passivedcequipments'         => 'entities_id',
        'ntas_pcivendors'                  => 'entities_id',
        'ntas_pdus'                        => 'entities_id',
        'ntas_pdutypes'                    => 'entities_id',
        'ntas_pendingreasons'              => 'entities_id',
        'ntas_peripherals'                 => 'entities_id',
        'ntas_phones'                      => 'entities_id',
        'ntas_planningexternalevents'      => 'entities_id',
        'ntas_planningexternaleventtemplates' => 'entities_id',
        'ntas_printers'                    => 'entities_id',
        '_ntas_problemcosts'               => 'entities_id',
        'ntas_problems'                    => 'entities_id',
        'ntas_problemtemplates'            => 'entities_id',
        'ntas_profiles_reminders'          => 'entities_id',
        'ntas_profiles_rssfeeds'           => 'entities_id',
        '_ntas_profiles_users'             => 'entities_id',
        '_ntas_projectcosts'               => 'entities_id',
        'ntas_projects'                    => 'entities_id',
        '_ntas_projecttasks'               => 'entities_id',
        'ntas_projecttasktemplates'        => 'entities_id',
        'ntas_queuednotifications'         => 'entities_id',
        'ntas_racks'                       => 'entities_id',
        'ntas_racktypes'                   => 'entities_id',
        'ntas_recurrentchanges'            => 'entities_id',
        'ntas_refusedequipments'           => 'entities_id',
        '_ntas_reservationitems'           => 'entities_id',
        'ntas_rules'                       => 'entities_id',
        'ntas_savedsearches'               => 'entities_id',
        '_ntas_slalevels'                  => 'entities_id',
        '_ntas_slas'                       => 'entities_id',
        'ntas_slms'                        => 'entities_id',
        'ntas_softwarelicenses'            => 'entities_id',
        'ntas_softwarelicensetypes'        => 'entities_id',
        'ntas_softwares'                   => 'entities_id',
        '_ntas_softwareversions'           => 'entities_id',
        'ntas_solutiontemplates'           => 'entities_id',
        'ntas_solutiontypes'               => 'entities_id',
        'ntas_states'                      => 'entities_id',
        'ntas_suppliers'                   => 'entities_id',
        'ntas_taskcategories'              => 'entities_id',
        'ntas_tasktemplates'               => 'entities_id',
        '_ntas_ticketcosts'                => 'entities_id',
        'ntas_ticketrecurrents'            => 'entities_id',
        'ntas_tickets'                     => 'entities_id',
        'ntas_tickettemplates'             => 'entities_id',
        '_ntas_ticketvalidations'          => 'entities_id',
        'ntas_unmanageds'                  => 'entities_id',
        'ntas_usbvendors'                  => 'entities_id',
        'ntas_users'                       => 'entities_id',
        'ntas_vlans'                       => 'entities_id',
        'ntas_wifinetworks'                => 'entities_id',
        'ntas_webhooks'                    => 'entities_id',
        'ntas_queuedwebhooks'              => 'entities_id',
    ],

    'ntas_filesystems' => [
        'ntas_items_disks' => 'filesystems_id',
    ],

    'ntas_forms_answerssets' => [
        "_ntas_forms_destinations_answerssets_formdestinationitems" => "forms_answerssets_id",
    ],

    'ntas_forms_categories' => [
        'ntas_forms_categories' => 'forms_categories_id',
        'ntas_forms_forms' => 'forms_categories_id',
        'ntas_knowbaseitems' => 'forms_categories_id',
    ],

    'ntas_forms_forms' => [
        "_ntas_forms_accesscontrols_formaccesscontrols" => "forms_forms_id",
        "_ntas_forms_answerssets"                       => "forms_forms_id",
        "_ntas_forms_destinations_formdestinations"     => "forms_forms_id",
        "_ntas_forms_sections"                          => "forms_forms_id",
        "_ntas_helpdesks_tiles_formtiles"               => "forms_forms_id",
    ],

    'ntas_forms_sections' => [
        "_ntas_forms_questions" => "forms_sections_id",
        "_ntas_forms_comments" => "forms_sections_id",
    ],

    'ntas_fqdns' => [
        'ntas_networkaliases' => 'fqdns_id',
        'ntas_networknames'   => 'fqdns_id',
    ],

    'ntas_groups' => [
        '_ntas_changes_groups'       => 'groups_id',
        'ntas_changetasks'           => 'groups_id_tech',
        'ntas_groups'                => 'groups_id',
        '_ntas_groups_items'         => 'groups_id',
        '_ntas_groups_knowbaseitems' => 'groups_id',
        '_ntas_groups_problems'      => 'groups_id',
        '_ntas_groups_reminders'     => 'groups_id',
        '_ntas_groups_rssfeeds'      => 'groups_id',
        '_ntas_groups_tickets'       => 'groups_id',
        '_ntas_groups_users'         => 'groups_id',
        'ntas_itilcategories'        => 'groups_id',
        'ntas_planningexternalevents' => 'groups_id',
        'ntas_problemtasks'           => 'groups_id_tech',
        'ntas_projects'               => 'groups_id',
        'ntas_tasktemplates'          => 'groups_id_tech',
        'ntas_tickettasks'            => 'groups_id_tech',
        'ntas_users'                  => 'groups_id',
        'ntas_itilvalidationtemplates_targets' => 'groups_id',
    ],

    'ntas_holidays' => [
        '_ntas_calendars_holidays' => 'holidays_id',
    ],

    'ntas_imageformats' => [
        '_ntas_items_devicecameras_imageformats' => 'imageformats_id',
    ],

    'ntas_imageresolutions' => [
        '_ntas_items_devicecameras_imageresolutions' => 'imageresolutions_id',
    ],

    'ntas_impactcontexts' => [
        'ntas_impactitems' => 'impactcontexts_id',
    ],

    'ntas_interfacetypes' => [
        'ntas_devicecontrols'     => 'interfacetypes_id',
        'ntas_devicedrives'       => 'interfacetypes_id',
        'ntas_devicegraphiccards' => 'interfacetypes_id',
        'ntas_deviceharddrives'   => 'interfacetypes_id',
    ],

    'ntas_ipaddresses' => [
        '_ntas_ipaddresses_ipnetworks' => 'ipaddresses_id',
    ],

    'ntas_ipnetworks' => [
        '_ntas_ipaddresses_ipnetworks' => 'ipnetworks_id',
        'ntas_networknames'            => 'ipnetworks_id',
        'ntas_ipnetworks'              => 'ipnetworks_id',
        '_ntas_ipnetworks_vlans'       => 'ipnetworks_id',
    ],

    'ntas_items_devicecameras' => [
        '_ntas_items_devicecameras_imageformats' => 'items_devicecameras_id',
        '_ntas_items_devicecameras_imageresolutions' => 'items_devicecameras_id',
    ],

    'ntas_items_devicenetworkcards' => [
        'ntas_networkportethernets'     => 'items_devicenetworkcards_id',
        'ntas_networkportfiberchannels' => 'items_devicenetworkcards_id',
        'ntas_networkportwifis'         => 'items_devicenetworkcards_id',
    ],

    'ntas_itilcategories' => [
        'ntas_changes'        => 'itilcategories_id',
        'ntas_itilcategories' => 'itilcategories_id',
        'ntas_problems'       => 'itilcategories_id',
        'ntas_tickets'        => 'itilcategories_id',
    ],

    'ntas_itilfollowups' => [
        'ntas_itilsolutions' => 'itilfollowups_id',
    ],

    'ntas_itilfollowuptemplates' => [
        'ntas_pendingreasons' => 'itilfollowuptemplates_id',
    ],

    'ntas_itilvalidationtemplates' => [
        '_ntas_itilvalidationtemplates_targets' => 'itilvalidationtemplates_id',
        'ntas_changevalidations' => 'itilvalidationtemplates_id',
        'ntas_ticketvalidations' => 'itilvalidationtemplates_id',
    ],

    'ntas_itils_validationsteps' => [
        'ntas_ticketvalidations' => 'itils_validationsteps_id',
        'ntas_changevalidations' => 'itils_validationsteps_id',
    ],

    'ntas_knowbaseitemcategories' => [
        'ntas_itilcategories'            => 'knowbaseitemcategories_id',
        'ntas_knowbaseitemcategories'    => 'knowbaseitemcategories_id',
        '_ntas_knowbaseitems_knowbaseitemcategories' => 'knowbaseitemcategories_id',
        'ntas_taskcategories'            => 'knowbaseitemcategories_id',
    ],

    'ntas_knowbaseitems' => [
        '_ntas_entities_knowbaseitems'   => 'knowbaseitems_id',
        '_ntas_groups_knowbaseitems'     => 'knowbaseitems_id',
        '_ntas_knowbaseitems_comments'   => 'knowbaseitems_id',
        '_ntas_knowbaseitems_items'      => 'knowbaseitems_id',
        '_ntas_knowbaseitems_profiles'   => 'knowbaseitems_id',
        '_ntas_knowbaseitems_revisions'  => 'knowbaseitems_id',
        '_ntas_knowbaseitems_users'      => 'knowbaseitems_id',
        '_ntas_knowbaseitemtranslations' => 'knowbaseitems_id',
        '_ntas_knowbaseitems_knowbaseitemcategories' => 'knowbaseitems_id',
    ],

    'ntas_knowbaseitems_comments' => [
        'ntas_knowbaseitems_comments' => 'parent_comment_id',
    ],

    'ntas_lineoperators' => [
        'ntas_lines' => 'lineoperators_id',
    ],

    'ntas_lines' => [
        'ntas_items_devicesimcards' => 'lines_id',
        '_ntas_items_lines' => 'lines_id',
    ],

    'ntas_linetypes' => [
        'ntas_lines' => 'linetypes_id',
    ],

    'ntas_links' => [
        '_ntas_links_itemtypes' => 'links_id',
    ],

    'ntas_locations' => [
        'ntas_appliances'                => 'locations_id',
        'ntas_assets_assets'             => 'locations_id',
        'ntas_budgets'                   => 'locations_id',
        'ntas_cartridgeitems'            => 'locations_id',
        'ntas_certificates'              => 'locations_id',
        'ntas_changes'                   => 'locations_id',
        'ntas_computers'                 => 'locations_id',
        'ntas_contracts'                 => 'locations_id',
        'ntas_consumableitems'           => 'locations_id',
        'ntas_databaseinstances'         => 'locations_id',
        'ntas_datacenters'               => 'locations_id',
        'ntas_dcrooms'                   => 'locations_id',
        'ntas_devicegenerics'            => 'locations_id',
        'ntas_devicesensors'             => 'locations_id',
        'ntas_enclosures'                => 'locations_id',
        'ntas_items_devicebatteries'     => 'locations_id',
        'ntas_items_devicecameras'       => 'locations_id',
        'ntas_items_devicecases'         => 'locations_id',
        'ntas_items_devicecontrols'      => 'locations_id',
        'ntas_items_devicedrives'        => 'locations_id',
        'ntas_items_devicefirmwares'     => 'locations_id',
        'ntas_items_devicegenerics'      => 'locations_id',
        'ntas_items_devicegraphiccards'  => 'locations_id',
        'ntas_items_deviceharddrives'    => 'locations_id',
        'ntas_items_devicememories'      => 'locations_id',
        'ntas_items_devicemotherboards'  => 'locations_id',
        'ntas_items_devicenetworkcards'  => 'locations_id',
        'ntas_items_devicepcis'          => 'locations_id',
        'ntas_items_devicepowersupplies' => 'locations_id',
        'ntas_items_deviceprocessors'    => 'locations_id',
        'ntas_items_devicesensors'       => 'locations_id',
        'ntas_items_devicesimcards'      => 'locations_id',
        'ntas_items_devicesoundcards'    => 'locations_id',
        'ntas_lines'                     => 'locations_id',
        'ntas_locations'                 => 'locations_id',
        'ntas_monitors'                  => 'locations_id',
        'ntas_networkequipments'         => 'locations_id',
        'ntas_passivedcequipments'       => 'locations_id',
        'ntas_pdus'                      => 'locations_id',
        'ntas_peripherals'               => 'locations_id',
        'ntas_phones'                    => 'locations_id',
        'ntas_printers'                  => 'locations_id',
        'ntas_problems'                  => 'locations_id',
        'ntas_racks'                     => 'locations_id',
        'ntas_sockets'                   => 'locations_id',
        'ntas_softwarelicenses'          => 'locations_id',
        'ntas_softwares'                 => 'locations_id',
        'ntas_tickets'                   => 'locations_id',
        'ntas_unmanageds'                => 'locations_id',
        'ntas_users'                     => 'locations_id',
    ],

    'ntas_mailcollectors' => [
        'ntas_notimportedemails' => 'mailcollectors_id',
    ],

    'ntas_manufacturers' => [
        'ntas_appliances'          => 'manufacturers_id',
        'ntas_assets_assets'       => 'manufacturers_id',
        'ntas_cartridgeitems'      => 'manufacturers_id',
        'ntas_certificates'        => 'manufacturers_id',
        'ntas_itemantiviruses'    => 'manufacturers_id',
        'ntas_computers'           => 'manufacturers_id',
        'ntas_consumableitems'     => 'manufacturers_id',
        'ntas_databaseinstances'   => 'manufacturers_id',
        'ntas_devicebatteries'     => 'manufacturers_id',
        'ntas_devicecameras'       => 'manufacturers_id',
        'ntas_devicecases'         => 'manufacturers_id',
        'ntas_devicecontrols'      => 'manufacturers_id',
        'ntas_devicedrives'        => 'manufacturers_id',
        'ntas_devicefirmwares'     => 'manufacturers_id',
        'ntas_devicegenerics'      => 'manufacturers_id',
        'ntas_devicegraphiccards'  => 'manufacturers_id',
        'ntas_deviceharddrives'    => 'manufacturers_id',
        'ntas_devicememories'      => 'manufacturers_id',
        'ntas_devicemotherboards'  => 'manufacturers_id',
        'ntas_devicenetworkcards'  => 'manufacturers_id',
        'ntas_devicepcis'          => 'manufacturers_id',
        'ntas_devicepowersupplies' => 'manufacturers_id',
        'ntas_deviceprocessors'    => 'manufacturers_id',
        'ntas_devicesensors'       => 'manufacturers_id',
        'ntas_devicesimcards'      => 'manufacturers_id',
        'ntas_devicesoundcards'    => 'manufacturers_id',
        'ntas_enclosures'          => 'manufacturers_id',
        'ntas_monitors'            => 'manufacturers_id',
        'ntas_networkequipments'   => 'manufacturers_id',
        'ntas_passivedcequipments' => 'manufacturers_id',
        'ntas_pdus'                => 'manufacturers_id',
        'ntas_peripherals'         => 'manufacturers_id',
        'ntas_phones'              => 'manufacturers_id',
        'ntas_printers'            => 'manufacturers_id',
        'ntas_racks'               => 'manufacturers_id',
        'ntas_softwarelicenses'    => 'manufacturers_id',
        'ntas_softwares'           => 'manufacturers_id',
        'ntas_unmanageds'          => 'manufacturers_id',
    ],

    'ntas_monitormodels' => [
        'ntas_monitors' => 'monitormodels_id',
    ],

    'ntas_monitortypes' => [
        'ntas_monitors' => 'monitortypes_id',
    ],

    'ntas_networkequipmentmodels' => [
        'ntas_networkequipments' => 'networkequipmentmodels_id',
    ],

    'ntas_networkequipmenttypes' => [
        'ntas_networkequipments' => 'networkequipmenttypes_id',
    ],

    'ntas_networknames' => [
        '_ntas_networkaliases' => 'networknames_id',
    ],

    'ntas_networkportfiberchanneltypes' => [
        'ntas_networkportfiberchannels' => 'networkportfiberchanneltypes_id',
    ],

    'ntas_networkports' => [
        '_ntas_networkportaggregates'     => 'networkports_id',
        '_ntas_networkportaliases'        => 'networkports_id',
        'ntas_networkportaliases'         => 'networkports_id_alias',
        '_ntas_networkportconnectionlogs'  => [
            'networkports_id_destination',
            'networkports_id_source',
        ],
        '_ntas_networkportdialups'        => 'networkports_id',
        '_ntas_networkportethernets'      => 'networkports_id',
        '_ntas_networkportfiberchannels'  => 'networkports_id',
        '_ntas_networkportlocals'         => 'networkports_id',
        '_ntas_networkportmetrics'        => 'networkports_id',
        '_ntas_networkports_networkports' => [
            'networkports_id_1',
            'networkports_id_2',
        ],
        '_ntas_networkports_vlans'        => 'networkports_id',
        '_ntas_networkportwifis'          => 'networkports_id',
        'ntas_sockets'                    => 'networkports_id',
    ],

    'ntas_networkportwifis' => [
        'ntas_networkportwifis' => 'networkportwifis_id',
    ],

    'ntas_networks' => [
        'ntas_computers'         => 'networks_id',
        'ntas_networkequipments' => 'networks_id',
        'ntas_printers'          => 'networks_id',
        'ntas_unmanageds'        => 'networks_id',
    ],

    'ntas_notifications' => [
        '_ntas_notifications_notificationtemplates' => 'notifications_id',
        '_ntas_notificationtargets'                 => 'notifications_id',
    ],

    'ntas_notificationtemplates' => [
        '_ntas_notifications_notificationtemplates' => 'notificationtemplates_id',
        '_ntas_notificationtemplatetranslations'    => 'notificationtemplates_id',
        '_ntas_queuednotifications'                 => 'notificationtemplates_id',
    ],

    'ntas_olalevels' => [
        '_ntas_olalevelactions'   => 'olalevels_id',
        '_ntas_olalevelcriterias' => 'olalevels_id',
        '_ntas_olalevels_tickets' => 'olalevels_id',
        'ntas_tickets'            => 'olalevels_id_ttr',
    ],

    'ntas_olas' => [
        'ntas_olalevels' => 'olas_id',
        'ntas_tickets'   => [
            'olas_id_ttr',
            'olas_id_tto',
        ],
    ],

    'ntas_operatingsystemarchitectures' => [
        'ntas_items_operatingsystems' => 'operatingsystemarchitectures_id',
    ],

    'ntas_operatingsystemeditions' => [
        'ntas_items_operatingsystems' => 'operatingsystemeditions_id',
    ],

    'ntas_operatingsystemkernels' => [
        'ntas_operatingsystemkernelversions' => 'operatingsystemkernels_id',
    ],

    'ntas_operatingsystemkernelversions' => [
        'ntas_items_operatingsystems' => 'operatingsystemkernelversions_id',
    ],

    'ntas_operatingsystems' => [
        'ntas_items_operatingsystems' => 'operatingsystems_id',
        'ntas_softwareversions'        => 'operatingsystems_id',
    ],

    'ntas_operatingsystemservicepacks' => [
        'ntas_items_operatingsystems' => 'operatingsystemservicepacks_id',
    ],

    'ntas_operatingsystemversions' => [
        'ntas_items_operatingsystems' => 'operatingsystemversions_id',
    ],

    'ntas_passivedcequipmentmodels' => [
        'ntas_passivedcequipments' => 'passivedcequipmentmodels_id',
    ],

    'ntas_passivedcequipmenttypes' => [
        'ntas_passivedcequipments' => 'passivedcequipmenttypes_id',
    ],

    'ntas_pendingreasons' => [
        '_ntas_pendingreasons_items' => 'pendingreasons_id',
        'ntas_itilreminders' => 'pendingreasons_id',
        'ntas_itilfollowuptemplates' => 'pendingreasons_id',
        'ntas_tasktemplates' => 'pendingreasons_id',
    ],

    'ntas_pdumodels' => [
        'ntas_pdus' => 'pdumodels_id',
    ],

    'ntas_pdus' => [
        '_ntas_pdus_racks' => 'pdus_id',
    ],

    'ntas_pdutypes' => [
        'ntas_pdus' => 'pdutypes_id',
    ],

    'ntas_peripheralmodels' => [
        'ntas_peripherals' => 'peripheralmodels_id',
    ],

    'ntas_peripheraltypes' => [
        'ntas_peripherals' => 'peripheraltypes_id',
    ],

    'ntas_phonemodels' => [
        'ntas_phones' => 'phonemodels_id',
    ],

    'ntas_phonepowersupplies' => [
        'ntas_phones' => 'phonepowersupplies_id',
    ],

    'ntas_phonetypes' => [
        'ntas_phones' => 'phonetypes_id',
    ],

    'ntas_planningeventcategories' => [
        'ntas_planningexternalevents' => 'planningeventcategories_id',
        'ntas_planningexternaleventtemplates' => 'planningeventcategories_id',
    ],

    'ntas_planningexternaleventtemplates' => [
        'ntas_planningexternalevents' => 'planningexternaleventtemplates_id',
    ],

    'ntas_plugs' => [
        '_ntas_items_plugs' => 'plugs_id',
    ],

    'ntas_printermodels' => [
        '_ntas_cartridgeitems_printermodels' => 'printermodels_id',
        'ntas_printers'                      => 'printermodels_id',
    ],

    'ntas_printers' => [
        '_ntas_cartridges'              => 'printers_id',
        '_ntas_printerlogs'             => ['items_id', 'itemtype'],
        '_ntas_printers_cartridgeinfos' => 'printers_id',
    ],

    'ntas_printertypes' => [
        'ntas_printers' => 'printertypes_id',
    ],

    'ntas_problems' => [
        '_ntas_changes_problems'   => 'problems_id',
        '_ntas_groups_problems'    => 'problems_id',
        '_ntas_items_problems'     => 'problems_id',
        '_ntas_itils_projects'     => [['items_id', 'itemtype']],
        '_ntas_itilfollowups'      => [['items_id', 'itemtype']],
        '_ntas_itilsolutions'      => [['items_id', 'itemtype']],
        '_ntas_problemcosts'       => 'problems_id',
        '_ntas_problems_problems'  => [
            'problems_id_1',
            'problems_id_2',
        ],
        '_ntas_problems_suppliers' => 'problems_id',
        '_ntas_problems_tickets'   => 'problems_id',
        '_ntas_problems_users'     => 'problems_id',
        '_ntas_problemtasks'       => 'problems_id',
    ],

    'ntas_problemtemplates' => [
        'ntas_entities'                         => 'problemtemplates_id',
        'ntas_itilcategories'                   => [
            'problemtemplates_id',
        ],
        'ntas_problems'                         => 'problemtemplates_id',
        '_ntas_problemtemplatehiddenfields'     => 'problemtemplates_id',
        '_ntas_problemtemplatemandatoryfields'  => 'problemtemplates_id',
        '_ntas_problemtemplatepredefinedfields' => 'problemtemplates_id',
        '_ntas_problemtemplatereadonlyfields'   => 'problemtemplates_id',
        'ntas_profiles'                         => 'problemtemplates_id',
    ],

    'ntas_profiles' => [
        '_ntas_knowbaseitems_profiles'         => 'profiles_id',
        '_ntas_profilerights'                  => 'profiles_id',
        '_ntas_profiles_reminders'             => 'profiles_id',
        '_ntas_profiles_rssfeeds'              => 'profiles_id',
        '_ntas_profiles_users'                 => 'profiles_id',
        'ntas_users'                           => 'profiles_id',
    ],

    'ntas_projects' => [
        '_ntas_itils_projects'      => 'projects_id',
        '_ntas_items_projects'      => 'projects_id',
        '_ntas_projectcosts'        => 'projects_id',
        'ntas_projects'             => 'projects_id',
        '_ntas_projecttasks'        => 'projects_id',
        'ntas_projecttasktemplates' => 'projects_id',
        '_ntas_projectteams'        => 'projects_id',
    ],

    'ntas_projectstates' => [
        'ntas_projects'             => 'projectstates_id',
        'ntas_projecttasks'         => 'projectstates_id',
        'ntas_projecttasktemplates' => 'projectstates_id',
    ],

    'ntas_projecttasks' => [
        '_ntas_projecttasklinks'     => [
            'projecttasks_id_source',
            'projecttasks_id_target',
        ],
        'ntas_projecttasks'          => 'projecttasks_id',
        '_ntas_projecttasks_tickets' => 'projecttasks_id',
        '_ntas_projecttaskteams'     => 'projecttasks_id',
        'ntas_projecttasktemplates'  => 'projecttasks_id',
    ],

    'ntas_projecttasktemplates' => [
        'ntas_projecttasks' => 'projecttasktemplates_id',
    ],

    'ntas_projecttasktypes' => [
        'ntas_projecttasks'         => 'projecttasktypes_id',
        'ntas_projecttasktemplates' => 'projecttasktypes_id',
    ],

    'ntas_projecttypes' => [
        'ntas_projects' => 'projecttypes_id',
    ],

    'ntas_rackmodels' => [
        'ntas_racks' => 'rackmodels_id',
    ],

    'ntas_racks' => [
        '_ntas_items_racks' => 'racks_id',
        '_ntas_pdus_racks'  => 'racks_id',
    ],

    'ntas_racktypes' => [
        'ntas_racks' => 'racktypes_id',
    ],

    'ntas_reminders' => [
        '_ntas_entities_reminders'   => 'reminders_id',
        '_ntas_groups_reminders'     => 'reminders_id',
        '_ntas_profiles_reminders'   => 'reminders_id',
        '_ntas_remindertranslations' => 'reminders_id',
        '_ntas_reminders_users'      => 'reminders_id',
    ],

    'ntas_requesttypes' => [
        'ntas_itilfollowups'         => 'requesttypes_id',
        'ntas_itilfollowuptemplates' => 'requesttypes_id',
        'ntas_tickets'               => 'requesttypes_id',
        'ntas_users'                 => 'default_requesttypes_id',
    ],

    'ntas_reservationitems' => [
        '_ntas_reservations' => 'reservationitems_id',
    ],

    'ntas_rssfeeds' => [
        '_ntas_entities_rssfeeds' => 'rssfeeds_id',
        '_ntas_groups_rssfeeds'   => 'rssfeeds_id',
        '_ntas_profiles_rssfeeds' => 'rssfeeds_id',
        '_ntas_rssfeeds_users'    => 'rssfeeds_id',
    ],

    'ntas_rules' => [
        'ntas_refusedequipments' => 'rules_id',
        '_ntas_ruleactions'      => 'rules_id',
        '_ntas_rulecriterias'    => 'rules_id',
        'ntas_rulematchedlogs'   => 'rules_id',
    ],

    'ntas_savedsearches' => [
        '_ntas_savedsearches_alerts' => 'savedsearches_id',
        '_ntas_savedsearches_users'  => 'savedsearches_id',
    ],

    'ntas_slalevels' => [
        '_ntas_slalevelactions'   => 'slalevels_id',
        '_ntas_slalevelcriterias' => 'slalevels_id',
        '_ntas_slalevels_tickets' => 'slalevels_id',
        'ntas_tickets'            => 'slalevels_id_ttr',
    ],

    'ntas_slas' => [
        'ntas_slalevels' => 'slas_id',
        'ntas_tickets'   => [
            'slas_id_ttr',
            'slas_id_tto',
        ],
    ],

    'ntas_slms' => [
        '_ntas_olas' => 'slms_id',
        '_ntas_slas' => 'slms_id',
    ],

    'ntas_snmpcredentials' => [
        'ntas_networkequipments' => 'snmpcredentials_id',
        'ntas_printers'          => 'snmpcredentials_id',
        'ntas_unmanageds'        => 'snmpcredentials_id',
    ],

    'ntas_socketmodels' => [
        'ntas_cables' => [
            'socketmodels_id_endpoint_a',
            'socketmodels_id_endpoint_b',
        ],
        'ntas_sockets' => 'socketmodels_id',
    ],

    'ntas_sockets' => [
        'ntas_cables' => [
            'sockets_id_endpoint_a',
            'sockets_id_endpoint_b',
        ],
    ],

    'ntas_softwarecategories' => [
        '_ntas_softwarecategories' => 'softwarecategories_id',
        'ntas_softwares'           => 'softwarecategories_id',
    ],

    'ntas_softwarelicenses' => [
        '_ntas_items_softwarelicenses'     => 'softwarelicenses_id',
        '_ntas_softwarelicenses'           => 'softwarelicenses_id',
        '_ntas_softwarelicenses_users'             => 'softwarelicenses_id',
    ],

    'ntas_softwarelicensetypes' => [
        'ntas_softwarelicenses'      => 'softwarelicensetypes_id',
        '_ntas_softwarelicensetypes' => 'softwarelicensetypes_id',
    ],

    'ntas_softwares' => [
        '_ntas_softwarelicenses' => 'softwares_id',
        'ntas_softwares'         => 'softwares_id',
        '_ntas_softwareversions' => 'softwares_id',
    ],

    'ntas_softwareversions' => [
        '_ntas_items_softwareversions'     => 'softwareversions_id',
        'ntas_softwarelicenses'            => [
            'softwareversions_id_buy',
            'softwareversions_id_use',
        ],
    ],

    'ntas_solutiontemplates' => [
        'ntas_pendingreasons' => 'solutiontemplates_id',
    ],

    'ntas_solutiontypes' => [
        'ntas_itilsolutions'     => 'solutiontypes_id',
        'ntas_solutiontemplates' => 'solutiontypes_id',
    ],

    'ntas_states' => [
        'ntas_appliances'                => 'states_id',
        'ntas_assets_assets'             => 'states_id',
        'ntas_cables'                    => 'states_id',
        'ntas_certificates'              => 'states_id',
        'ntas_clusters'                  => 'states_id',
        'ntas_computers'                 => 'states_id',
        'ntas_contracts'                 => 'states_id',
        'ntas_databaseinstances'         => 'states_id',
        'ntas_enclosures'                => 'states_id',
        'ntas_items_devicebatteries'     => 'states_id',
        'ntas_items_devicecameras'       => 'states_id',
        'ntas_items_devicecases'         => 'states_id',
        'ntas_items_devicecontrols'      => 'states_id',
        'ntas_items_devicedrives'        => 'states_id',
        'ntas_items_devicefirmwares'     => 'states_id',
        'ntas_items_devicegenerics'      => 'states_id',
        'ntas_items_devicegraphiccards'  => 'states_id',
        'ntas_items_deviceharddrives'    => 'states_id',
        'ntas_items_devicememories'      => 'states_id',
        'ntas_items_devicemotherboards'  => 'states_id',
        'ntas_items_devicenetworkcards'  => 'states_id',
        'ntas_items_devicepcis'          => 'states_id',
        'ntas_items_devicepowersupplies' => 'states_id',
        'ntas_items_deviceprocessors'    => 'states_id',
        'ntas_items_devicesensors'       => 'states_id',
        'ntas_items_devicesimcards'      => 'states_id',
        'ntas_items_devicesoundcards'    => 'states_id',
        'ntas_lines'                     => 'states_id',
        'ntas_monitors'                  => 'states_id',
        'ntas_networkequipments'         => 'states_id',
        'ntas_passivedcequipments'       => 'states_id',
        'ntas_pdus'                      => 'states_id',
        'ntas_peripherals'               => 'states_id',
        'ntas_phones'                    => 'states_id',
        'ntas_printers'                  => 'states_id',
        'ntas_racks'                     => 'states_id',
        'ntas_softwarelicenses'          => 'states_id',
        'ntas_softwareversions'          => 'states_id',
        'ntas_states'                    => 'states_id',
        'ntas_unmanageds'                => 'states_id',
    ],

    'ntas_suppliers' => [
        '_ntas_changes_suppliers'   => 'suppliers_id',
        '_ntas_contacts_suppliers'  => 'suppliers_id',
        '_ntas_contracts_suppliers' => 'suppliers_id',
        'ntas_infocoms'             => 'suppliers_id',
        '_ntas_problems_suppliers'  => 'suppliers_id',
        '_ntas_suppliers_tickets'   => 'suppliers_id',
    ],

    'ntas_suppliertypes' => [
        'ntas_suppliers' => 'suppliertypes_id',
    ],

    'ntas_taskcategories' => [
        'ntas_changetasks'    => 'taskcategories_id',
        'ntas_problemtasks'   => 'taskcategories_id',
        'ntas_taskcategories' => 'taskcategories_id',
        'ntas_tasktemplates'  => 'taskcategories_id',
        'ntas_tickettasks'    => 'taskcategories_id',
    ],

    'ntas_tasktemplates' => [
        'ntas_changetasks'  => 'tasktemplates_id',
        'ntas_problemtasks' => 'tasktemplates_id',
        'ntas_tickettasks'  => 'tasktemplates_id',
    ],

    'ntas_ticketrecurrents' => [
        '_ntas_items_ticketrecurrents' => 'ticketrecurrents_id',
    ],

    'ntas_tickets' => [
        '_ntas_changes_tickets'       => 'tickets_id',
        'ntas_documents'              => 'tickets_id',
        '_ntas_groups_tickets'        => 'tickets_id',
        '_ntas_items_tickets'         => 'tickets_id',
        '_ntas_itils_projects'        => [['items_id', 'itemtype']],
        '_ntas_itilfollowups'         => [['items_id', 'itemtype']],
        '_ntas_itils_validationsteps' => [['items_id', 'itemtype']],
        '_ntas_itilsolutions'         => [['items_id', 'itemtype']],
        '_ntas_olalevels_tickets'     => 'tickets_id',
        '_ntas_problems_tickets'      => 'tickets_id',
        '_ntas_projecttasks_tickets'  => 'tickets_id',
        '_ntas_slalevels_tickets'     => 'tickets_id',
        '_ntas_suppliers_tickets'     => 'tickets_id',
        '_ntas_ticketcosts'           => 'tickets_id',
        '_ntas_tickets_contracts'     => 'tickets_id',
        '_ntas_tickets_tickets'       => [
            'tickets_id_1',
            'tickets_id_2',
        ],
        '_ntas_tickets_users'         => 'tickets_id',
        '_ntas_ticketsatisfactions'   => 'tickets_id',
        '_ntas_tickettasks'           => 'tickets_id',
        '_ntas_ticketvalidations'     => 'tickets_id',
    ],

    'ntas_tickettemplates' => [
        'ntas_entities'                        => 'tickettemplates_id',
        'ntas_itilcategories'                  => [
            'tickettemplates_id_incident',
            'tickettemplates_id_demand',
        ],
        'ntas_profiles'                        => 'tickettemplates_id',
        'ntas_tickets'                         => 'tickettemplates_id',
        'ntas_ticketrecurrents'                => 'tickettemplates_id',
        '_ntas_tickettemplatehiddenfields'     => 'tickettemplates_id',
        '_ntas_tickettemplatemandatoryfields'  => 'tickettemplates_id',
        '_ntas_tickettemplatepredefinedfields' => 'tickettemplates_id',
        '_ntas_tickettemplatereadonlyfields'   => 'tickettemplates_id',
    ],

    'ntas_transfers' => [
        'ntas_entities' => 'transfers_id',
    ],

    'ntas_usercategories' => [
        'ntas_users' => 'usercategories_id',
    ],

    'ntas_users' => [
        'ntas_appliances'             => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_assets_assets'            => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_cables'                   => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_cartridgeitems'           => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_certificates'             => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_changes'                  => [
            'users_id_recipient',
            'users_id_lastupdater',
        ],
        '_ntas_changes_users'           => 'users_id',
        'ntas_changetasks'              => [
            'users_id',
            'users_id_editor',
            'users_id_tech',
        ],
        'ntas_changevalidations'        => [
            'users_id',
            'users_id_validate',
        ],
        'ntas_clusters'                 => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_computers'                => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_consumableitems'          => [
            'users_id_tech',
            'users_id',
        ],
        '_ntas_dashboards_dashboards'   => 'users_id',
        'ntas_dashboards_filters'       => 'users_id',
        'ntas_databaseinstances'        => [
            'users_id_tech',
            'users_id',
        ],
        '_ntas_displaypreferences'      => 'users_id',
        'ntas_domains'                  => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_domainrecords'            => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_documents'                => 'users_id',
        'ntas_documents_items'          => 'users_id',
        'ntas_enclosures'               => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_forms_answerssets'        => 'users_id',
        '_ntas_groups_users'            => 'users_id',
        'ntas_items_devicesimcards'     => [
            'users_id_tech',
            'users_id',
        ],
        '_ntas_items_kanbans'           => 'users_id',
        'ntas_itilcategories'           => 'users_id',
        'ntas_itilfollowups'            => [
            'users_id',
            'users_id_editor',
        ],
        'ntas_itilsolutions'            => [
            'users_id_approval',
            'users_id_editor',
            'users_id',
        ],
        'ntas_knowbaseitems'            => 'users_id',
        'ntas_knowbaseitems_comments'   => 'users_id',
        'ntas_knowbaseitems_revisions'  => 'users_id',
        '_ntas_knowbaseitems_users'     => 'users_id',
        'ntas_knowbaseitemtranslations' => 'users_id',
        'ntas_lines'                    => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_monitors'                 => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_networkequipments'        => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_notepads'                 => [
            'users_id',
            'users_id_lastupdater',
        ],
        'ntas_notimportedemails'        => 'users_id',
        '_ntas_objectlocks'             => 'users_id',
        'ntas_passivedcequipments'      => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_pdus'                     => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_peripherals'              => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_phones'                   => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_planningexternalevents'   => 'users_id',
        'ntas_planningrecalls'          => 'users_id',
        'ntas_printers'                 => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_problems'                 => [
            'users_id_recipient',
            'users_id_lastupdater',
        ],
        '_ntas_problems_users'          => 'users_id',
        'ntas_problemtasks'             => [
            'users_id',
            'users_id_editor',
            'users_id_tech',
        ],
        '_ntas_profiles_users'          => 'users_id',
        'ntas_projects'                 => 'users_id',
        'ntas_projecttasks'             => 'users_id',
        'ntas_projecttasktemplates'     => 'users_id',
        'ntas_racks'                    => [
            'users_id_tech',
            'users_id',
        ],
        '_ntas_reminders'               => 'users_id',
        '_ntas_reminders_users'         => 'users_id',
        '_ntas_remindertranslations'    => 'users_id',
        'ntas_reservations'             => 'users_id',
        'ntas_rssfeeds'                 => 'users_id',
        '_ntas_rssfeeds_users'          => 'users_id',
        '_ntas_savedsearches'           => 'users_id',
        '_ntas_savedsearches_users'     => 'users_id',
        'ntas_softwarelicenses'         => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_softwares'                => [
            'users_id_tech',
            'users_id',
        ],
        'ntas_tasktemplates'            => 'users_id_tech',
        'ntas_tickets'                  => [
            'users_id_recipient',
            'users_id_lastupdater',
        ],
        '_ntas_tickets_users'           => 'users_id',
        'ntas_tickettasks'              => [
            'users_id',
            'users_id_editor',
            'users_id_tech',
        ],
        'ntas_ticketvalidations'        => [
            'users_id',
            'users_id_validate',
        ],
        'ntas_unmanageds'               => [
            'users_id_tech',
            'users_id',
        ],
        '_ntas_useremails'              => 'users_id',
        'ntas_users'                    => 'users_id_supervisor',
        '_ntas_validatorsubstitutes'     => [
            'users_id',
            'users_id_substitute',
        ],
        '_ntas_softwarelicenses_users'          => 'users_id',
        '_ntas_contracts_users'         => 'users_id',
    ],

    'ntas_usertitles' => [
        'ntas_contacts' => 'usertitles_id',
        'ntas_users'    => 'usertitles_id',
    ],

    'ntas_validationsteps' => [
        'ntas_itilvalidationtemplates' => 'validationsteps_id',
        'ntas_itils_validationsteps' => 'validationsteps_id',
    ],

    'ntas_virtualmachinestates' => [
        'ntas_itemvirtualmachines' => 'virtualmachinestates_id',
    ],

    'ntas_virtualmachinesystems' => [
        'ntas_itemvirtualmachines' => 'virtualmachinesystems_id',
    ],

    'ntas_virtualmachinetypes' => [
        'ntas_itemvirtualmachines' => 'virtualmachinetypes_id',
    ],

    'ntas_vlans' => [
        '_ntas_ipnetworks_vlans'   => 'vlans_id',
        '_ntas_networkports_vlans' => 'vlans_id',
    ],

    'ntas_wifinetworks' => [
        'ntas_networkportwifis' => 'wifinetworks_id',
    ],
    'ntas_webhooks' => [
        '_ntas_queuedwebhooks' => 'webhooks_id',
    ],

    'ntas_webhookcategories' => [
        'ntas_webhookcategories'    => 'webhookcategories_id',
        'ntas_webhooks'             => 'webhookcategories_id',
    ],

];

$add_mapping_entry = static function (string $source_table, string $target_table_key, string|array $relation_fields) use (&$RELATION) {
    if (!array_key_exists($source_table, $RELATION)) {
        $RELATION[$source_table] = [];
    }
    if (!array_key_exists($target_table_key, $RELATION[$source_table])) {
        $RELATION[$source_table][$target_table_key] = [];
    }
    if (!is_array($RELATION[$source_table][$target_table_key])) {
        $RELATION[$source_table][$target_table_key] = [$RELATION[$source_table][$target_table_key]];
    }

    if (!in_array($relation_fields, $RELATION[$source_table][$target_table_key], true)) {
        $RELATION[$source_table][$target_table_key][] = $relation_fields;
    }
};

// Add polymorphic relations based on configuration.
global $CFG_GLPI;
$specifically_managed_types = [
    Agent::class, // FIXME Agent should be a CommonDBChild with $mustBeAttached=true
    Consumable::class, // Consumables are handled manually to redefine `date_out` to `null`
    DatabaseInstance::class, // FIXME DatabaseInstance should be a CommonDBChild with $mustBeAttached=true
    Item_Cluster::class, // FIXME $mustBeAttached_1 and $mustBeAttached_2 should probably be set to true
    Item_Enclosure::class, // FIXME $mustBeAttached_1 and $mustBeAttached_2 should probably be set to true
    Item_Rack::class, // FIXME $mustBeAttached_1 and $mustBeAttached_2 should probably be set to true
];
$polymorphic_types_mapping = [
    Agent::class                   => $CFG_GLPI['agent_types'],
    Appliance_Item::class          => $CFG_GLPI['appliance_types'],
    Appliance_Item_Relation::class => $CFG_GLPI['appliance_relation_types'],
    Certificate_Item::class        => $CFG_GLPI['certificate_types'],
    Change_Item::class             => $CFG_GLPI['ticket_types'],
    Consumable::class              => $CFG_GLPI['consumables_types'],
    Contract_Item::class           => $CFG_GLPI['contract_types'],
    DatabaseInstance::class        => $CFG_GLPI['databaseinstance_types'],
    Document_Item::class           => Document::getItemtypesThatCanHave(),
    Domain_Item::class             => $CFG_GLPI['domain_types'],
    Infocom::class                 => Infocom::getItemtypesThatCanHave(),
    Item_Cluster::class            => $CFG_GLPI['cluster_types'],
    Item_Disk::class               => $CFG_GLPI['disk_types'],
    Item_Enclosure::class          => $CFG_GLPI['rackable_types'],
    Item_Kanban::class             => $CFG_GLPI['kanban_types'],
    Item_OperatingSystem::class    => $CFG_GLPI['operatingsystem_types'],
    Item_Problem::class            => $CFG_GLPI['ticket_types'],
    Item_Project::class            => $CFG_GLPI['project_asset_types'],
    Item_Rack::class               => $CFG_GLPI['rackable_types'],
    Item_SoftwareLicense::class    => $CFG_GLPI['software_types'],
    Item_SoftwareVersion::class    => $CFG_GLPI['software_types'],
    Item_Ticket::class             => $CFG_GLPI['ticket_types'],
    ItemAntivirus::class           => $CFG_GLPI['itemantivirus_types'],
    ItemVirtualMachine::class      => $CFG_GLPI['itemvirtualmachines_types'],
    KnowbaseItem_Item::class       => $CFG_GLPI['kb_types'],
    NetworkPort::class             => $CFG_GLPI['networkport_types'],
    ReservationItem::class         => $CFG_GLPI['reservation_types'],
    Socket::class                  => $CFG_GLPI['socket_types'],
    Item_Plug::class               => $CFG_GLPI['plug_types'],
];
foreach (Item_Devices::getDeviceTypes() as $itemdevice_itemtype) {
    $source_itemtypes = $itemdevice_itemtype::itemAffinity();
    if (in_array('*', $source_itemtypes)) {
        $source_itemtypes = $CFG_GLPI['itemdevices_types'];
    }
    $polymorphic_types_mapping[$itemdevice_itemtype] = $source_itemtypes;
    $specifically_managed_types[] = $itemdevice_itemtype; // Item_Devices is handled manually to take care of `keep_devices` option
}
$polymorphic_types_mapping[VObject::class] = [];
foreach ($CFG_GLPI['planning_types'] as $planning_itemtype) {
    if (is_a($planning_itemtype, CalDAVCompatibleItemInterface::class, true)) {
        $polymorphic_types_mapping[VObject::class][] = $planning_itemtype;
    }
}

foreach ($polymorphic_types_mapping as $target_itemtype => $source_itemtypes) {
    foreach ($source_itemtypes as $source_itemtype) {
        $target_table_key_prefix = '';
        if (
            in_array($target_itemtype, $specifically_managed_types)
            || (
                is_a($target_itemtype, CommonDBChild::class, true)
                && $target_itemtype::$itemtype === 'itemtype'
                && $target_itemtype::$items_id === 'items_id'
                && $target_itemtype::$mustBeAttached === true
            )
            || (
                is_a($target_itemtype, CommonDBRelation::class, true)
                && (
                    (
                        $target_itemtype::$itemtype_1 === 'itemtype'
                        && $target_itemtype::$items_id_1 === 'items_id'
                        && $target_itemtype::$mustBeAttached_1 === true
                    )
                    || (
                        $target_itemtype::$itemtype_2 === 'itemtype'
                        && $target_itemtype::$items_id_2 === 'items_id'
                        && $target_itemtype::$mustBeAttached_2 === true
                    )
                )
            )
        ) {
            // If item must be attached, target table key has to be prefixed by "_"
            // to be ignored by `CommonDBTM::cleanRelationData()`. Indeed, without usage of this prefix,
            // related item will be preserved with its foreign key defined to 0, making it an unwanted orphaned item.
            $target_table_key_prefix = '_';
        }
        /** @var class-string<CommonDBTM> $target_itemtype */
        $target_table_key = $target_table_key_prefix . $target_itemtype::getTable();
        $source_table     = $source_itemtype::getTable();

        $add_mapping_entry($source_table, $target_table_key, ['items_id', 'itemtype']);
    }
}

// IPAddress specific case
// mainitems_id/mainitemtype are mainly a copy of item related to source NetworkPort
foreach ($CFG_GLPI['networkport_types'] as $source_itemtype) {
    $target_table_key = IPAddress::getTable();
    $source_table     = $source_itemtype::getTable();

    $add_mapping_entry($source_table, $target_table_key, ['mainitems_id', 'mainitemtype']);
}

// Asset_PeripheralAsset specific case
foreach ($CFG_GLPI['directconnect_types'] as $directconnect_itemtype) {
    $target_table_key = Asset_PeripheralAsset::getTable();
    $source_table     = $directconnect_itemtype::getTable();

    $add_mapping_entry($source_table, $target_table_key, ['itemtype_peripheral', 'items_id_peripheral']);
}
foreach (Asset_PeripheralAsset::getPeripheralHostItemtypes() as $peripheralhost_itemtype) {
    $target_table_key = Asset_PeripheralAsset::getTable();
    $source_table     = $peripheralhost_itemtype::getTable();

    $add_mapping_entry($source_table, $target_table_key, ['itemtype_asset', 'items_id_asset']);
}

// Multiple groups assignments
$assignable_itemtypes = $CFG_GLPI['assignable_types'];
foreach ($assignable_itemtypes as $assignable_itemtype) {
    $source_table_key = $assignable_itemtype::getTable();

    $add_mapping_entry($source_table_key, '_ntas_groups_items', ['itemtype', 'items_id']);
}
