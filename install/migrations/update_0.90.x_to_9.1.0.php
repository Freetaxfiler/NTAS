<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryExpression;
use Glpi\Search\SearchOption;

/**
 * Update from 0.90.5 to 9.1
 *
 * @return bool
 **/
function update090xto910()
{
    /**
     * @var array $CFG_GLPI
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration, $CFG_GLPI;

    $current_config   = Config::getConfigurationValues('core');
    $updateresult     = true;
    $ADDTODISPLAYPREF = [];

    $migration->setVersion('9.1');

    $migration->displayMessage(sprintf(__('Add of - %s to database'), 'Object Locks'));

    /************** Lock Objects *************/
    if (!$DB->tableExists('ntas_objectlocks')) {
        $query = "CREATE TABLE `ntas_objectlocks` (
                 `id` INT NOT NULL AUTO_INCREMENT,
                 `itemtype` VARCHAR(100) NOT NULL COMMENT 'Type of locked object',
                 `items_id` INT NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
                 `users_id` INT NOT NULL COMMENT 'id of the locker',
                 `date_mod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp of the lock',
                 PRIMARY KEY (`id`),
                 UNIQUE INDEX `item` (`itemtype`, `items_id`)
               ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci";
        $DB->doQuery($query);

        // insert new profile (read only access for locks)
        $query = "INSERT INTO `ntas_profiles`
                       (`name`, `interface`, `is_default`, `helpdesk_hardware`, `helpdesk_item_type`,
                        `ticket_status`, `date_mod`, `comment`, `problem_status`,
                        `create_ticket_on_login`, `tickettemplates_id`, `change_status`)
                VALUES ('Read-Only','central','0','0','[]',
                        '{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}',
                        NULL,
                        'This profile defines read-only access. It is used when objects are locked. It can also be used to give to users rights to unlock objects.',
                        '{\"1\":{\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"2\":{\"1\":0,\"7\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"3\":{\"1\":0,\"7\":0,\"2\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0}}',
                        0, 0,
                        '{\"1\":{\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"9\":{\"1\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"10\":{\"1\":0,\"9\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"9\":0,\"10\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"11\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"12\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0}}')";

        $DB->doQuery($query);
        $ro_p_id = $DB->insertId();
        $DB->doQuery("INSERT INTO `ntas_profilerights`
                              (`profiles_id`, `name`, `rights`)
                       VALUES ($ro_p_id, 'backup',                    '1'),
                              ($ro_p_id, 'bookmark_public',           '1'),
                              ($ro_p_id, 'budget',                    '161'),
                              ($ro_p_id, 'calendar',                  '1'),
                              ($ro_p_id, 'cartridge',                 '161'),
                              ($ro_p_id, 'change',                    '1185'),
                              ($ro_p_id, 'changevalidation',          '0'),
                              ($ro_p_id, 'computer',                  '161'),
                              ($ro_p_id, 'config',                    '1'),
                              ($ro_p_id, 'consumable',                '161'),
                              ($ro_p_id, 'contact_enterprise',        '161'),
                              ($ro_p_id, 'contract',                  '161'),
                              ($ro_p_id, 'device',                    '0'),
                              ($ro_p_id, 'document',                  '161'),
                              ($ro_p_id, 'domain',                    '1'),
                              ($ro_p_id, 'dropdown',                  '1'),
                              ($ro_p_id, 'entity',                    '1185'),
                              ($ro_p_id, 'followup',                  '8193'),
                              ($ro_p_id, 'global_validation',         '0'),
                              ($ro_p_id, 'group',                     '129'),
                              ($ro_p_id, 'infocom',                   '1'),
                              ($ro_p_id, 'internet',                  '129'),
                              ($ro_p_id, 'itilcategory',              '1'),
                              ($ro_p_id, 'knowbase',                  '2177'),
                              ($ro_p_id, 'knowbasecategory',          '1'),
                              ($ro_p_id, 'link',                      '129'),
                              ($ro_p_id, 'location',                  '1'),
                              ($ro_p_id, 'logs',                      '1'),
                              ($ro_p_id, 'monitor',                   '161'),
                              ($ro_p_id, 'netpoint',                  '1'),
                              ($ro_p_id, 'networking',                '161'),
                              ($ro_p_id, 'notification',              '1'),
                              ($ro_p_id, 'password_update',           '0'),
                              ($ro_p_id, 'peripheral',                '161'),
                              ($ro_p_id, 'phone',                     '161'),
                              ($ro_p_id, 'planning',                  '3073'),
                              ($ro_p_id, 'printer',                   '161'),
                              ($ro_p_id, 'problem',                   '1185'),
                              ($ro_p_id, 'profile',                   '129'),
                              ($ro_p_id, 'project',                   '1185'),
                              ($ro_p_id, 'projecttask',               '1'),
                              ($ro_p_id, 'queuedmail',                '1'),
                              ($ro_p_id, 'reminder_public',           '129'),
                              ($ro_p_id, 'reports',                   '1'),
                              ($ro_p_id, 'reservation',               '1'),
                              ($ro_p_id, 'rssfeed_public',            '129'),
                              ($ro_p_id, 'rule_dictionnary_dropdown', '1'),
                              ($ro_p_id, 'rule_dictionnary_printer',  '1'),
                              ($ro_p_id, 'rule_dictionnary_software', '1'),
                              ($ro_p_id, 'rule_import',               '1'),
                              ($ro_p_id, 'rule_ldap',                 '1'),
                              ($ro_p_id, 'rule_mailcollector',        '1'),
                              ($ro_p_id, 'rule_softwarecategories',   '1'),
                              ($ro_p_id, 'rule_ticket',               '1'),
                              ($ro_p_id, 'search_config',             '0'),
                              ($ro_p_id, 'show_group_hardware',       '1'),
                              ($ro_p_id, 'sla',                       '1'),
                              ($ro_p_id, 'software',                  '161'),
                              ($ro_p_id, 'solutiontemplate',          '1'),
                              ($ro_p_id, 'state',                     '1'),
                              ($ro_p_id, 'statistic',                 '1'),
                              ($ro_p_id, 'task',                      '8193'),
                              ($ro_p_id, 'taskcategory',              '1'),
                              ($ro_p_id, 'ticket',                    '7297'),
                              ($ro_p_id, 'ticketcost',                '1'),
                              ($ro_p_id, 'ticketrecurrent',           '1'),
                              ($ro_p_id, 'tickettemplate',            '1'),
                              ($ro_p_id, 'ticketvalidation',          '0'),
                              ($ro_p_id, 'transfer',                  '1'),
                              ($ro_p_id, 'typedoc',                   '1'),
                              ($ro_p_id, 'user',                      '2177')");

        // updates rights for Super-Admin profile
        $rightnames = [];
        foreach ($CFG_GLPI['lock_lockable_objects'] as $itemtype) {
            $rightnames[] = $itemtype::$rightname;
        }

        $DB->update(
            "ntas_profilerights",
            [
                'rights' => new QueryExpression(
                    DBmysql::quoteName("rights") . " | " . DBmysql::quoteValue(UNLOCK)
                ),
            ],
            [
                'profiles_id'  => 4,
                'name'         => $rightnames,
            ]
        );

        $migration->addConfig(
            [
                'lock_use_lock_item'             => 0,
                'lock_autolock_mode'             => 1,
                'lock_directunlock_notification' => 0,
                'lock_item_list'                 => '[]',
                'lock_lockprofile_id'            => $ro_p_id,
            ]
        );
    }

    // cron task
    if (
        !countElementsInTable(
            'ntas_crontasks',
            ['itemtype' => 'ObjectLock', 'name' => 'unlockobject']
        )
    ) {
        $DB->insert(
            "ntas_crontasks",
            [
                'itemtype'        => "ObjectLock",
                'name'            => "unlockobject",
                'frequency'       => 86400,
                'param'           => 4,
                'state'           => 0,
                'mode'            => 1,
                'allowmode'       => 3,
                'hourmin'         => 0,
                'hourmax'         => 24,
                'logs_lifetime'   => 30,
                'lastrun'         => null,
                'lastcode'        => null,
                'comment'         => null,
            ]
        );
    }
    // notification template
    $notificationtemplatesIterator = $DB->request([
        'FROM'   => "ntas_notificationtemplates",
        'WHERE'  => ['itemtype' => "ObjectLock"],
    ]);

    if (count($notificationtemplatesIterator) == 0) {
        $DB->insert(
            "ntas_notificationtemplates",
            [
                'name'      => "Unlock Item request",
                'itemtype'  => "ObjectLock",
                'date_mod'  => new QueryExpression("NOW()"),
            ]
        );
        $notid = $DB->insertId();

        $contentText
         = '##objectlock.type## ###objectlock.id## - ##objectlock.name##

         ##lang.objectlock.url##
         ##objectlock.url##

         ##lang.objectlock.date_mod##
         ##objectlock.date_mod##

         Hello ##objectlock.lockedby.firstname##,
         Could go to this item and unlock it for me?
         Thank you,
         Regards,
         ##objectlock.requester.firstname##';

        $contentHtml
         = '&lt;table&gt;
         &lt;tbody&gt;
         &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##objectlock.url##\"&gt;##objectlock.type## ###objectlock.id## - ##objectlock.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;
         &lt;tr&gt;
         &lt;td&gt;##lang.objectlock.url##&lt;/td&gt;
         &lt;td&gt;##objectlock.url##&lt;/td&gt;
         &lt;/tr&gt;
         &lt;tr&gt;
         &lt;td&gt;##lang.objectlock.date_mod##&lt;/td&gt;
         &lt;td&gt;##objectlock.date_mod##&lt;/td&gt;
         &lt;/tr&gt;
         &lt;/tbody&gt;
         &lt;/table&gt;
         &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello ##objectlock.lockedby.firstname##,&lt;br /&gt;Could go to this item and unlock it for me?&lt;br /&gt;Thank you,&lt;br /&gt;Regards,&lt;br /&gt;##objectlock.requester.firstname## ##objectlock.requester.lastname##&lt;/span&gt;&lt;/p&gt;';

        $DB->insert(
            "ntas_notificationtemplatetranslations",
            [
                'notificationtemplates_id' => $notid,
                'language'                 => "",
                'subject'                  => "##objectlock.action##",
                'content_text'             => $contentText,
                'content_html'             => $contentHtml,
            ]
        );

        $DB->insert(
            "ntas_notifications",
            [
                'name'                     => "Request Unlock Items",
                'entities_id'              => 0,
                'itemtype'                 => "ObjectLock",
                'event'                    => "unlock",
                'mode'                     => "mail",
                'notificationtemplates_id' => $notid,
                'comment'                  => "",
                'is_recursive'             => 1,
                'is_active'                => 1,
                'date_mod'                 => new QueryExpression("NOW()"),
            ]
        );
        $notifid = $DB->insertId();

        $DB->insert(
            "ntas_notificationtargets",
            [
                'id'                 => null,
                'notifications_id'   => $notifid,
                'type'               => Notification::USER_TYPE,
                'items_id'           => Notification::USER,
            ]
        );
    }

    $migration->addField("ntas_users", "lock_autolock_mode", "tinyint NULL DEFAULT NULL");
    $migration->addField("ntas_users", "lock_directunlock_notification", "tinyint NULL DEFAULT NULL");

    /************** Default Requester *************/
    $migration->addConfig(['set_default_requester' => 1]);
    $migration->addField("ntas_users", "set_default_requester", "tinyint NULL DEFAULT NULL");

    // ************ NetworkPort ethernets **************
    if (!$DB->tableExists("ntas_networkportfiberchannels")) {
        $query = "CREATE TABLE `ntas_networkportfiberchannels` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `networkports_id` int NOT NULL DEFAULT '0',
                  `items_devicenetworkcards_id` int NOT NULL DEFAULT '0',
                  `netpoints_id` int NOT NULL DEFAULT '0',
                  `wwn` varchar(16) COLLATE utf8_unicode_ci DEFAULT '',
                  `speed` int NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
                  PRIMARY KEY (`id`),
                  UNIQUE KEY `networkports_id` (`networkports_id`),
                  KEY `card` (`items_devicenetworkcards_id`),
                  KEY `netpoint` (`netpoints_id`),
                  KEY `wwn` (`wwn`),
                  KEY `speed` (`speed`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);
    }

    /************** Kernel version for os *************/
    $migration->addField("ntas_computers", "os_kernel_version", "string");

    /************** os architecture *************/
    $migration->addField("ntas_computers", "operatingsystemarchitectures_id", "integer");
    $migration->addKey("ntas_computers", "operatingsystemarchitectures_id");

    if (!$DB->tableExists('ntas_operatingsystemarchitectures')) {
        $query = "CREATE TABLE `ntas_operatingsystemarchitectures` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `comment` text COLLATE utf8_unicode_ci,
                  `date_mod` datetime DEFAULT NULL,
                  `date_creation` datetime DEFAULT NULL,
                  PRIMARY KEY (`id`),
                  KEY `name` (`name`),
                  KEY `date_mod` (`date_mod`),
                  KEY `date_creation` (`date_creation`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);
    }

    /************** Task's templates *************/
    if (!$DB->tableExists('ntas_tasktemplates')) {
        $query = "CREATE TABLE `ntas_tasktemplates` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `entities_id` int NOT NULL DEFAULT '0',
                  `is_recursive` tinyint NOT NULL DEFAULT '0',
                  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `content` text COLLATE utf8_unicode_ci,
                  `taskcategories_id` int NOT NULL DEFAULT '0',
                  `actiontime` int NOT NULL DEFAULT '0',
                  `comment` text COLLATE utf8_unicode_ci,
                  PRIMARY KEY (`id`),
                  KEY `name` (`name`),
                  KEY `is_recursive` (`is_recursive`),
                  KEY `taskcategories_id` (`taskcategories_id`),
                  KEY `entities_id` (`entities_id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);
    }

    /************** Installation date for softwares *************/
    $migration->addField("ntas_computers_softwareversions", "date_install", "DATE");
    $migration->addKey("ntas_computers_softwareversions", "date_install");

    /************** Location for budgets *************/
    $migration->addField("ntas_budgets", "locations_id", "integer");
    $migration->addKey("ntas_budgets", "locations_id");

    if (!$DB->tableExists('ntas_budgettypes')) {
        $query = "CREATE TABLE `ntas_budgettypes` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `comment` text COLLATE utf8_unicode_ci,
                  `date_mod` datetime DEFAULT NULL,
                  `date_creation` datetime DEFAULT NULL,
                  PRIMARY KEY (`id`),
                  KEY `name` (`name`),
                  KEY `date_mod` (`date_mod`),
                  KEY `date_creation` (`date_creation`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);
    }

    $new = $migration->addField("ntas_budgets", "budgettypes_id", "integer");
    $migration->addKey("ntas_budgets", "budgettypes_id");

    if ($new) {
        $DB->update(
            "ntas_displaypreferences",
            [
                'num' => 6,
            ],
            [
                'itemtype'  => "Budget",
                'num'       => 4,
            ]
        );
    }
    $ADDTODISPLAYPREF['Budget'] = [4];

    /************** New Planning with fullcalendar.io *************/
    $migration->addField("ntas_users", "plannings", "text");

    /************** API Rest *************/
    $migration->addConfig(['enable_api'                      => 0]);
    $migration->addConfig(['enable_api_login_credentials'    => 0]);
    $migration->addConfig(['enable_api_login_external_token' => 1]);
    $migration->addConfig(['url_base_api' => trim($current_config['url_base'], "/") . "/apirest.php/"]);
    if (!$DB->tableExists('ntas_apiclients')) {
        $query = "CREATE TABLE `ntas_apiclients` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `entities_id` INT NOT NULL DEFAULT '0',
                  `is_recursive` TINYINT NOT NULL DEFAULT '0',
                  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `date_mod` DATETIME DEFAULT NULL,
                  `is_active` TINYINT NOT NULL DEFAULT '0',
                  `ipv4_range_start` BIGINT NULL ,
                  `ipv4_range_end` BIGINT NULL ,
                  `ipv6` VARCHAR( 255 ) NULL,
                  `app_token` VARCHAR( 255 ) NULL,
                  `app_token_date` DATETIME DEFAULT NULL,
                  `dolog_method` TINYINT NOT NULL DEFAULT '0',
                  `comment` TEXT NULL ,
                  PRIMARY KEY (`id`),
                  KEY `date_mod` (`date_mod`),
                  KEY `is_active` (`is_active`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);

        $DB->insert(
            "ntas_apiclients",
            [
                'id'                 => 1,
                'entities_id'        => 0,
                'is_recursive'       => 1,
                'name'               => "full access from localhost",
                'date_mod'           => null,
                'is_active'          => 1,
                'ipv4_range_start'   => new QueryExpression("INET_ATON('127.0.0.1')"),
                'ipv4_range_end'     => new QueryExpression("INET_ATON('127.0.0.1')"),
                'ipv6'               => "::1",
                'app_token'          => null,
                'app_token_date'     => null,
                'dolog_method'       => 0,
                'comment'            => null,
            ]
        );
    }

    /************** Date mod/creation for itemtypes *************/
    $migration->displayMessage(__('date_mod and date_creation'));
    $type_tables = [
        'ntas_authldaps',
        'ntas_blacklists',
        'ntas_blacklistedmailcontents',
        'ntas_budgets',
        'ntas_calendars',
        'ntas_cartridgeitemtypes',
        'ntas_changes',
        'ntas_changetasks',
        'ntas_computerdisks',
        'ntas_computervirtualmachines',
        'ntas_consumableitemtypes',
        'ntas_contacts',
        'ntas_contacttypes',
        'ntas_contracts',
        'ntas_contracttypes',
        'ntas_crontasks',
        'ntas_devicecasetypes',
        'ntas_devicememorytypes',
        'ntas_documents',
        'ntas_documentcategories',
        'ntas_documenttypes',
        'ntas_domains',
        'ntas_entities',
        'ntas_fqdns',
        'ntas_fieldblacklists',
        'ntas_fieldunicities',
        'ntas_filesystems',
        'ntas_groups',
        'ntas_holidays',
        'ntas_infocoms',
        'ntas_interfacetypes',
        'ntas_ipnetworks',
        'ntas_itilcategories',
        'ntas_knowbaseitemcategories',
        'ntas_locations',
        'ntas_links',
        'ntas_mailcollectors',
        'ntas_manufacturers',
        'ntas_netpoints',
        'ntas_networks',
        'ntas_networkequipmentfirmwares',
        'ntas_networknames',
        'ntas_networkports',
        'ntas_notifications',
        'ntas_notificationtemplates',
        'ntas_phonepowersupplies',
        'ntas_problems',
        'ntas_problemtasks',
        'ntas_profiles',
        'ntas_projects',
        'ntas_projectstates',
        'ntas_projecttasktypes',
        'ntas_projecttypes',
        'ntas_reminders',
        'ntas_requesttypes',
        'ntas_rssfeeds',
        'ntas_rules',
        'ntas_rulerightparameters',
        'ntas_slas',
        'ntas_softwarelicensetypes',
        'ntas_softwareversions',
        'ntas_solutiontemplates',
        'ntas_solutiontypes',
        'ntas_ssovariables',
        'ntas_states',
        'ntas_suppliers',
        'ntas_suppliertypes',
        'ntas_taskcategories',
        'ntas_tasktemplates',
        'ntas_tickets',
        'ntas_ticketfollowups',
        'ntas_tickettasks',
        'ntas_users',
        'ntas_usercategories',
        'ntas_usertitles',
        'ntas_virtualmachinestates',
        'ntas_virtualmachinesystems',
        'ntas_virtualmachinetypes',
        'ntas_vlans',
        'ntas_wifinetworks',
        'ntas_cartridges',
        'ntas_cartridgeitems',
        'ntas_computers',
        'ntas_consumables',
        'ntas_consumableitems',
        'ntas_monitors',
        'ntas_networkequipments',
        'ntas_peripherals',
        'ntas_phones',
        'ntas_printers',
        'ntas_softwares',
        'ntas_softwarelicenses',
        'ntas_computermodels',
        'ntas_computertypes',
        'ntas_monitormodels',
        'ntas_monitortypes',
        'ntas_networkequipmentmodels',
        'ntas_networkequipmenttypes',
        'ntas_operatingsystems',
        'ntas_operatingsystemservicepacks',
        'ntas_operatingsystemversions',
        'ntas_peripheralmodels',
        'ntas_peripheraltypes',
        'ntas_phonemodels',
        'ntas_phonetypes',
        'ntas_printers',
        'ntas_printermodels',
        'ntas_printertypes',
        'ntas_softwares',
        'ntas_devicemotherboards',
        'ntas_deviceprocessors',
        'ntas_devicememories',
        'ntas_deviceharddrives',
        'ntas_devicenetworkcards',
        'ntas_devicedrives',
        'ntas_devicegraphiccards',
        'ntas_devicesoundcards',
        'ntas_devicecontrols',
        'ntas_devicepcis',
        'ntas_devicecases',
        'ntas_devicepowersupplies',
        'ntas_networkportethernets',
        'ntas_networkportwifis',
        'ntas_networkportaggregates',
        'ntas_networkportaliases',
        'ntas_networkportdialups',
        'ntas_networkportlocals',
        'ntas_networkportfiberchannels',
    ];

    foreach ($type_tables as $table) {
        if (
            $DB->tableExists($table)
            && !$DB->fieldExists($table, 'date_mod')
        ) {
            $migration->displayMessage(sprintf(__('Add date_mod to %s'), $table));

            //Add date_mod field if it doesn't exists
            $migration->addField($table, 'date_mod', 'datetime');
            $migration->addKey($table, 'date_mod');
            $migration->migrationOneTable($table);
        }

        if (
            $DB->tableExists($table)
            && !$DB->fieldExists($table, 'date_creation')
        ) {
            $migration->displayMessage(sprintf(__('Add date_creation to %s'), $table));

            //Add date_creation field
            $migration->addField($table, 'date_creation', 'datetime');
            $migration->addKey($table, 'date_creation');
            $migration->migrationOneTable($table);
        }
    }

    /************** Enhance Associated items for ticket ***************/
    // TEMPLATE UPDATE
    $migration->dropKey('ntas_tickettemplatepredefinedfields', 'unicity');

    // Get associated item searchoption num
    if (!isset($CFG_GLPI["use_rich_text"])) {
        $CFG_GLPI["use_rich_text"] = false;
    }
    $searchOption = SearchOption::getOptionsForItemtype('Ticket');
    $item_num     = 0;
    $itemtype_num = 0;
    foreach ($searchOption as $num => $option) {
        if (
            is_array($option)
            && isset($option['field'])
        ) {
            if ($option['field'] == 'items_id') {
                $item_num = $num;
            } elseif ($option['field'] == 'itemtype') {
                $itemtype_num = $num;
            }
        }
    }

    foreach (
        ['ntas_tickettemplatepredefinedfields', 'ntas_tickettemplatehiddenfields',
            'ntas_tickettemplatemandatoryfields',
        ] as $table
    ) {
        $columns = [];
        switch ($table) {
            case 'ntas_tickettemplatepredefinedfields':
                $columns = ['num', 'value', 'tickettemplates_id'];
                break;

            default:
                $columns = ['num', 'tickettemplates_id'];
                break;
        }

        $iterator = $DB->request([
            'SELECT' => $columns,
            'FROM'   => $table,
            'WHERE'  => [
                'OR' => [
                    ['num' => $item_num],
                    ['num' => $itemtype_num],
                ],
            ],
        ]);

        $items_to_update = [];
        if (count($iterator)) {
            foreach ($iterator as $data) {
                if ($data['num'] == $itemtype_num) {
                    $items_to_update[$data['tickettemplates_id']]['itemtype']
                     = $data['value'] ?? 0;
                } elseif ($data['num'] == $item_num) {
                    $items_to_update[$data['tickettemplates_id']]['items_id']
                    = $data['value'] ?? 0;
                }
            }
        }

        switch ($table) {
            case 'ntas_tickettemplatepredefinedfields': // Update predefined items
                foreach ($items_to_update as $templates_id => $type) {
                    if (isset($type['itemtype'])) {
                        if (isset($type['items_id'])) {
                            $DB->update(
                                $table,
                                [
                                    'value' => $type['itemtype'] . "_" . $type['items_id'],
                                ],
                                [
                                    'num'                => $item_num,
                                    'tickettemplates_id' => $templates_id,
                                ]
                            );

                            $DB->delete(
                                $table,
                                [
                                    'num'                => $itemtype_num,
                                    'tickettemplates_id' => $templates_id,
                                ]
                            );
                        }
                    }
                }
                break;

            default: // Update mandatory and hidden items
                foreach ($items_to_update as $templates_id => $type) {
                    if (isset($type['itemtype'])) {
                        if (isset($type['items_id'])) {
                            $DB->delete(
                                $table,
                                [
                                    'num'                => $item_num,
                                    'tickettemplates_id' => $templates_id,
                                ]
                            );
                        }
                        $DB->update(
                            $table,
                            [
                                'num' => $item_num,
                            ],
                            [
                                'num'                => $itemtype_num,
                                'tickettemplates_id' => $templates_id,
                            ]
                        );
                    }
                }
                break;
        }
    }

    /************** Add more fields to software licenses */
    $migration->addField("ntas_softwarelicenses", "is_deleted", "bool");
    $migration->addField("ntas_softwarelicenses", "locations_id", "integer");
    $migration->addField("ntas_softwarelicenses", "users_id_tech", "integer");
    $migration->addField("ntas_softwarelicenses", "users_id", "integer");
    $migration->addField("ntas_softwarelicenses", "groups_id_tech", "integer");
    $migration->addField("ntas_softwarelicenses", "groups_id", "integer");
    $migration->addField("ntas_softwarelicenses", "is_helpdesk_visible", "bool");
    $migration->addField("ntas_softwarelicenses", "is_template", "bool");
    $migration->addField("ntas_softwarelicenses", "template_name", "string");
    $migration->addField("ntas_softwarelicenses", "states_id", "integer");
    $migration->addField("ntas_softwarelicenses", "manufacturers_id", "integer");

    $migration->addKey("ntas_softwarelicenses", "locations_id");
    $migration->addKey("ntas_softwarelicenses", "users_id_tech");
    $migration->addKey("ntas_softwarelicenses", "users_id");
    $migration->addKey("ntas_softwarelicenses", "groups_id_tech");
    $migration->addKey("ntas_softwarelicenses", "groups_id");
    $migration->addKey("ntas_softwarelicenses", "is_helpdesk_visible");
    $migration->addKey("ntas_softwarelicenses", "is_deleted");
    $migration->addKey("ntas_softwarelicenses", "is_template");
    $migration->addKey("ntas_softwarelicenses", "states_id");
    $migration->addKey("ntas_softwarelicenses", "manufacturers_id");

    $migration->addField("ntas_infocoms", "decommission_date", "datetime");
    $migration->addField(
        "ntas_entities",
        "autofill_decommission_date",
        "string",
        ['value' => '-2']
    );

    $migration->addField("ntas_states", "is_visible_softwarelicense", "bool");
    $migration->addKey("ntas_states", "is_visible_softwarelicense");

    /************* Add is_recursive on assets ***/
    foreach (['ntas_computers', 'ntas_monitors', 'ntas_phones', 'ntas_peripherals'] as $table) {
        $migration->addField($table, "is_recursive", "bool");
        $migration->addKey($table, "is_recursive");
    }

    /************* Add antivirus table */
    if (!$DB->tableExists('ntas_computerantiviruses')) {
        $query = "CREATE TABLE `ntas_computerantiviruses` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `computers_id` int NOT NULL DEFAULT '0',
                  `name` varchar(255) DEFAULT NULL,
                  `manufacturers_id` int NOT NULL DEFAULT '0',
                  `antivirus_version` varchar(255) DEFAULT NULL,
                  `signature_version` varchar(255) DEFAULT NULL,
                  `is_active` tinyint NOT NULL DEFAULT '0',
                  `is_deleted` tinyint NOT NULL DEFAULT '0',
                  `is_uptodate` tinyint NOT NULL DEFAULT '0',
                  `is_dynamic` tinyint NOT NULL DEFAULT '0',
                  `date_expiration` datetime DEFAULT NULL,
                  `date_mod` datetime DEFAULT NULL,
                  `date_creation` datetime DEFAULT NULL,
                  PRIMARY KEY (`id`),
                  KEY `name` (`name`),
                  KEY `antivirus_version` (`antivirus_version`),
                  KEY `signature_version` (`signature_version`),
                  KEY `is_active` (`is_active`),
                  KEY `is_uptodate` (`is_uptodate`),
                  KEY `is_dynamic` (`is_dynamic`),
                  KEY `is_deleted` (`is_deleted`),
                  KEY `computers_id` (`computers_id`),
                  KEY `date_expiration` (`date_expiration`),
                  KEY `date_mod` (`date_mod`),
                  KEY `date_creation` (`date_creation`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;";
        $DB->doQuery($query);
    }

    if (countElementsInTable("ntas_profilerights", ['name' => 'license']) == 0) {
        //new right for software license
        //copy the software right value to the new license right
        $prights = $DB->request(['FROM' => 'ntas_profilerights', 'WHERE' => ['name' => 'software']]);
        foreach ($prights as $profrights) {
            $DB->insert(
                "ntas_profilerights",
                [
                    'id'           => null,
                    'profiles_id'  => $profrights['profiles_id'],
                    'name'         => "license",
                    'rights'       => $profrights['rights'],
                ]
            );
        }
    }

    //new right for survey
    $prights = $DB->request(['FROM' => 'ntas_profilerights', 'WHERE' => ['name' => 'ticket']]);
    foreach ($prights as $profrights) {
        $DB->update(
            "ntas_profilerights",
            [
                'rights' => new QueryExpression(
                    DBmysql::quoteName("rights") . " | " . DBmysql::quoteValue(Ticket::SURVEY)
                ),
            ],
            [
                'profiles_id'  => $profrights['profiles_id'],
                'name'         => "ticket",
            ]
        );
    }

    //new field
    $migration->addField('ntas_authldaps', 'location_field', 'string', ['after' => 'email4_field']);

    //TRANS: %s is the table or item to migrate
    $migration->displayMessage(sprintf(__('Data migration - %s'), 'ntas_displaypreferences'));

    $ADDTODISPLAYPREF['SoftwareLicense'] = [1, 3, 10, 162, 5];
    foreach ($ADDTODISPLAYPREF as $type => $tab) {
        $displaypreferencesIterator = $DB->request([
            'SELECT'    => "users_id",
            'DISTINCT'  => true,
            'FROM'      => "ntas_displaypreferences",
            'WHERE'     => ['itemtype' => $type],
        ]);

        if (count($displaypreferencesIterator)) {
            foreach ($displaypreferencesIterator as $data) {
                $rank = $DB->request([
                    'SELECT'    => ['MAX' => "rank AS max_rank"],
                    'DISTINCT'  => true,
                    'FROM'      => "ntas_displaypreferences",
                    'WHERE'     => [
                        'users_id' => $data['users_id'],
                        'itemtype' => $type,
                    ],
                ])->current();
                $rank = $rank ? $rank['max_rank']++ : 1;

                foreach ($tab as $newval) {
                    $iterator = $DB->request([
                        'FROM' => "ntas_displaypreferences",
                        'WHERE' => [
                            'users_id'  => $data['users_id'],
                            'num'       => $newval,
                            'itemtype'  => $type,
                        ],
                    ]);
                    if (count($iterator) == 0) {
                        $DB->insert("ntas_displaypreferences", [
                            'itemtype'  => $type,
                            'num'       => $newval,
                            'rank'      => $rank++,
                            'users_id'  => $data['users_id'],
                        ]);
                    }
                }
            }
        } else { // Add for default user
            $rank = 1;
            foreach ($tab as $newval) {
                $DB->insert("ntas_displaypreferences", [
                    'itemtype'  => $type,
                    'num'       => $newval,
                    'rank'      => $rank++,
                    'users_id'  => 0,
                ]);
            }
        }
    }

    /** ************ New SLA structure ************ */
    if (!$DB->tableExists('ntas_slts')) {
        $query = "CREATE TABLE `ntas_slts` (
                  `id` int NOT NULL AUTO_INCREMENT,
                  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `entities_id` int NOT NULL DEFAULT '0',
                  `is_recursive` tinyint NOT NULL DEFAULT '0',
                  `type` int NOT NULL DEFAULT '0',
                  `comment` text COLLATE utf8_unicode_ci,
                  `number_time` int NOT NULL,
                  `calendars_id` int NOT NULL DEFAULT '0',
                  `date_mod` datetime DEFAULT NULL,
                  `definition_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
                  `end_of_working_day` tinyint NOT NULL DEFAULT '0',
                  `date_creation` datetime DEFAULT NULL,
                  `slas_id` int NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id`),
                  KEY `name` (`name`),
                  KEY `calendars_id` (`calendars_id`),
                  KEY `date_mod` (`date_mod`),
                  KEY `date_creation` (`date_creation`),
                  KEY `slas_id` (`slas_id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
        $DB->doQuery($query);

        // Sla migration
        $slasIterator = $DB->request(['FROM' => "ntas_slas"]);
        if (count($slasIterator)) {
            foreach ($slasIterator as $data) {
                $DB->insert(
                    "ntas_slts",
                    [
                        'id'                 => $data['id'],
                        'name'               => $data['name'],
                        'entities_id'        => $data['entities_id'],
                        'is_recursive'       => $data['is_recursive'],
                        'type'               => SLM::TTR,
                        'comment'            => $data['comment'],
                        'number_time'        => $data['resolution_time'],
                        'date_mod'           => $data['date_mod'],
                        'definition_time'    => $data['definition_time'],
                        'end_of_working_day' => $data['end_of_working_day'],
                        'date_creation'      => date('Y-m-d H:i:s'),
                        'slas_id'            => $data['id'],
                    ]
                );
            }
        }

        // Delete deprecated fields of SLA
        // save table before delete fields
        $migration->copyTable('ntas_slas', 'backup_ntas_slas');

        foreach (
            ['number_time', 'definition_time',
                'end_of_working_day',
            ] as $field
        ) {
            $migration->dropField('ntas_slas', $field);
        }
    }

    // Slalevels changes
    if ($DB->fieldExists('ntas_slalevels', 'slas_id')) {
        $migration->changeField('ntas_slalevels', 'slas_id', 'slts_id', 'integer');
        $migration->migrationOneTable('ntas_slalevels');
        $migration->dropKey('ntas_slalevels', 'slas_id');
        $migration->addKey('ntas_slalevels', 'slts_id');
    }

    // Ticket changes
    if ($DB->fieldExists('ntas_tickets', 'slas_id')) {
        $migration->changeField("ntas_tickets", "slas_id", "slts_ttr_id", "integer");
        $migration->migrationOneTable('ntas_tickets');
        $migration->dropKey('ntas_tickets', 'slas_id');
        $migration->addKey('ntas_tickets', 'slts_ttr_id');
    }

    if (!$DB->fieldExists('ntas_tickets', 'slts_tto_id')) {
        $migration->addField("ntas_tickets", "slts_tto_id", "integer", ['after' => 'slts_ttr_id']);
        $migration->addKey('ntas_tickets', 'slts_tto_id');
    }

    if (!$DB->fieldExists('ntas_tickets', 'time_to_own')) {
        $migration->addField("ntas_tickets", "time_to_own", "datetime", ['after' => 'due_date']);
        $migration->addKey('ntas_tickets', 'time_to_own');
    }

    if ($DB->fieldExists('ntas_tickets', 'slalevels_id')) {
        $migration->changeField('ntas_tickets', 'slalevels_id', 'ttr_slalevels_id', 'integer');
        $migration->migrationOneTable('ntas_tickets');
        $migration->dropKey('ntas_tickets', 'slalevels_id');
        $migration->addKey('ntas_tickets', 'ttr_slalevels_id');
    }

    // Unique key for slalevel_ticket
    $migration->addKey(
        'ntas_slalevels_tickets',
        ['tickets_id', 'slalevels_id'],
        'unicity',
        'UNIQUE'
    );

    // Sla rules criterias migration
    $DB->update(
        "ntas_rulecriterias",
        ['criteria' => "slts_ttr_id" ],
        ['criteria' => "slas_id"]
    );

    // Sla rules actions migration
    $DB->update(
        "ntas_ruleactions",
        ['field' => "slts_ttr_id" ],
        ['field' => "slas_id"]
    );

    // to delete in next version - fix change in update
    if (!$DB->fieldExists('ntas_slas', 'calendars_id')) {
        $migration->addField("ntas_slas", "calendars_id", "integer", ['after' => 'is_recursive']);
        $migration->addKey('ntas_slas', 'calendars_id');
    }
    if (
        $DB->fieldExists('ntas_slts', 'resolution_time')
        && !$DB->fieldExists('ntas_slts', 'number_time')
    ) {
        $migration->changeField('ntas_slts', 'resolution_time', 'number_time', 'integer');
    }

    /************** High contrast CSS **************/
    $migration->addConfig(['highcontrast_css' => 0]);
    $migration->addField("ntas_users", "highcontrast_css", "tinyint DEFAULT 0");

    /************** SMTP option for self-signed certificates **************/
    $migration->addConfig(['smtp_check_certificate' => 1]);

    // for group task
    $migration->addField("ntas_tickettasks", "groups_id_tech", "integer");
    $migration->addKey("ntas_tickettasks", "groups_id_tech");
    $migration->addField("ntas_changetasks", "groups_id_tech", "integer");
    $migration->addKey("ntas_changetasks", "groups_id_tech");
    $migration->addField("ntas_problemtasks", "groups_id_tech", "integer");
    $migration->addKey("ntas_problemtasks", "groups_id_tech");
    $migration->addField("ntas_groups", "is_task", "bool", ['value' => 1,
        'after' => 'is_assign',
    ]);

    // for date_mod adding to tasks and to followups
    $migration->addField("ntas_tickettasks", "date_mod", "datetime");
    $migration->addKey("ntas_tickettasks", "date_mod");
    $migration->addField("ntas_problemtasks", "date_mod", "datetime");
    $migration->addKey("ntas_problemtasks", "date_mod");
    $migration->addField("ntas_changetasks", "date_mod", "datetime");
    $migration->addKey("ntas_changetasks", "date_mod");
    $migration->addField("ntas_ticketfollowups", "date_mod", "datetime");
    $migration->addKey("ntas_ticketfollowups", "date_mod");

    // for is_active adding to ntas_taskcategories
    $migration->addField("ntas_taskcategories", "is_active", "bool", ['value' => 1]);
    $migration->addKey("ntas_taskcategories", "is_active");

    // for is_active, is_followup_default, is_ticketheader and is_ticketfollowup in ntas_requesttypes
    $migration->addField("ntas_requesttypes", "is_active", "bool", ['value' => 1]);
    $migration->addKey("ntas_requesttypes", "is_active");
    $migration->addField("ntas_requesttypes", "is_ticketheader", "bool", ['value' => 1]);
    $migration->addKey("ntas_requesttypes", "is_ticketheader");
    $migration->addField("ntas_requesttypes", "is_ticketfollowup", "bool", ['value' => 1]);
    $migration->addKey("ntas_requesttypes", "is_ticketfollowup");
    $migration->addField("ntas_requesttypes", "is_followup_default", "bool", ['value' => 0]);
    $migration->addKey("ntas_requesttypes", "is_followup_default");
    $migration->addField("ntas_requesttypes", "is_mailfollowup_default", "bool", ['value' => 0]);
    $migration->addKey("ntas_requesttypes", "is_mailfollowup_default");

    /************** Fix autoclose_delay for root_entity in ntas_entities (from -1 to 0) **************/
    $DB->update(
        "ntas_entities",
        [
            'autoclose_delay' => 0,
        ],
        [
            'autoclose_delay' => -1,
            'id'              => 0,
        ]
    );

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
