--
-- ---------------------------------------------------------------------
--
-- GLPI - Gestionnaire Libre de Parc Informatique
--
-- http://glpi-project.org
--
-- @copyright 2015-2026 Teclib' and contributors.
-- @copyright 2003-2014 by the INDEPNET Development Team.
-- @licence   https://www.gnu.org/licenses/gpl-3.0.html
--
-- ---------------------------------------------------------------------
--
-- LICENSE
--
-- This file is part of GLPI.
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
-- ---------------------------------------------------------------------
--

### Dump table ntas_alerts

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `ntas_alerts`;
CREATE TABLE `ntas_alerts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_authldapreplicates

DROP TABLE IF EXISTS `ntas_authldapreplicates`;
CREATE TABLE `ntas_authldapreplicates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `authldaps_id` int unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) DEFAULT NULL,
  `port` int NOT NULL DEFAULT '389',
  `name` varchar(255) DEFAULT NULL,
  `timeout` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_authldaps

DROP TABLE IF EXISTS `ntas_authldaps`;
CREATE TABLE `ntas_authldaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `basedn` varchar(255) DEFAULT NULL,
  `rootdn` varchar(255) DEFAULT NULL,
  `port` int NOT NULL DEFAULT '389',
  `condition` text,
  `login_field` varchar(255) DEFAULT 'uid',
  `sync_field` varchar(255) DEFAULT NULL,
  `use_tls` tinyint NOT NULL DEFAULT '0',
  `group_field` varchar(255) DEFAULT NULL,
  `group_condition` text,
  `group_search_type` int NOT NULL DEFAULT '0',
  `group_member_field` varchar(255) DEFAULT NULL,
  `email1_field` varchar(255) DEFAULT NULL,
  `realname_field` varchar(255) DEFAULT NULL,
  `firstname_field` varchar(255) DEFAULT NULL,
  `phone_field` varchar(255) DEFAULT NULL,
  `phone2_field` varchar(255) DEFAULT NULL,
  `mobile_field` varchar(255) DEFAULT NULL,
  `comment_field` varchar(255) DEFAULT NULL,
  `use_dn` tinyint NOT NULL DEFAULT '1',
  `time_offset` int NOT NULL DEFAULT '0',
  `deref_option` int NOT NULL DEFAULT '0',
  `title_field` varchar(255) DEFAULT NULL,
  `category_field` varchar(255) DEFAULT NULL,
  `language_field` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `rootdn_passwd` varchar(255) DEFAULT NULL,
  `registration_number_field` varchar(255) DEFAULT NULL,
  `email2_field` varchar(255) DEFAULT NULL,
  `email3_field` varchar(255) DEFAULT NULL,
  `email4_field` varchar(255) DEFAULT NULL,
  `location_field` varchar(255) DEFAULT NULL,
  `responsible_field` varchar(255) DEFAULT NULL,
  `pagesize` int NOT NULL DEFAULT '0',
  `ldap_maxlimit` int NOT NULL DEFAULT '0',
  `can_support_pagesize` tinyint NOT NULL DEFAULT '0',
  `picture_field` varchar(255) DEFAULT NULL,
  `begin_date_field` varchar(255) DEFAULT NULL,
  `end_date_field` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `inventory_domain` varchar(255) DEFAULT NULL,
  `tls_certfile` text,
  `tls_keyfile` text,
  `use_bind` tinyint NOT NULL DEFAULT '1',
  `timeout` int NOT NULL DEFAULT '10',
  `tls_version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `sync_field` (`sync_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_authmails

DROP TABLE IF EXISTS `ntas_authmails`;
CREATE TABLE `ntas_authmails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `connect_string` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_apiclients

DROP TABLE IF EXISTS `ntas_apiclients`;
CREATE TABLE `ntas_apiclients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `ipv4_range_start` bigint DEFAULT NULL,
  `ipv4_range_end` bigint DEFAULT NULL,
  `ipv6` varchar(255) DEFAULT NULL,
  `app_token` varchar(255) DEFAULT NULL,
  `app_token_date` timestamp NULL DEFAULT NULL,
  `dolog_method` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_autoupdatesystems

DROP TABLE IF EXISTS `ntas_autoupdatesystems`;
CREATE TABLE `ntas_autoupdatesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_blacklistedmailcontents

DROP TABLE IF EXISTS `ntas_blacklistedmailcontents`;
CREATE TABLE `ntas_blacklistedmailcontents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_blacklists

DROP TABLE IF EXISTS `ntas_blacklists`;
CREATE TABLE `ntas_blacklists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_savedsearches

DROP TABLE IF EXISTS `ntas_savedsearches`;
CREATE TABLE `ntas_savedsearches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `query` text,
  `last_execution_time` int DEFAULT NULL,
  `do_count` tinyint NOT NULL DEFAULT '2',
  `last_execution_date` timestamp NULL DEFAULT NULL,
  `counter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`),
  KEY `last_execution_time` (`last_execution_time`),
  KEY `last_execution_date` (`last_execution_date`),
  KEY `do_count` (`do_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_savedsearches_users

DROP TABLE IF EXISTS `ntas_savedsearches_users`;
CREATE TABLE `ntas_savedsearches_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `savedsearches_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `savedsearches_id` (`savedsearches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_savedsearches_alerts

DROP TABLE IF EXISTS `ntas_savedsearches_alerts`;
CREATE TABLE `ntas_savedsearches_alerts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `savedsearches_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `operator` tinyint NOT NULL,
  `value` int NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `frequency` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_budgets

DROP TABLE IF EXISTS `ntas_budgets`;
CREATE TABLE `ntas_budgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `budgettypes_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`),
  KEY `budgettypes_id` (`budgettypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_budgettypes

DROP TABLE IF EXISTS `ntas_budgettypes`;
CREATE TABLE `ntas_budgettypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_businesscriticities

DROP TABLE IF EXISTS `ntas_businesscriticities`;
CREATE TABLE `ntas_businesscriticities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_calendars

DROP TABLE IF EXISTS `ntas_calendars`;
CREATE TABLE `ntas_calendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `cache_duration` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_calendars_holidays

DROP TABLE IF EXISTS `ntas_calendars_holidays`;
CREATE TABLE `ntas_calendars_holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `holidays_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_calendarsegments

DROP TABLE IF EXISTS `ntas_calendarsegments`;
CREATE TABLE `ntas_calendarsegments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `day` tinyint NOT NULL DEFAULT '1',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cartridgeitems

DROP TABLE IF EXISTS `ntas_cartridgeitems`;
CREATE TABLE `ntas_cartridgeitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `cartridgeitemtypes_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `alarm_threshold` int NOT NULL DEFAULT '10',
  `stock_target` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_printers_cartridgeinfos`;
CREATE TABLE `ntas_printers_cartridgeinfos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `printers_id` int unsigned NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_id` (`printers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_cartridgeitems_printermodels

DROP TABLE IF EXISTS `ntas_cartridgeitems_printermodels`;
CREATE TABLE `ntas_cartridgeitems_printermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int unsigned NOT NULL DEFAULT '0',
  `printermodels_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cartridgeitemtypes

DROP TABLE IF EXISTS `ntas_cartridgeitemtypes`;
CREATE TABLE `ntas_cartridgeitemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cartridges

DROP TABLE IF EXISTS `ntas_cartridges`;
CREATE TABLE `ntas_cartridges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `cartridgeitems_id` int unsigned NOT NULL DEFAULT '0',
  `printers_id` int unsigned NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_certificates

DROP TABLE IF EXISTS `ntas_certificates`;
CREATE TABLE `ntas_certificates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `certificatetypes_id` int unsigned NOT NULL DEFAULT '0',
  `dns_name` varchar(255) DEFAULT NULL,
  `dns_suffix` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_autosign` tinyint NOT NULL DEFAULT '0',
  `date_expiration` date DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `command` text,
  `certificate_request` text,
  `certificate_item` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `certificatetypes_id` (`certificatetypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_certificates_items

DROP TABLE IF EXISTS `ntas_certificates_items`;
CREATE TABLE `ntas_certificates_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `certificates_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_certificatetypes

DROP TABLE IF EXISTS `ntas_certificatetypes`;
CREATE TABLE `ntas_certificatetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changecosts

DROP TABLE IF EXISTS `ntas_changecosts`;
CREATE TABLE `ntas_changecosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `changes_id` (`changes_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes

DROP TABLE IF EXISTS `ntas_changes`;
CREATE TABLE `ntas_changes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `content` longtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontent` longtext,
  `controlistcontent` longtext,
  `rolloutplancontent` longtext,
  `backoutplancontent` longtext,
  `checklistcontent` longtext,
  `global_validation` int NOT NULL DEFAULT '1',
  `actiontime` int NOT NULL DEFAULT '0',
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `global_validation` (`global_validation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_groups

DROP TABLE IF EXISTS `ntas_changes_groups`;
CREATE TABLE `ntas_changes_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_items

DROP TABLE IF EXISTS `ntas_changes_items`;
CREATE TABLE `ntas_changes_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_problems

DROP TABLE IF EXISTS `ntas_changes_problems`;
CREATE TABLE `ntas_changes_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `link` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  KEY `problems_id` (`problems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_suppliers

DROP TABLE IF EXISTS `ntas_changes_suppliers`;
CREATE TABLE `ntas_changes_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_tickets

DROP TABLE IF EXISTS `ntas_changes_tickets`;
CREATE TABLE `ntas_changes_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `link` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changes_users

DROP TABLE IF EXISTS `ntas_changes_users`;
CREATE TABLE `ntas_changes_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changetasks

DROP TABLE IF EXISTS `ntas_changetasks`;
CREATE TABLE `ntas_changetasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `actiontime` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `changes_id` (`changes_id`),
  KEY `state` (`state`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changevalidations

DROP TABLE IF EXISTS `ntas_changevalidations`;
CREATE TABLE `ntas_changevalidations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itils_validationsteps_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `changes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_validate` int unsigned NOT NULL DEFAULT '0',
  `itilvalidationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype_target` varchar(255) NOT NULL,
  `items_id_target` int unsigned NOT NULL DEFAULT '0',
  `comment_submission` text,
  `comment_validation` text,
  `status` int NOT NULL DEFAULT '2',
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `last_reminder_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `itilvalidationtemplates_id` (`itilvalidationtemplates_id`),
  KEY `item_target` (`itemtype_target`,`items_id_target`),
  KEY `changes_id` (`changes_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`),
  KEY `itils_validationsteps_id` (`itils_validationsteps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_itemantiviruses

DROP TABLE IF EXISTS `ntas_itemantiviruses`;
CREATE TABLE `ntas_itemantiviruses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `antivirus_version` varchar(255) DEFAULT NULL,
  `signature_version` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_uptodate` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `antivirus_version` (`antivirus_version`),
  KEY `signature_version` (`signature_version`),
  KEY `is_active` (`is_active`),
  KEY `is_uptodate` (`is_uptodate`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_disks

DROP TABLE IF EXISTS `ntas_items_disks`;
CREATE TABLE `ntas_items_disks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `filesystems_id` int unsigned NOT NULL DEFAULT '0',
  `totalsize` bigint NOT NULL DEFAULT '0',
  `freesize` bigint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `encryption_status` int NOT NULL DEFAULT '0',
  `encryption_tool` varchar(255) DEFAULT NULL,
  `encryption_algorithm` varchar(255) DEFAULT NULL,
  `encryption_type` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_computermodels

DROP TABLE IF EXISTS `ntas_computermodels`;
CREATE TABLE `ntas_computermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_computers

DROP TABLE IF EXISTS `ntas_computers`;
CREATE TABLE `ntas_computers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `computermodels_id` int unsigned NOT NULL DEFAULT '0',
  `computertypes_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `last_boot` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Previously ntas_computers_items < 11.0.0
### Dump table ntas_assets_assets_peripheralassets

DROP TABLE IF EXISTS `ntas_assets_assets_peripheralassets`;
CREATE TABLE `ntas_assets_assets_peripheralassets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype_asset` varchar(255) NOT NULL,
  `items_id_asset` int unsigned NOT NULL DEFAULT '0',
  `items_id_peripheral` int unsigned NOT NULL DEFAULT '0',
  `itemtype_peripheral` varchar(255) NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_asset` (`itemtype_asset`,`items_id_asset`),
  KEY `item_peripheral` (`itemtype_peripheral`,`items_id_peripheral`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Previously ntas_computers_softwarelicenses < 9.5.0
### Dump table ntas_items_softwarelicenses

DROP TABLE IF EXISTS `ntas_items_softwarelicenses`;
CREATE TABLE `ntas_items_softwarelicenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `softwarelicenses_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Previously ntas_computers_softwareversions < 9.5.0
### Dump table ntas_items_softwareversions

DROP TABLE IF EXISTS `ntas_items_softwareversions`;
CREATE TABLE `ntas_items_softwareversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `softwareversions_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted_item` tinyint NOT NULL DEFAULT '0',
  `is_template_item` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_install` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`),
  KEY `computers_info` (`entities_id`,`is_template_item`,`is_deleted_item`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted_item` (`is_deleted_item`),
  KEY `is_template_item` (`is_template_item`),
  KEY `date_install` (`date_install`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_computertypes

DROP TABLE IF EXISTS `ntas_computertypes`;
CREATE TABLE `ntas_computertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_itemvirtualmachines

DROP TABLE IF EXISTS `ntas_itemvirtualmachines`;
CREATE TABLE `ntas_itemvirtualmachines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `virtualmachinestates_id` int unsigned NOT NULL DEFAULT '0',
  `virtualmachinesystems_id` int unsigned NOT NULL DEFAULT '0',
  `virtualmachinetypes_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `vcpu` int NOT NULL DEFAULT '0',
  `ram` int unsigned DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`, `items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `uuid` (`uuid`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `virtualmachinetypes_id` (`virtualmachinetypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_operatingsystems

DROP TABLE IF EXISTS `ntas_items_operatingsystems`;
CREATE TABLE `ntas_items_operatingsystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `operatingsystems_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemversions_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemservicepacks_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemarchitectures_id` int unsigned NOT NULL DEFAULT '0',
  `operatingsystemkernelversions_id` int unsigned NOT NULL DEFAULT '0',
  `license_number` varchar(255) DEFAULT NULL,
  `licenseid` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `hostid` varchar(255) DEFAULT NULL,
  `operatingsystemeditions_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `install_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystemkernels

DROP TABLE IF EXISTS `ntas_operatingsystemkernels`;
CREATE TABLE `ntas_operatingsystemkernels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystemkernelversions

DROP TABLE IF EXISTS `ntas_operatingsystemkernelversions`;
CREATE TABLE `ntas_operatingsystemkernelversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `operatingsystemkernels_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_operatingsystemeditions

DROP TABLE IF EXISTS `ntas_operatingsystemeditions`;
CREATE TABLE `ntas_operatingsystemeditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_configs

DROP TABLE IF EXISTS `ntas_configs`;
CREATE TABLE `ntas_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `context` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`context`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_impacts

DROP TABLE IF EXISTS `ntas_impactrelations`;
CREATE TABLE `ntas_impactrelations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `itemtype_source` varchar(255) NOT NULL DEFAULT '',
  `items_id_source` int unsigned NOT NULL DEFAULT '0',
  `itemtype_impacted` varchar(255) NOT NULL DEFAULT '',
  `items_id_impacted` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype_source`,`items_id_source`,`itemtype_impacted`,`items_id_impacted`),
  KEY `name` (`name`),
  KEY `impacted_asset` (`itemtype_impacted`,`items_id_impacted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_impacts_compounds

DROP TABLE IF EXISTS `ntas_impactcompounds`;
CREATE TABLE `ntas_impactcompounds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_impactitems

DROP TABLE IF EXISTS `ntas_impactitems`;
CREATE TABLE `ntas_impactitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontexts_id` int unsigned NOT NULL DEFAULT '0',
  `is_slave` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `source` (`itemtype`,`items_id`),
  KEY `parent_id` (`parent_id`),
  KEY `impactcontexts_id` (`impactcontexts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_impactcontexts

DROP TABLE IF EXISTS `ntas_impactcontexts`;
CREATE TABLE `ntas_impactcontexts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `positions` mediumtext NOT NULL,
  `zoom` float NOT NULL DEFAULT '0',
  `pan_x` float NOT NULL DEFAULT '0',
  `pan_y` float NOT NULL DEFAULT '0',
  `impact_color` varchar(255) NOT NULL DEFAULT '',
  `depends_color` varchar(255) NOT NULL DEFAULT '',
  `impact_and_depends_color` varchar(255) NOT NULL DEFAULT '',
  `show_depends` tinyint NOT NULL DEFAULT '1',
  `show_impact` tinyint NOT NULL DEFAULT '1',
  `max_depth` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_consumableitems

DROP TABLE IF EXISTS `ntas_consumableitems`;
CREATE TABLE `ntas_consumableitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `consumableitemtypes_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `alarm_threshold` int NOT NULL DEFAULT '10',
  `stock_target` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_consumableitemtypes

DROP TABLE IF EXISTS `ntas_consumableitemtypes`;
CREATE TABLE `ntas_consumableitemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_consumables

DROP TABLE IF EXISTS `ntas_consumables`;
CREATE TABLE `ntas_consumables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `consumableitems_id` int unsigned NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contacts

DROP TABLE IF EXISTS `ntas_contacts`;
CREATE TABLE `ntas_contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contacttypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `usertitles_id` int unsigned NOT NULL DEFAULT '0',
  `address` text,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contacts_suppliers

DROP TABLE IF EXISTS `ntas_contacts_suppliers`;
CREATE TABLE `ntas_contacts_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `contacts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contacttypes

DROP TABLE IF EXISTS `ntas_contacttypes`;
CREATE TABLE `ntas_contacttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contractcosts

DROP TABLE IF EXISTS `ntas_contractcosts`;
CREATE TABLE `ntas_contractcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contracts_id` (`contracts_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contracts

DROP TABLE IF EXISTS `ntas_contracts`;
CREATE TABLE `ntas_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `contracttypes_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `notice` int NOT NULL DEFAULT '0',
  `periodicity` int NOT NULL DEFAULT '0',
  `billing` int NOT NULL DEFAULT '0',
  `comment` text,
  `accounting_number` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint NOT NULL DEFAULT '0',
  `sunday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `sunday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_sunday` tinyint NOT NULL DEFAULT '0',
  `max_links_allowed` int NOT NULL DEFAULT '0',
  `alert` int NOT NULL DEFAULT '0',
  `renewal` int NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `use_sunday` (`use_sunday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contracts_items

DROP TABLE IF EXISTS `ntas_contracts_items`;
CREATE TABLE `ntas_contracts_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contracts_suppliers

DROP TABLE IF EXISTS `ntas_contracts_suppliers`;
CREATE TABLE `ntas_contracts_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_contracttypes

DROP TABLE IF EXISTS `ntas_contracttypes`;
CREATE TABLE `ntas_contracttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_crontasklogs

DROP TABLE IF EXISTS `ntas_crontasklogs`;
CREATE TABLE `ntas_crontasklogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `crontasks_id` int unsigned NOT NULL,
  `crontasklogs_id` int unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int NOT NULL,
  `elapsed` float NOT NULL,
  `volume` int NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_crontasks

DROP TABLE IF EXISTS `ntas_crontasks`;
CREATE TABLE `ntas_crontasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `frequency` int NOT NULL,
  `param` int DEFAULT NULL,
  `state` int NOT NULL DEFAULT '1',
  `mode` int NOT NULL DEFAULT '1',
  `allowmode` int NOT NULL DEFAULT '3',
  `hourmin` int NOT NULL DEFAULT '0',
  `hourmax` int NOT NULL DEFAULT '24',
  `logs_lifetime` int NOT NULL DEFAULT '30',
  `lastrun` timestamp NULL DEFAULT NULL,
  `lastcode` int DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `name` (`name`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Task run by internal / external cron.';

### Dump table ntas_dashboards_dashboards

DROP TABLE IF EXISTS `ntas_dashboards_dashboards`;
CREATE TABLE `ntas_dashboards_dashboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `context` varchar(100) NOT NULL DEFAULT 'core',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_dashboards_filters

DROP TABLE IF EXISTS `ntas_dashboards_filters`;
CREATE TABLE `ntas_dashboards_filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `filter` longtext,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_dashboards_items

DROP TABLE IF EXISTS `ntas_dashboards_items`;
CREATE TABLE `ntas_dashboards_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL,
  `gridstack_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `x` int DEFAULT NULL,
  `y` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `card_options` text,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_dashboards_rights

DROP TABLE IF EXISTS `ntas_dashboards_rights`;
CREATE TABLE `ntas_dashboards_rights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int unsigned NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`dashboards_dashboards_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicecasemodels

DROP TABLE IF EXISTS `ntas_devicecasemodels`;
CREATE TABLE `ntas_devicecasemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicecases

DROP TABLE IF EXISTS `ntas_devicecases`;
CREATE TABLE `ntas_devicecases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicecasetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecasemodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecasemodels_id` (`devicecasemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicecasetypes

DROP TABLE IF EXISTS `ntas_devicecasetypes`;
CREATE TABLE `ntas_devicecasetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicecontrolmodels

DROP TABLE IF EXISTS `ntas_devicecontrolmodels`;
CREATE TABLE `ntas_devicecontrolmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicecontrols

DROP TABLE IF EXISTS `ntas_devicecontrols`;
CREATE TABLE `ntas_devicecontrols` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `is_raid` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecontrolmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicedrivemodels

DROP TABLE IF EXISTS `ntas_devicedrivemodels`;
CREATE TABLE `ntas_devicedrivemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicedrives

DROP TABLE IF EXISTS `ntas_devicedrives`;
CREATE TABLE `ntas_devicedrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `is_writer` tinyint NOT NULL DEFAULT '1',
  `speed` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicedrivemodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicedrivemodels_id` (`devicedrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicegenericmodels

DROP TABLE IF EXISTS `ntas_devicegenericmodels`;
CREATE TABLE `ntas_devicegenericmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicegenerics

DROP TABLE IF EXISTS `ntas_devicegenerics`;
CREATE TABLE `ntas_devicegenerics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicegenerictypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `devicegenericmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegenericmodels_id` (`devicegenericmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicegenerictypes

DROP TABLE IF EXISTS `ntas_devicegenerictypes`;
CREATE TABLE `ntas_devicegenerictypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicegraphiccardmodels

DROP TABLE IF EXISTS `ntas_devicegraphiccardmodels`;
CREATE TABLE `ntas_devicegraphiccardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicegraphiccards

DROP TABLE IF EXISTS `ntas_devicegraphiccards`;
CREATE TABLE `ntas_devicegraphiccards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `memory_default` int NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicegraphiccardmodels_id` int unsigned DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `chipset` (`chipset`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_deviceharddrivemodels

DROP TABLE IF EXISTS `ntas_deviceharddrivemodels`;
CREATE TABLE `ntas_deviceharddrivemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_deviceharddrivetypes

DROP TABLE IF EXISTS `ntas_deviceharddrivetypes`;
CREATE TABLE `ntas_deviceharddrivetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_deviceharddrives

DROP TABLE IF EXISTS `ntas_deviceharddrives`;
CREATE TABLE `ntas_deviceharddrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `rpm` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int unsigned NOT NULL DEFAULT '0',
  `cache` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `capacity_default` int NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `deviceharddrivemodels_id` int unsigned DEFAULT NULL,
  `deviceharddrivetypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`),
  KEY `deviceharddrivetypes_id` (`deviceharddrivetypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicecameras

DROP TABLE IF EXISTS `ntas_devicecameras`;
CREATE TABLE `ntas_devicecameras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `flashunit` tinyint NOT NULL DEFAULT '0',
  `lensfacing` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `focallength` varchar(255) DEFAULT NULL,
  `sensorsize` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicecameramodels_id` int unsigned DEFAULT NULL,
  `support` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecameramodels_id` (`devicecameramodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_items_devicecameras

DROP TABLE IF EXISTS `ntas_items_devicecameras`;
CREATE TABLE `ntas_items_devicecameras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_id` (`items_id`),
  KEY `devicecameras_id` (`devicecameras_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicecameramodels

DROP TABLE IF EXISTS `ntas_devicecameramodels`;
CREATE TABLE `ntas_devicecameramodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_imageformats

DROP TABLE IF EXISTS `ntas_imageformats`;
CREATE TABLE `ntas_imageformats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_imageresolutions

DROP TABLE IF EXISTS `ntas_imageresolutions`;
CREATE TABLE `ntas_imageresolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_video` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_video` (`is_video`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_items_devicecameras_imageformats`;
CREATE TABLE `ntas_items_devicecameras_imageformats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `imageformats_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageformats_id` (`imageformats_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_devicecameras_imageresolutions`;
CREATE TABLE `ntas_items_devicecameras_imageresolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int unsigned NOT NULL DEFAULT '0',
  `imageresolutions_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageresolutions_id` (`imageresolutions_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicememorymodels

DROP TABLE IF EXISTS `ntas_devicememorymodels`;
CREATE TABLE `ntas_devicememorymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicememories

DROP TABLE IF EXISTS `ntas_devicememories`;
CREATE TABLE `ntas_devicememories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `size_default` int NOT NULL DEFAULT '0',
  `devicememorytypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicememorymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicememorymodels_id` (`devicememorymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicememorytypes

DROP TABLE IF EXISTS `ntas_devicememorytypes`;
CREATE TABLE `ntas_devicememorytypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicemotherboardmodels

DROP TABLE IF EXISTS `ntas_devicemotherboardmodels`;
CREATE TABLE `ntas_devicemotherboardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicemotherboards

DROP TABLE IF EXISTS `ntas_devicemotherboards`;
CREATE TABLE `ntas_devicemotherboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicemotherboardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicenetworkcardmodels

DROP TABLE IF EXISTS `ntas_devicenetworkcardmodels`;
CREATE TABLE `ntas_devicenetworkcardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicenetworkcards

DROP TABLE IF EXISTS `ntas_devicenetworkcards`;
CREATE TABLE `ntas_devicenetworkcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `bandwidth` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `mac_default` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicepcimodels

DROP TABLE IF EXISTS `ntas_devicepcimodels`;
CREATE TABLE `ntas_devicepcimodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicepcis

DROP TABLE IF EXISTS `ntas_devicepcis`;
CREATE TABLE `ntas_devicepcis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicepcimodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepcimodels_id` (`devicepcimodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicepowersupplymodels

DROP TABLE IF EXISTS `ntas_devicepowersupplymodels`;
CREATE TABLE `ntas_devicepowersupplymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicepowersupplies

DROP TABLE IF EXISTS `ntas_devicepowersupplies`;
CREATE TABLE `ntas_devicepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `is_atx` tinyint NOT NULL DEFAULT '1',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicepowersupplymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_deviceprocessormodels

DROP TABLE IF EXISTS `ntas_deviceprocessormodels`;
CREATE TABLE `ntas_deviceprocessormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_deviceprocessors

DROP TABLE IF EXISTS `ntas_deviceprocessors`;
CREATE TABLE `ntas_deviceprocessors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` int NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `frequency_default` int NOT NULL DEFAULT '0',
  `nbcores_default` int DEFAULT NULL,
  `nbthreads_default` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `deviceprocessormodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesensors

DROP TABLE IF EXISTS `ntas_devicesensors`;
CREATE TABLE `ntas_devicesensors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicesensortypes_id` int unsigned NOT NULL DEFAULT '0',
  `devicesensormodels_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicesensortypes_id` (`devicesensortypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesensormodels_id` (`devicesensormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesensormodels

DROP TABLE IF EXISTS `ntas_devicesensormodels`;
CREATE TABLE `ntas_devicesensormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesensortypes

DROP TABLE IF EXISTS `ntas_devicesensortypes`;
CREATE TABLE `ntas_devicesensortypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesimcards

DROP TABLE IF EXISTS `ntas_devicesimcards`;
CREATE TABLE `ntas_devicesimcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `voltage` int DEFAULT NULL,
  `devicesimcardtypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_voip` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicesimcards

DROP TABLE IF EXISTS `ntas_items_devicesimcards`;
CREATE TABLE `ntas_items_devicesimcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `devicesimcards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `lines_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `pin` varchar(255) NOT NULL DEFAULT '',
  `pin2` varchar(255) NOT NULL DEFAULT '',
  `puk` varchar(255) NOT NULL DEFAULT '',
  `puk2` varchar(255) NOT NULL DEFAULT '',
  `msin` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `devicesimcards_id` (`devicesimcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `states_id` (`states_id`),
  KEY `locations_id` (`locations_id`),
  KEY `lines_id` (`lines_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesimcardtypes

DROP TABLE IF EXISTS `ntas_devicesimcardtypes`;
CREATE TABLE `ntas_devicesimcardtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesoundcardmodels

DROP TABLE IF EXISTS `ntas_devicesoundcardmodels`;
CREATE TABLE `ntas_devicesoundcardmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_devicesoundcards

DROP TABLE IF EXISTS `ntas_devicesoundcards`;
CREATE TABLE `ntas_devicesoundcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicesoundcardmodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_displaypreferences

DROP TABLE IF EXISTS `ntas_displaypreferences`;
CREATE TABLE `ntas_displaypreferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `num` int NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `interface` varchar(255) NOT NULL DEFAULT 'central',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`,`interface`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_documentcategories

DROP TABLE IF EXISTS `ntas_documentcategories`;
CREATE TABLE `ntas_documentcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `documentcategories_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_documents

DROP TABLE IF EXISTS `ntas_documents`;
CREATE TABLE `ntas_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `documentcategories_id` int unsigned NOT NULL DEFAULT '0',
  `mime` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `sha1sum` char(40) DEFAULT NULL,
  `is_blacklisted` tinyint NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`),
  KEY `tag` (`tag`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_documents_items

DROP TABLE IF EXISTS `ntas_documents_items`;
CREATE TABLE `ntas_documents_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documents_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`,`timeline_position`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `date` (`date`),
  KEY `timeline_position` (`timeline_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_documenttypes

DROP TABLE IF EXISTS `ntas_documenttypes`;
CREATE TABLE `ntas_documenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `is_uploadable` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_domains

DROP TABLE IF EXISTS `ntas_domains`;
CREATE TABLE `ntas_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `domaintypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_domaincreation` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domaintypes_id` (`domaintypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `is_active` (`is_active`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_domaincreation` (`date_domaincreation`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_dropdowntranslations

DROP TABLE IF EXISTS `ntas_dropdowntranslations`;
CREATE TABLE `ntas_dropdowntranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  KEY `language` (`language`),
  KEY `field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_entities

DROP TABLE IF EXISTS `ntas_entities`;
CREATE TABLE `ntas_entities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned DEFAULT '0',
  `completename` text,
  `comment` text,
  `level` int NOT NULL DEFAULT '0',
  `sons_cache` longtext,
  `ancestors_cache` longtext,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_email_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_email_name` varchar(255) DEFAULT NULL,
  `noreply_email` varchar(255) DEFAULT NULL,
  `noreply_email_name` varchar(255) DEFAULT NULL,
  `replyto_email` varchar(255) DEFAULT NULL,
  `replyto_email_name` varchar(255) DEFAULT NULL,
  `notification_subject_tag` varchar(255) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `authldaps_id` int unsigned NOT NULL DEFAULT '0',
  `mail_domain` varchar(255) DEFAULT NULL,
  `entity_ldapfilter` text,
  `mailing_signature` text,
  `url_base` text,
  `cartridges_alert_repeat` int NOT NULL DEFAULT '-2',
  `consumables_alert_repeat` int NOT NULL DEFAULT '-2',
  `use_licenses_alert` int NOT NULL DEFAULT '-2',
  `send_licenses_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_certificates_alert` int NOT NULL DEFAULT '-2',
  `send_certificates_alert_before_delay` int NOT NULL DEFAULT '-2',
  `certificates_alert_repeat_interval` int NOT NULL DEFAULT '-2',
  `use_contracts_alert` int NOT NULL DEFAULT '-2',
  `send_contracts_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_infocoms_alert` int NOT NULL DEFAULT '-2',
  `send_infocoms_alert_before_delay` int NOT NULL DEFAULT '-2',
  `use_reservations_alert` int NOT NULL DEFAULT '-2',
  `use_domains_alert` int NOT NULL DEFAULT '-2',
  `send_domains_alert_close_expiries_delay` int NOT NULL DEFAULT '-2',
  `send_domains_alert_expired_delay` int NOT NULL DEFAULT '-2',
  `autoclose_delay` int NOT NULL DEFAULT '-2',
  `autopurge_delay` int NOT NULL DEFAULT '-2',
  `notclosed_delay` int NOT NULL DEFAULT '-2',
  `calendars_strategy` tinyint NOT NULL DEFAULT '-2',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `auto_assign_mode` int NOT NULL DEFAULT '-2',
  `tickettype` int NOT NULL DEFAULT '-2',
  `max_closedate` timestamp NULL DEFAULT NULL,
  `inquest_config` int NOT NULL DEFAULT '-2',
  `inquest_rate` int NOT NULL DEFAULT '0',
  `inquest_delay` int NOT NULL DEFAULT '-10',
  `inquest_URL` text,
  `inquest_max_rate` int NOT NULL DEFAULT '5',
  `inquest_default_rate` int NOT NULL DEFAULT '3',
  `inquest_mandatory_comment` int NOT NULL DEFAULT '0',
  `max_closedate_change` timestamp NULL DEFAULT NULL,
  `inquest_config_change` int NOT NULL DEFAULT '-2',
  `inquest_rate_change` int NOT NULL DEFAULT '0',
  `inquest_delay_change` int NOT NULL DEFAULT '-10',
  `inquest_URL_change` text,
  `inquest_max_rate_change` int NOT NULL DEFAULT '5',
  `inquest_default_rate_change` int NOT NULL DEFAULT '3',
  `inquest_mandatory_comment_change` int NOT NULL DEFAULT '0',
  `autofill_warranty_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) NOT NULL DEFAULT '-2',
  `tickettemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_strategy` tinyint NOT NULL DEFAULT '-2',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_strategy_software` tinyint NOT NULL DEFAULT '-2',
  `entities_id_software` int unsigned NOT NULL DEFAULT '0',
  `default_contract_alert` int NOT NULL DEFAULT '-2',
  `default_infocom_alert` int NOT NULL DEFAULT '-2',
  `default_cartridges_alarm_threshold` int NOT NULL DEFAULT '-2',
  `default_consumables_alarm_threshold` int NOT NULL DEFAULT '-2',
  `delay_send_emails` int NOT NULL DEFAULT '-2',
  `is_notif_enable_default` int NOT NULL DEFAULT '-2',
  `inquest_duration` int NOT NULL DEFAULT '0',
  `inquest_duration_change` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autofill_decommission_date` varchar(255) NOT NULL DEFAULT '-2',
  `suppliers_as_private` int NOT NULL DEFAULT '-2',
  `anonymize_support_agents` int NOT NULL DEFAULT '-2',
  `display_users_initials` int NOT NULL DEFAULT '-2',
  `contracts_strategy_default` tinyint NOT NULL DEFAULT '-2',
  `contracts_id_default` int unsigned NOT NULL DEFAULT '0',
  `enable_custom_css` int NOT NULL DEFAULT '-2',
  `custom_css_code` text,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `transfers_strategy` tinyint NOT NULL DEFAULT '-2',
  `transfers_id` int unsigned NOT NULL DEFAULT '0',
  `agent_base_url` varchar(255) DEFAULT NULL,
  `approval_reminder_repeat_interval` int NOT NULL DEFAULT '-2',
  `2fa_enforcement_strategy` tinyint NOT NULL DEFAULT '-2',
  `is_contact_autoupdate` tinyint NOT NULL DEFAULT '-2',
  `is_user_autoupdate` tinyint NOT NULL DEFAULT '-2',
  `is_group_autoupdate` tinyint NOT NULL DEFAULT '-2',
  `is_location_autoupdate` tinyint NOT NULL DEFAULT '-2',
  `state_autoupdate_mode` int NOT NULL DEFAULT '-2',
  `is_contact_autoclean` tinyint NOT NULL DEFAULT '-2',
  `is_user_autoclean` tinyint NOT NULL DEFAULT '-2',
  `is_group_autoclean` tinyint NOT NULL DEFAULT '-2',
  `is_location_autoclean` tinyint NOT NULL DEFAULT '-2',
  `state_autoclean_mode` int NOT NULL DEFAULT '-2',
  `show_tickets_properties_on_helpdesk` int NOT NULL DEFAULT '-2',
  `custom_helpdesk_home_scene_left` varchar(255) NOT NULL DEFAULT '-2',
  `custom_helpdesk_home_scene_right` varchar(255) NOT NULL DEFAULT '-2',
  `custom_helpdesk_home_title` varchar(255) NOT NULL DEFAULT '-2',
  `enable_helpdesk_home_search_bar` tinyint NOT NULL DEFAULT '-2',
  `enable_helpdesk_service_catalog` tinyint NOT NULL DEFAULT '-2',
  `expand_service_catalog` tinyint NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `transfers_id` (`transfers_id`),
  KEY `authldaps_id` (`authldaps_id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `entities_id_software` (`entities_id_software`),
  KEY `contracts_id_default` (`contracts_id_default`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_entities_knowbaseitems

DROP TABLE IF EXISTS `ntas_entities_knowbaseitems`;
CREATE TABLE `ntas_entities_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_entities_reminders

DROP TABLE IF EXISTS `ntas_entities_reminders`;
CREATE TABLE `ntas_entities_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_entities_rssfeeds

DROP TABLE IF EXISTS `ntas_entities_rssfeeds`;
CREATE TABLE `ntas_entities_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_events

DROP TABLE IF EXISTS `ntas_events`;
CREATE TABLE `ntas_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `level` int NOT NULL DEFAULT '0',
  `message` text,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_fieldblacklists

DROP TABLE IF EXISTS `ntas_fieldblacklists`;
CREATE TABLE `ntas_fieldblacklists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_fieldunicities

DROP TABLE IF EXISTS `ntas_fieldunicities`;
CREATE TABLE `ntas_fieldunicities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `fields` text,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `action_refuse` tinyint NOT NULL DEFAULT '0',
  `action_notify` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores field unicity criterias';


### Dump table ntas_filesystems

DROP TABLE IF EXISTS `ntas_filesystems`;
CREATE TABLE `ntas_filesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_fqdns

DROP TABLE IF EXISTS `ntas_fqdns`;
CREATE TABLE `ntas_fqdns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `fqdn` (`fqdn`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups

DROP TABLE IF EXISTS `ntas_groups`;
CREATE TABLE `ntas_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `comment` text,
  `ldap_field` varchar(255) DEFAULT NULL,
  `ldap_value` text,
  `ldap_group_dn` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `is_requester` tinyint NOT NULL DEFAULT '1',
  `is_watcher` tinyint NOT NULL DEFAULT '1',
  `is_assign` tinyint NOT NULL DEFAULT '1',
  `is_task` tinyint NOT NULL DEFAULT '1',
  `is_notify` tinyint NOT NULL DEFAULT '1',
  `is_itemgroup` tinyint NOT NULL DEFAULT '1',
  `is_usergroup` tinyint NOT NULL DEFAULT '1',
  `is_manager` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  `recursive_membership` tinyint NOT NULL DEFAULT '0',
  `2fa_enforced` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_watcher` (`is_watcher`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`),
  KEY `is_manager` (`is_manager`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_knowbaseitems

DROP TABLE IF EXISTS `ntas_groups_knowbaseitems`;
CREATE TABLE `ntas_groups_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_problems

DROP TABLE IF EXISTS `ntas_groups_problems`;
CREATE TABLE `ntas_groups_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_reminders

DROP TABLE IF EXISTS `ntas_groups_reminders`;
CREATE TABLE `ntas_groups_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_rssfeeds

DROP TABLE IF EXISTS `ntas_groups_rssfeeds`;
CREATE TABLE `ntas_groups_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_tickets

DROP TABLE IF EXISTS `ntas_groups_tickets`;
CREATE TABLE `ntas_groups_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_groups_users

DROP TABLE IF EXISTS `ntas_groups_users`;
CREATE TABLE `ntas_groups_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_manager` tinyint NOT NULL DEFAULT '0',
  `is_userdelegate` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_helpdesks_tiles_profiles_tiles

DROP TABLE IF EXISTS `ntas_helpdesks_tiles_items_tiles`;
CREATE TABLE `ntas_helpdesks_tiles_items_tiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype_item` varchar(255) DEFAULT NULL,
  `items_id_item` int unsigned NOT NULL DEFAULT '0',
  `itemtype_tile` varchar(255) DEFAULT NULL,
  `items_id_tile` int unsigned NOT NULL DEFAULT '0',
  `rank` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype_item`, `items_id_item`, `rank`),
  UNIQUE KEY `item` (`itemtype_tile`,`items_id_tile`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_helpdesks_tiles_formtiles

DROP TABLE IF EXISTS `ntas_helpdesks_tiles_formtiles`;
CREATE TABLE `ntas_helpdesks_tiles_formtiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `forms_forms_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forms_forms_id` (`forms_forms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_helpdesks_tiles_glpipagetiles

DROP TABLE IF EXISTS `ntas_helpdesks_tiles_glpipagetiles`;
CREATE TABLE `ntas_helpdesks_tiles_glpipagetiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT null,
  `illustration` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_helpdesks_tiles_externalpagetiles

DROP TABLE IF EXISTS `ntas_helpdesks_tiles_externalpagetiles`;
CREATE TABLE `ntas_helpdesks_tiles_externalpagetiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT null,
  `illustration` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_holidays

DROP TABLE IF EXISTS `ntas_holidays`;
CREATE TABLE `ntas_holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_infocoms

DROP TABLE IF EXISTS `ntas_infocoms`;
CREATE TABLE `ntas_infocoms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int NOT NULL DEFAULT '0',
  `warranty_info` varchar(255) DEFAULT NULL,
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `order_number` varchar(255) DEFAULT NULL,
  `delivery_number` varchar(255) DEFAULT NULL,
  `immo_number` varchar(255) DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `warranty_value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sink_time` int NOT NULL DEFAULT '0',
  `sink_type` int NOT NULL DEFAULT '0',
  `sink_coeff` float NOT NULL DEFAULT '0',
  `comment` text,
  `bill` varchar(255) DEFAULT NULL,
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `alert` int NOT NULL DEFAULT '0',
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `decommission_date` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `businesscriticities_id` (`businesscriticities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_interfacetypes

DROP TABLE IF EXISTS `ntas_interfacetypes`;
CREATE TABLE `ntas_interfacetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ipaddresses

DROP TABLE IF EXISTS `ntas_ipaddresses`;
CREATE TABLE `ntas_ipaddresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `version` tinyint unsigned DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `binary_0` int unsigned NOT NULL DEFAULT '0',
  `binary_1` int unsigned NOT NULL DEFAULT '0',
  `binary_2` int unsigned NOT NULL DEFAULT '0',
  `binary_3` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `mainitems_id` int unsigned NOT NULL DEFAULT '0',
  `mainitemtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ipaddresses_ipnetworks

DROP TABLE IF EXISTS `ntas_ipaddresses_ipnetworks`;
CREATE TABLE `ntas_ipaddresses_ipnetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipaddresses_id` int unsigned NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ipnetworks

DROP TABLE IF EXISTS `ntas_ipnetworks`;
CREATE TABLE `ntas_ipnetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `addressable` tinyint NOT NULL DEFAULT '0',
  `version` tinyint unsigned DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `address_0` int unsigned NOT NULL DEFAULT '0',
  `address_1` int unsigned NOT NULL DEFAULT '0',
  `address_2` int unsigned NOT NULL DEFAULT '0',
  `address_3` int unsigned NOT NULL DEFAULT '0',
  `netmask` varchar(40) DEFAULT NULL,
  `netmask_0` int unsigned NOT NULL DEFAULT '0',
  `netmask_1` int unsigned NOT NULL DEFAULT '0',
  `netmask_2` int unsigned NOT NULL DEFAULT '0',
  `netmask_3` int unsigned NOT NULL DEFAULT '0',
  `gateway` varchar(40) DEFAULT NULL,
  `gateway_0` int unsigned NOT NULL DEFAULT '0',
  `gateway_1` int unsigned NOT NULL DEFAULT '0',
  `gateway_2` int unsigned NOT NULL DEFAULT '0',
  `gateway_3` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `network_definition` (`entities_id`,`address`,`netmask`),
  KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ipnetworks_vlans

DROP TABLE IF EXISTS `ntas_ipnetworks_vlans`;
CREATE TABLE `ntas_ipnetworks_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `vlans_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicecases

DROP TABLE IF EXISTS `ntas_items_devicecases`;
CREATE TABLE `ntas_items_devicecases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecases_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicecases_id` (`devicecases_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicecontrols

DROP TABLE IF EXISTS `ntas_items_devicecontrols`;
CREATE TABLE `ntas_items_devicecontrols` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecontrols_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicecontrols_id` (`devicecontrols_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicedrives

DROP TABLE IF EXISTS `ntas_items_devicedrives`;
CREATE TABLE `ntas_items_devicedrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicedrives_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicedrives_id` (`devicedrives_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicegenerics

DROP TABLE IF EXISTS `ntas_items_devicegenerics`;
CREATE TABLE `ntas_items_devicegenerics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegenerics_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicegenerics_id` (`devicegenerics_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicegraphiccards

DROP TABLE IF EXISTS `ntas_items_devicegraphiccards`;
CREATE TABLE `ntas_items_devicegraphiccards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegraphiccards_id` int unsigned NOT NULL DEFAULT '0',
  `memory` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`memory`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_deviceharddrives

DROP TABLE IF EXISTS `ntas_items_deviceharddrives`;
CREATE TABLE `ntas_items_deviceharddrives` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceharddrives_id` int unsigned NOT NULL DEFAULT '0',
  `capacity` int NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`capacity`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicememories

DROP TABLE IF EXISTS `ntas_items_devicememories`;
CREATE TABLE `ntas_items_devicememories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicememories_id` int unsigned NOT NULL DEFAULT '0',
  `size` int NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`size`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicemotherboards

DROP TABLE IF EXISTS `ntas_items_devicemotherboards`;
CREATE TABLE `ntas_items_devicemotherboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicemotherboards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicenetworkcards

DROP TABLE IF EXISTS `ntas_items_devicenetworkcards`;
CREATE TABLE `ntas_items_devicenetworkcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `mac` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicepcis

DROP TABLE IF EXISTS `ntas_items_devicepcis`;
CREATE TABLE `ntas_items_devicepcis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepcis_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicepcis_id` (`devicepcis_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicepowersupplies

DROP TABLE IF EXISTS `ntas_items_devicepowersupplies`;
CREATE TABLE `ntas_items_devicepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepowersupplies_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_deviceprocessors

DROP TABLE IF EXISTS `ntas_items_deviceprocessors`;
CREATE TABLE `ntas_items_deviceprocessors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceprocessors_id` int unsigned NOT NULL DEFAULT '0',
  `frequency` int NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `nbcores` int DEFAULT NULL,
  `nbthreads` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`frequency`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `nbcores` (`nbcores`),
  KEY `nbthreads` (`nbthreads`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicesensors

DROP TABLE IF EXISTS `ntas_items_devicesensors`;
CREATE TABLE `ntas_items_devicesensors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesensors_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicesensors_id` (`devicesensors_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_devicesoundcards

DROP TABLE IF EXISTS `ntas_items_devicesoundcards`;
CREATE TABLE `ntas_items_devicesoundcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesoundcards_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_problems

DROP TABLE IF EXISTS `ntas_items_problems`;
CREATE TABLE `ntas_items_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_items_processes

DROP TABLE IF EXISTS `ntas_items_processes`;
CREATE TABLE `ntas_items_processes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `cmd` text,
  `cpuusage` float NOT NULL DEFAULT '0',
  `memusage` float NOT NULL DEFAULT '0',
  `pid` int NOT NULL DEFAULT '1',
  `started` timestamp NULL DEFAULT NULL,
  `tty` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `virtualmemory` bigint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_environments

DROP TABLE IF EXISTS `ntas_items_environments`;
CREATE TABLE `ntas_items_environments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_projects

DROP TABLE IF EXISTS `ntas_items_projects`;
CREATE TABLE `ntas_items_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_items_tickets

DROP TABLE IF EXISTS `ntas_items_tickets`;
CREATE TABLE `ntas_items_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_itilcategories

DROP TABLE IF EXISTS `ntas_itilcategories`;
CREATE TABLE `ntas_itilcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `completename` text,
  `comment` text,
  `level` int NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `is_helpdeskvisible` tinyint NOT NULL DEFAULT '1',
  `tickettemplates_id_incident` int unsigned NOT NULL DEFAULT '0',
  `tickettemplates_id_demand` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_incident` int NOT NULL DEFAULT '1',
  `is_request` int NOT NULL DEFAULT '1',
  `is_problem` int NOT NULL DEFAULT '1',
  `is_change` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_itils_projects

DROP TABLE IF EXISTS `ntas_itils_projects`;
CREATE TABLE `ntas_itils_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  KEY `projects_id` (`projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitemcategories

DROP TABLE IF EXISTS `ntas_knowbaseitemcategories`;
CREATE TABLE `ntas_knowbaseitemcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `completename` text,
  `comment` text,
  `level` int NOT NULL DEFAULT '0',
  `sons_cache` longtext,
  `ancestors_cache` longtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitems

DROP TABLE IF EXISTS `ntas_knowbaseitems`;
CREATE TABLE `ntas_knowbaseitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `forms_categories_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` text,
  `answer` longtext,
  `is_faq` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `view` int NOT NULL DEFAULT '0',
  `show_in_service_catalog` tinyint NOT NULL DEFAULT '0',
  `description` longtext DEFAULT NULL,
  `illustration` varchar(255) DEFAULT NULL,
  `is_pinned` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `forms_categories_id` (`forms_categories_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitems_knowbaseitemcategories

DROP TABLE IF EXISTS `ntas_knowbaseitems_knowbaseitemcategories`;
CREATE TABLE `ntas_knowbaseitems_knowbaseitemcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitems_profiles

DROP TABLE IF EXISTS `ntas_knowbaseitems_profiles`;
CREATE TABLE `ntas_knowbaseitems_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitems_users

DROP TABLE IF EXISTS `ntas_knowbaseitems_users`;
CREATE TABLE `ntas_knowbaseitems_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_knowbaseitemtranslations

DROP TABLE IF EXISTS `ntas_knowbaseitemtranslations`;
CREATE TABLE `ntas_knowbaseitemtranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) DEFAULT NULL,
  `name` text,
  `answer` longtext,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`knowbaseitems_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_lines

DROP TABLE IF EXISTS `ntas_lines`;
CREATE TABLE `ntas_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `caller_num` varchar(255) NOT NULL DEFAULT '',
  `caller_name` varchar(255) NOT NULL DEFAULT '',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `lineoperators_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `linetypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `lineoperators_id` (`lineoperators_id`),
  KEY `linetypes_id` (`linetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_lineoperators

DROP TABLE IF EXISTS `ntas_lineoperators`;
CREATE TABLE `ntas_lineoperators` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `mcc` int DEFAULT NULL,
  `mnc` int DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`mcc`,`mnc`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_linetypes`;
CREATE TABLE `ntas_linetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_links

DROP TABLE IF EXISTS `ntas_links`;
CREATE TABLE `ntas_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` text,
  `open_window` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_links_itemtypes

DROP TABLE IF EXISTS `ntas_links_itemtypes`;
CREATE TABLE `ntas_links_itemtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `links_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_locations

DROP TABLE IF EXISTS `ntas_locations`;
CREATE TABLE `ntas_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `comment` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `address` text,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_logs

DROP TABLE IF EXISTS `ntas_logs`;
CREATE TABLE `ntas_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype_link` varchar(100) NOT NULL DEFAULT '',
  `linked_action` int NOT NULL DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `id_search_option` int NOT NULL DEFAULT '0',
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `old_id` int unsigned DEFAULT NULL,
  `new_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `id_search_option` (`id_search_option`),
  KEY `old_id` (`old_id`),
  KEY `new_id` (`new_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_mailcollectors

DROP TABLE IF EXISTS `ntas_mailcollectors`;
CREATE TABLE `ntas_mailcollectors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `filesize_max` int NOT NULL DEFAULT '2097152',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `passwd` varchar(255) DEFAULT NULL,
  `accepted` varchar(255) DEFAULT NULL,
  `refused` varchar(255) DEFAULT NULL,
  `errors` int NOT NULL DEFAULT '0',
  `use_mail_date` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `requester_field` int NOT NULL DEFAULT '0',
  `add_to_to_observer` tinyint NOT NULL DEFAULT '1',
  `add_cc_to_observer` tinyint NOT NULL DEFAULT '0',
  `collect_only_unread` tinyint NOT NULL DEFAULT '0',
  `create_user_from_email` tinyint NOT NULL DEFAULT '0',
  `last_collect_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `last_collect_date` (`last_collect_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_manufacturers

DROP TABLE IF EXISTS `ntas_manufacturers`;
CREATE TABLE `ntas_manufacturers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_monitormodels

DROP TABLE IF EXISTS `ntas_monitormodels`;
CREATE TABLE `ntas_monitormodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_monitors

DROP TABLE IF EXISTS `ntas_monitors`;
CREATE TABLE `ntas_monitors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT '0.00',
  `have_micro` tinyint NOT NULL DEFAULT '0',
  `have_speaker` tinyint NOT NULL DEFAULT '0',
  `have_subd` tinyint NOT NULL DEFAULT '0',
  `have_bnc` tinyint NOT NULL DEFAULT '0',
  `have_dvi` tinyint NOT NULL DEFAULT '0',
  `have_pivot` tinyint NOT NULL DEFAULT '0',
  `have_hdmi` tinyint NOT NULL DEFAULT '0',
  `have_displayport` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `monitortypes_id` int unsigned NOT NULL DEFAULT '0',
  `monitormodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_monitortypes

DROP TABLE IF EXISTS `ntas_monitortypes`;
CREATE TABLE `ntas_monitortypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_sockets

DROP TABLE IF EXISTS `ntas_sockets`;
CREATE TABLE `ntas_sockets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `socketmodels_id` int unsigned NOT NULL DEFAULT '0',
  `wiring_side` tinyint DEFAULT '1',
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `socketmodels_id` (`socketmodels_id`),
  KEY `location_name` (`locations_id`,`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `networkports_id` (`networkports_id`),
  KEY `wiring_side` (`wiring_side`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cables

DROP TABLE IF EXISTS `ntas_cables`;
CREATE TABLE `ntas_cables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `itemtype_endpoint_a` varchar(255) DEFAULT NULL,
  `itemtype_endpoint_b` varchar(255) DEFAULT NULL,
  `items_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `items_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `socketmodels_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `socketmodels_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `sockets_id_endpoint_a` int unsigned NOT NULL DEFAULT '0',
  `sockets_id_endpoint_b` int unsigned NOT NULL DEFAULT '0',
  `cablestrands_id` int unsigned NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `cabletypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item_endpoint_a` (`itemtype_endpoint_a`,`items_id_endpoint_a`),
  KEY `item_endpoint_b` (`itemtype_endpoint_b`,`items_id_endpoint_b`),
  KEY `items_id_endpoint_b` (`items_id_endpoint_b`),
  KEY `items_id_endpoint_a` (`items_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_a` (`socketmodels_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_b` (`socketmodels_id_endpoint_b`),
  KEY `sockets_id_endpoint_a` (`sockets_id_endpoint_a`),
  KEY `sockets_id_endpoint_b` (`sockets_id_endpoint_b`),
  KEY `cablestrands_id` (`cablestrands_id`),
  KEY `states_id` (`states_id`),
  KEY `complete` (`entities_id`,`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_template` (`is_template`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cabletypes_id` (`cabletypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `active_assets` (`is_deleted`, `is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cabletypes

DROP TABLE IF EXISTS `ntas_cabletypes`;
CREATE TABLE `ntas_cabletypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_cablestrands

DROP TABLE IF EXISTS `ntas_cablestrands`;
CREATE TABLE `ntas_cablestrands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_socketmodels

DROP TABLE IF EXISTS `ntas_socketmodels`;
CREATE TABLE `ntas_socketmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkaliases

DROP TABLE IF EXISTS `ntas_networkaliases`;
CREATE TABLE `ntas_networkaliases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `networknames_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `fqdns_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `networknames_id` (`networknames_id`),
  KEY `fqdns_id` (`fqdns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkequipmentmodels

DROP TABLE IF EXISTS `ntas_networkequipmentmodels`;
CREATE TABLE `ntas_networkequipmentmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkequipments

DROP TABLE IF EXISTS `ntas_networkequipments`;
CREATE TABLE `ntas_networkequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `ram` int unsigned DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `networkequipmenttypes_id` int unsigned NOT NULL DEFAULT '0',
  `networkequipmentmodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `sysdescr` text,
  `cpu` int NOT NULL DEFAULT '0',
  `uptime` varchar(255) NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkequipmenttypes

DROP TABLE IF EXISTS `ntas_networkequipmenttypes`;
CREATE TABLE `ntas_networkequipmenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkinterfaces

DROP TABLE IF EXISTS `ntas_networkinterfaces`;
CREATE TABLE `ntas_networkinterfaces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networknames

DROP TABLE IF EXISTS `ntas_networknames`;
CREATE TABLE `ntas_networknames` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `fqdns_id` int unsigned NOT NULL DEFAULT '0',
  `ipnetworks_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `FQDN` (`name`,`fqdns_id`),
  KEY `fqdns_id` (`fqdns_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportaggregates

DROP TABLE IF EXISTS `ntas_networkportaggregates`;
CREATE TABLE `ntas_networkportaggregates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_list` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportaliases

DROP TABLE IF EXISTS `ntas_networkportaliases`;
CREATE TABLE `ntas_networkportaliases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_alias` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `networkports_id_alias` (`networkports_id_alias`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportdialups

DROP TABLE IF EXISTS `ntas_networkportdialups`;
CREATE TABLE `ntas_networkportdialups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportethernets

DROP TABLE IF EXISTS `ntas_networkportethernets`;
CREATE TABLE `ntas_networkportethernets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT '',
  `speed` int NOT NULL DEFAULT '10',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`type`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportbnctypes

DROP TABLE IF EXISTS `ntas_networkportfiberchanneltypes`;
CREATE TABLE `ntas_networkportfiberchanneltypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportfiberchannels

DROP TABLE IF EXISTS `ntas_networkportfiberchannels`;
CREATE TABLE `ntas_networkportfiberchannels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `networkportfiberchanneltypes_id` int unsigned NOT NULL DEFAULT '0',
  `wwn` varchar(50) DEFAULT '',
  `speed` int NOT NULL DEFAULT '10',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`networkportfiberchanneltypes_id`),
  KEY `wwn` (`wwn`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportlocals

DROP TABLE IF EXISTS `ntas_networkportlocals`;
CREATE TABLE `ntas_networkportlocals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkports

DROP TABLE IF EXISTS `ntas_networkports`;
CREATE TABLE `ntas_networkports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `logical_number` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `ifmtu` int NOT NULL DEFAULT '0',
  `ifspeed` bigint NOT NULL DEFAULT '0',
  `ifinternalstatus` varchar(255) DEFAULT NULL,
  `ifconnectionstatus` int NOT NULL DEFAULT '0',
  `iflastchange` varchar(255) DEFAULT NULL,
  `ifinbytes` bigint NOT NULL DEFAULT '0',
  `ifinerrors` bigint NOT NULL DEFAULT '0',
  `ifoutbytes` bigint NOT NULL DEFAULT '0',
  `ifouterrors` bigint NOT NULL DEFAULT '0',
  `ifstatus` varchar(255) DEFAULT NULL,
  `ifdescr` varchar(255) DEFAULT NULL,
  `ifalias` varchar(255) DEFAULT NULL,
  `portduplex` varchar(255) DEFAULT NULL,
  `trunk` tinyint NOT NULL DEFAULT '0',
  `lastup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `mac` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkports_networkports

DROP TABLE IF EXISTS `ntas_networkports_networkports`;
CREATE TABLE `ntas_networkports_networkports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_2` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkports_vlans

DROP TABLE IF EXISTS `ntas_networkports_vlans`;
CREATE TABLE `ntas_networkports_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `vlans_id` int unsigned NOT NULL DEFAULT '0',
  `tagged` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networkportwifis

DROP TABLE IF EXISTS `ntas_networkportwifis`;
CREATE TABLE `ntas_networkportwifis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int unsigned NOT NULL DEFAULT '0',
  `wifinetworks_id` int unsigned NOT NULL DEFAULT '0',
  `networkportwifis_id` int unsigned NOT NULL DEFAULT '0',
  `version` varchar(20) DEFAULT NULL,
  `mode` varchar(20) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `essid` (`wifinetworks_id`),
  KEY `version` (`version`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `networkportwifis_id` (`networkportwifis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_networks

DROP TABLE IF EXISTS `ntas_networks`;
CREATE TABLE `ntas_networks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_notepads

DROP TABLE IF EXISTS `ntas_notepads`;
CREATE TABLE `ntas_notepads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `visible_from_ticket` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_notifications

DROP TABLE IF EXISTS `ntas_notifications`;
CREATE TABLE `ntas_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `event` varchar(255) NOT NULL,
  `comment` text,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_response` tinyint NOT NULL DEFAULT '1',
  `attach_documents` tinyint NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;



### Dump table ntas_notifications_notificationtemplates

DROP TABLE IF EXISTS `ntas_notifications_notificationtemplates`;
CREATE TABLE `ntas_notifications_notificationtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notifications_id` int unsigned NOT NULL DEFAULT '0',
  `mode` varchar(20) NOT NULL,
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;



### Dump table ntas_notificationtargets

DROP TABLE IF EXISTS `ntas_notificationtargets`;
CREATE TABLE `ntas_notificationtargets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `notifications_id` int unsigned NOT NULL DEFAULT '0',
  `is_exclusion` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`notifications_id`,`items_id`,`type`),
  KEY `items` (`type`,`items_id`),
  KEY `is_exclusion` (`is_exclusion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_notificationtemplates

DROP TABLE IF EXISTS `ntas_notificationtemplates`;
CREATE TABLE `ntas_notificationtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `css` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_notificationtemplatetranslations

DROP TABLE IF EXISTS `ntas_notificationtemplatetranslations`;
CREATE TABLE `ntas_notificationtemplatetranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL,
  `content_text` longtext,
  `content_html` longtext,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_notimportedemails

DROP TABLE IF EXISTS `ntas_notimportedemails`;
CREATE TABLE `ntas_notimportedemails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` text,
  `messageid` varchar(255) NOT NULL,
  `reason` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_objectlocks

DROP TABLE IF EXISTS `ntas_objectlocks`;
CREATE TABLE `ntas_objectlocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystemarchitectures

DROP TABLE IF EXISTS `ntas_operatingsystemarchitectures`;
CREATE TABLE `ntas_operatingsystemarchitectures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystems

DROP TABLE IF EXISTS `ntas_operatingsystems`;
CREATE TABLE `ntas_operatingsystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystemservicepacks

DROP TABLE IF EXISTS `ntas_operatingsystemservicepacks`;
CREATE TABLE `ntas_operatingsystemservicepacks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_operatingsystemversions

DROP TABLE IF EXISTS `ntas_operatingsystemversions`;
CREATE TABLE `ntas_operatingsystemversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_passivedcequipments

DROP TABLE IF EXISTS `ntas_passivedcequipments`;
CREATE TABLE `ntas_passivedcequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `passivedcequipmentmodels_id` int unsigned DEFAULT NULL,
  `passivedcequipmenttypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `passivedcequipmentmodels_id` (`passivedcequipmentmodels_id`),
  KEY `passivedcequipmenttypes_id` (`passivedcequipmenttypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_passivedcequipmentmodels

DROP TABLE IF EXISTS `ntas_passivedcequipmentmodels`;
CREATE TABLE `ntas_passivedcequipmentmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_peripheralmodels


### Dump table ntas_passivedcequipmenttypes

DROP TABLE IF EXISTS `ntas_passivedcequipmenttypes`;
CREATE TABLE `ntas_passivedcequipmenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_peripheralmodels`;
CREATE TABLE `ntas_peripheralmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_peripherals

DROP TABLE IF EXISTS `ntas_peripherals`;
CREATE TABLE `ntas_peripherals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `peripheraltypes_id` int unsigned NOT NULL DEFAULT '0',
  `peripheralmodels_id` int unsigned NOT NULL DEFAULT '0',
  `brand` varchar(255) DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_peripheraltypes

DROP TABLE IF EXISTS `ntas_peripheraltypes`;
CREATE TABLE `ntas_peripheraltypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_phonemodels

DROP TABLE IF EXISTS `ntas_phonemodels`;
CREATE TABLE `ntas_phonemodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_phonepowersupplies

DROP TABLE IF EXISTS `ntas_phonepowersupplies`;
CREATE TABLE `ntas_phonepowersupplies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_phones

DROP TABLE IF EXISTS `ntas_phones`;
CREATE TABLE `ntas_phones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `phonetypes_id` int unsigned NOT NULL DEFAULT '0',
  `phonemodels_id` int unsigned NOT NULL DEFAULT '0',
  `brand` varchar(255) DEFAULT NULL,
  `phonepowersupplies_id` int unsigned NOT NULL DEFAULT '0',
  `number_line` varchar(255) DEFAULT NULL,
  `have_headset` tinyint NOT NULL DEFAULT '0',
  `have_hp` tinyint NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_phonetypes

DROP TABLE IF EXISTS `ntas_phonetypes`;
CREATE TABLE `ntas_phonetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_planningrecalls

DROP TABLE IF EXISTS `ntas_planningrecalls`;
CREATE TABLE `ntas_planningrecalls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `before_time` int NOT NULL DEFAULT '-10',
  `when` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `before_time` (`before_time`),
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_plugins

DROP TABLE IF EXISTS `ntas_plugins`;
CREATE TABLE `ntas_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `author` varchar(255) DEFAULT NULL,
  `highest_available_version` varchar(255),
  `homepage` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_printermodels

DROP TABLE IF EXISTS `ntas_printermodels`;
CREATE TABLE `ntas_printermodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_printers

DROP TABLE IF EXISTS `ntas_printers`;
CREATE TABLE `ntas_printers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `have_serial` tinyint NOT NULL DEFAULT '0',
  `have_parallel` tinyint NOT NULL DEFAULT '0',
  `have_usb` tinyint NOT NULL DEFAULT '0',
  `have_wifi` tinyint NOT NULL DEFAULT '0',
  `have_ethernet` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `memory_size` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `printertypes_id` int unsigned NOT NULL DEFAULT '0',
  `printermodels_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_global` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `init_pages_counter` int NOT NULL DEFAULT '0',
  `last_pages_counter` int NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `sysdescr` text,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `last_pages_counter` (`last_pages_counter`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_printertypes

DROP TABLE IF EXISTS `ntas_printertypes`;
CREATE TABLE `ntas_printertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problemcosts

DROP TABLE IF EXISTS `ntas_problemcosts`;
CREATE TABLE `ntas_problemcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `problems_id` (`problems_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problems

DROP TABLE IF EXISTS `ntas_problems`;
CREATE TABLE `ntas_problems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `content` longtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `impactcontent` longtext,
  `causecontent` longtext,
  `symptomcontent` longtext,
  `actiontime` int NOT NULL DEFAULT '0',
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problems_suppliers

DROP TABLE IF EXISTS `ntas_problems_suppliers`;
CREATE TABLE `ntas_problems_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problems_tickets

DROP TABLE IF EXISTS `ntas_problems_tickets`;
CREATE TABLE `ntas_problems_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `link` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problems_users

DROP TABLE IF EXISTS `ntas_problems_users`;
CREATE TABLE `ntas_problems_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_problemtasks

DROP TABLE IF EXISTS `ntas_problemtasks`;
CREATE TABLE `ntas_problemtasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `problems_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `actiontime` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_profilerights

DROP TABLE IF EXISTS `ntas_profilerights`;
CREATE TABLE `ntas_profilerights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `rights` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`profiles_id`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_profiles

DROP TABLE IF EXISTS `ntas_profiles`;
CREATE TABLE `ntas_profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT 'helpdesk',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `helpdesk_hardware` int NOT NULL DEFAULT '0',
  `helpdesk_item_type` text,
  `use_mentions` int NOT NULL DEFAULT '1',
  `ticket_status` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `problem_status` text,
  `create_ticket_on_login` tinyint NOT NULL DEFAULT '0',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `change_status` text,
  `managed_domainrecordtypes` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `2fa_enforced` tinyint NOT NULL DEFAULT '0',
  `last_rights_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `last_rights_update` (`last_rights_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_profiles_reminders

DROP TABLE IF EXISTS `ntas_profiles_reminders`;
CREATE TABLE `ntas_profiles_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_profiles_rssfeeds

DROP TABLE IF EXISTS `ntas_profiles_rssfeeds`;
CREATE TABLE `ntas_profiles_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `no_entity_restriction` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_profiles_users

DROP TABLE IF EXISTS `ntas_profiles_users`;
CREATE TABLE `ntas_profiles_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_default_profile` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projectcosts

DROP TABLE IF EXISTS `ntas_projectcosts`;
CREATE TABLE `ntas_projectcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `projects_id` (`projects_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projects

DROP TABLE IF EXISTS `ntas_projects`;
CREATE TABLE `ntas_projects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `projecttypes_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `percent_done` int NOT NULL DEFAULT '0',
  `auto_percent_done` tinyint NOT NULL DEFAULT '0',
  `show_on_global_gantt` tinyint NOT NULL DEFAULT '0',
  `content` longtext,
  `comment` longtext,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `projecttemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttypes_id` (`projecttypes_id`),
  KEY `priority` (`priority`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `show_on_global_gantt` (`show_on_global_gantt`),
  KEY `date_creation` (`date_creation`),
  KEY `projecttemplates_id` (`projecttemplates_id`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projectstates

DROP TABLE IF EXISTS `ntas_projectstates`;
CREATE TABLE `ntas_projectstates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `color` varchar(255) DEFAULT NULL,
  `is_finished` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_finished` (`is_finished`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttasks

DROP TABLE IF EXISTS `ntas_projecttasks`;
CREATE TABLE `ntas_projecttasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `comment` longtext,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int NOT NULL DEFAULT '0',
  `effective_duration` int NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `auto_projectstates` tinyint NOT NULL DEFAULT '0',
  `projecttasktypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `percent_done` int NOT NULL DEFAULT '0',
  `auto_percent_done` tinyint NOT NULL DEFAULT '0',
  `is_milestone` tinyint NOT NULL DEFAULT '0',
  `projecttasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttasklinks

DROP TABLE IF EXISTS `ntas_projecttasklinks`;
CREATE TABLE `ntas_projecttasklinks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id_source` int unsigned NOT NULL,
  `source_uuid` varchar(255) NOT NULL,
  `projecttasks_id_target` int unsigned NOT NULL,
  `target_uuid` varchar(255) NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `lag` smallint DEFAULT '0',
  `lead` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `projecttasks_id_source` (`projecttasks_id_source`),
  KEY `projecttasks_id_target` (`projecttasks_id_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_projecttasktemplates

DROP TABLE IF EXISTS `ntas_projecttasktemplates`;
CREATE TABLE `ntas_projecttasktemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `comment` longtext,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int NOT NULL DEFAULT '0',
  `effective_duration` int NOT NULL DEFAULT '0',
  `projectstates_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasktypes_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `percent_done` int NOT NULL DEFAULT '0',
  `is_milestone` tinyint NOT NULL DEFAULT '0',
  `comments` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttasks_tickets

DROP TABLE IF EXISTS `ntas_projecttasks_tickets`;
CREATE TABLE `ntas_projecttasks_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  KEY `projects_id` (`projecttasks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttaskteams

DROP TABLE IF EXISTS `ntas_projecttaskteams`;
CREATE TABLE `ntas_projecttaskteams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttasktypes

DROP TABLE IF EXISTS `ntas_projecttasktypes`;
CREATE TABLE `ntas_projecttasktypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projectteams

DROP TABLE IF EXISTS `ntas_projectteams`;
CREATE TABLE `ntas_projectteams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_projecttypes

DROP TABLE IF EXISTS `ntas_projecttypes`;
CREATE TABLE `ntas_projecttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_queuednotifications

DROP TABLE IF EXISTS `ntas_queuednotifications`;
CREATE TABLE `ntas_queuednotifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `notificationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `sent_try` int NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `name` text,
  `sender` text,
  `sendername` text,
  `recipient` text,
  `recipientname` text,
  `replyto` text,
  `replytoname` text,
  `headers` text,
  `body_html` longtext,
  `body_text` longtext,
  `messageid` text,
  `documents` text,
  `mode` varchar(20) NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `attach_documents` tinyint NOT NULL DEFAULT '0',
  `itemtype_trigger` varchar(255) DEFAULT NULL,
  `items_id_trigger` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `entities_id` (`entities_id`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`),
  KEY `mode` (`mode`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `recipient` (`recipient`(255)),
  KEY `item_trigger` (`itemtype_trigger`,`items_id_trigger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_registeredids

DROP TABLE IF EXISTS `ntas_registeredids`;
CREATE TABLE `ntas_registeredids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `device_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `device_type` (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_reminders

DROP TABLE IF EXISTS `ntas_reminders`;
CREATE TABLE `ntas_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `is_planned` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  `begin_view_date` timestamp NULL DEFAULT NULL,
  `end_view_date` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_remindertranslations

DROP TABLE IF EXISTS `ntas_remindertranslations`;
CREATE TABLE `ntas_remindertranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) DEFAULT NULL,
  `name` text,
  `text` longtext,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`reminders_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_reminders_users

DROP TABLE IF EXISTS `ntas_reminders_users`;
CREATE TABLE `ntas_reminders_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_requesttypes

DROP TABLE IF EXISTS `ntas_requesttypes`;
CREATE TABLE `ntas_requesttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_helpdesk_default` tinyint NOT NULL DEFAULT '0',
  `is_followup_default` tinyint NOT NULL DEFAULT '0',
  `is_mail_default` tinyint NOT NULL DEFAULT '0',
  `is_mailfollowup_default` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `is_ticketheader` tinyint NOT NULL DEFAULT '1',
  `is_itilfollowup` tinyint NOT NULL DEFAULT '1',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_followup_default` (`is_followup_default`),
  KEY `is_mail_default` (`is_mail_default`),
  KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `is_ticketheader` (`is_ticketheader`),
  KEY `is_itilfollowup` (`is_itilfollowup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_reservationitems

DROP TABLE IF EXISTS `ntas_reservationitems`;
CREATE TABLE `ntas_reservationitems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_reservations

DROP TABLE IF EXISTS `ntas_reservations`;
CREATE TABLE `ntas_reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int unsigned NOT NULL DEFAULT '0',
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `group` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_rssfeeds

DROP TABLE IF EXISTS `ntas_rssfeeds`;
CREATE TABLE `ntas_rssfeeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `url` text,
  `refresh_rate` int NOT NULL DEFAULT '86400',
  `max_items` int NOT NULL DEFAULT '20',
  `have_error` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `have_error` (`have_error`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_rssfeeds_users

DROP TABLE IF EXISTS `ntas_rssfeeds_users`;
CREATE TABLE `ntas_rssfeeds_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ruleactions

DROP TABLE IF EXISTS `ntas_ruleactions`;
CREATE TABLE `ntas_ruleactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_rulecriterias

DROP TABLE IF EXISTS `ntas_rulecriterias`;
CREATE TABLE `ntas_rulecriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0',
  `pattern` text,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_rulerightparameters

DROP TABLE IF EXISTS `ntas_rulerightparameters`;
CREATE TABLE `ntas_rulerightparameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_rules

DROP TABLE IF EXISTS `ntas_rules`;
CREATE TABLE `ntas_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `sub_type` varchar(255) NOT NULL DEFAULT '',
  `ranking` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `match` char(10) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `condition` (`condition`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_slalevelactions

DROP TABLE IF EXISTS `ntas_slalevelactions`;
CREATE TABLE `ntas_slalevelactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_slalevelcriterias

DROP TABLE IF EXISTS `ntas_slalevelcriterias`;
CREATE TABLE `ntas_slalevelcriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0',
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_slalevels

DROP TABLE IF EXISTS `ntas_slalevels`;
CREATE TABLE `ntas_slalevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slas_id` int unsigned NOT NULL DEFAULT '0',
  `execution_time` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `match` char(10) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_slalevels_tickets

DROP TABLE IF EXISTS `ntas_slalevels_tickets`;
CREATE TABLE `ntas_slalevels_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `slalevels_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_olalevelactions

DROP TABLE IF EXISTS `ntas_olalevelactions`;
CREATE TABLE `ntas_olalevelactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_olalevelcriterias

DROP TABLE IF EXISTS `ntas_olalevelcriterias`;
CREATE TABLE `ntas_olalevelcriterias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int NOT NULL DEFAULT '0',
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_olalevels

DROP TABLE IF EXISTS `ntas_olalevels`;
CREATE TABLE `ntas_olalevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `olas_id` int unsigned NOT NULL DEFAULT '0',
  `execution_time` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `match` char(10) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `olas_id` (`olas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_olalevels_tickets

DROP TABLE IF EXISTS `ntas_olalevels_tickets`;
CREATE TABLE `ntas_olalevels_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `olalevels_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_slms

DROP TABLE IF EXISTS `ntas_slms`;
CREATE TABLE `ntas_slms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `calendars_id` (`calendars_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_slas

DROP TABLE IF EXISTS `ntas_slas`;
CREATE TABLE `ntas_slas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `comment` text,
  `number_time` int NOT NULL,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_olas

DROP TABLE IF EXISTS `ntas_olas`;
CREATE TABLE `ntas_olas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `comment` text,
  `number_time` int NOT NULL,
  `use_ticket_calendar` tinyint NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_softwarecategories

DROP TABLE IF EXISTS `ntas_softwarecategories`;
CREATE TABLE `ntas_softwarecategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `softwarecategories_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_softwarelicenses

DROP TABLE IF EXISTS `ntas_softwarelicenses`;
CREATE TABLE `ntas_softwarelicenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `softwares_id` int unsigned,
  `softwarelicenses_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `number` int NOT NULL DEFAULT '0',
  `softwarelicensetypes_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `softwareversions_id_buy` int unsigned NOT NULL DEFAULT '0',
  `softwareversions_id_use` int unsigned NOT NULL DEFAULT '0',
  `expire` date DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `allow_overquota` tinyint NOT NULL DEFAULT '0',
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`),
  KEY `softwares_id_expire_number` (`softwares_id`,`expire`,`number`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `users_id` (`users_id`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `allow_overquota` (`allow_overquota`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_softwarelicensetypes

DROP TABLE IF EXISTS `ntas_softwarelicensetypes`;
CREATE TABLE `ntas_softwarelicensetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `softwarelicensetypes_id` int unsigned NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `completename` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_softwares

DROP TABLE IF EXISTS `ntas_softwares`;
CREATE TABLE `ntas_softwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_update` tinyint NOT NULL DEFAULT '0',
  `softwares_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `softwarecategories_id` int unsigned NOT NULL DEFAULT '0',
  `is_valid` tinyint NOT NULL DEFAULT '1',
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `date_creation` (`date_creation`),
  KEY `active_assets` (`is_deleted`,`is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_softwareversions

DROP TABLE IF EXISTS `ntas_softwareversions`;
CREATE TABLE `ntas_softwareversions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `softwares_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `arch` varchar(255) DEFAULT NULL,
  `comment` text,
  `operatingsystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `arch` (`arch`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_solutiontemplates

DROP TABLE IF EXISTS `ntas_solutiontemplates`;
CREATE TABLE `ntas_solutiontemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `solutiontypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_solutiontypes

DROP TABLE IF EXISTS `ntas_solutiontypes`;
CREATE TABLE `ntas_solutiontypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `is_incident` tinyint NOT NULL DEFAULT '1',
  `is_request` tinyint NOT NULL DEFAULT '1',
  `is_problem` tinyint NOT NULL DEFAULT '1',
  `is_change` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_itilsolutions
DROP TABLE IF EXISTS `ntas_itilsolutions`;
CREATE TABLE `ntas_itilsolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontypes_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontype_name` varchar(255) DEFAULT NULL,
  `content` longtext,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_approval` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `users_id_approval` int unsigned NOT NULL DEFAULT '0',
  `user_name_approval` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `itilfollowups_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_approval` (`users_id_approval`),
  KEY `status` (`status`),
  KEY `itilfollowups_id` (`itilfollowups_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ssovariables

DROP TABLE IF EXISTS `ntas_ssovariables`;
CREATE TABLE `ntas_ssovariables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_states

DROP TABLE IF EXISTS `ntas_states`;
CREATE TABLE `ntas_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`states_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS ntas_dropdownvisibilities;
CREATE TABLE `ntas_dropdownvisibilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `visible_itemtype` varchar(100) NOT NULL DEFAULT '',
  `is_visible` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `visible_itemtype` (`visible_itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_suppliers

DROP TABLE IF EXISTS `ntas_suppliers`;
CREATE TABLE `ntas_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `suppliertypes_id` int unsigned NOT NULL DEFAULT '0',
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_suppliers_tickets

DROP TABLE IF EXISTS `ntas_suppliers_tickets`;
CREATE TABLE `ntas_suppliers_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_suppliertypes

DROP TABLE IF EXISTS `ntas_suppliertypes`;
CREATE TABLE `ntas_suppliertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_taskcategories

DROP TABLE IF EXISTS `ntas_taskcategories`;
CREATE TABLE `ntas_taskcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `completename` text,
  `comment` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `is_helpdeskvisible` tinyint NOT NULL DEFAULT '1',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `knowbaseitemcategories_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_tasktemplates

DROP TABLE IF EXISTS `ntas_tasktemplates`;
CREATE TABLE `ntas_tasktemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `comment` text,
  `pendingreasons_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `use_current_user` tinyint NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `pendingreasons_id` (`pendingreasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ticketcosts

DROP TABLE IF EXISTS `ntas_ticketcosts`;
CREATE TABLE `ntas_ticketcosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tickets_id` (`tickets_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ticketrecurrents

DROP TABLE IF EXISTS `ntas_ticketrecurrents`;
CREATE TABLE `ntas_ticketrecurrents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int NOT NULL DEFAULT '0',
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `end_date` timestamp NULL DEFAULT NULL,
  `ticket_per_item` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`),
  KEY `ticket_per_item` (`ticket_per_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_recurrentchanges

DROP TABLE IF EXISTS `ntas_recurrentchanges`;
CREATE TABLE `ntas_recurrentchanges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int NOT NULL DEFAULT '0',
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_tickets

DROP TABLE IF EXISTS `ntas_tickets`;
CREATE TABLE `ntas_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `takeintoaccountdate` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id_lastupdater` int unsigned NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `users_id_recipient` int unsigned NOT NULL DEFAULT '0',
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `urgency` int NOT NULL DEFAULT '1',
  `impact` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `itilcategories_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `global_validation` int NOT NULL DEFAULT '1',
  `slas_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `slas_id_tto` int unsigned NOT NULL DEFAULT '0',
  `slalevels_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `time_to_own` timestamp NULL DEFAULT NULL,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `sla_waiting_duration` int NOT NULL DEFAULT '0',
  `ola_waiting_duration` int NOT NULL DEFAULT '0',
  `olas_id_tto` int unsigned NOT NULL DEFAULT '0',
  `olas_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `olalevels_id_ttr` int unsigned NOT NULL DEFAULT '0',
  `ola_tto_begin_date` timestamp NULL DEFAULT NULL,
  `ola_ttr_begin_date` timestamp NULL DEFAULT NULL,
  `internal_time_to_resolve` timestamp NULL DEFAULT NULL,
  `internal_time_to_own` timestamp NULL DEFAULT NULL,
  `waiting_duration` int NOT NULL DEFAULT '0',
  `close_delay_stat` int NOT NULL DEFAULT '0',
  `solve_delay_stat` int NOT NULL DEFAULT '0',
  `takeintoaccount_delay_stat` int NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `externalid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `takeintoaccountdate` (`takeintoaccountdate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `slas_id_tto` (`slas_id_tto`),
  KEY `slas_id_ttr` (`slas_id_ttr`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `time_to_own` (`time_to_own`),
  KEY `olas_id_tto` (`olas_id_tto`),
  KEY `olas_id_ttr` (`olas_id_ttr`),
  KEY `slalevels_id_ttr` (`slalevels_id_ttr`),
  KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  KEY `internal_time_to_own` (`internal_time_to_own`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`),
  KEY `locations_id` (`locations_id`),
  KEY `date_creation` (`date_creation`),
  KEY `ola_waiting_duration` (`ola_waiting_duration`),
  KEY `olalevels_id_ttr` (`olalevels_id_ttr`),
  KEY `tickettemplates_id` (`tickettemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_tickets_tickets

DROP TABLE IF EXISTS `ntas_tickets_tickets`;
CREATE TABLE `ntas_tickets_tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int unsigned NOT NULL DEFAULT '0',
  `tickets_id_2` int unsigned NOT NULL DEFAULT '0',
  `link` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`),
  KEY `tickets_id_2` (`tickets_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_tickets_users

DROP TABLE IF EXISTS `ntas_tickets_users`;
CREATE TABLE `ntas_tickets_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `use_notification` tinyint NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_ticketsatisfactions

DROP TABLE IF EXISTS `ntas_ticketsatisfactions`;
CREATE TABLE `ntas_ticketsatisfactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '1',
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_answered` timestamp NULL DEFAULT NULL,
  `satisfaction` int DEFAULT NULL,
  `satisfaction_scaled_to_5` float DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_tickettasks

DROP TABLE IF EXISTS `ntas_tickettasks`;
CREATE TABLE `ntas_tickettasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `taskcategories_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `is_private` tinyint NOT NULL DEFAULT '0',
  `actiontime` int NOT NULL DEFAULT '0',
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `state` int NOT NULL DEFAULT '1',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `groups_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int unsigned NOT NULL DEFAULT '0',
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `sourceitems_id` int unsigned NOT NULL DEFAULT '0',
  `sourceof_items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `state` (`state`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_tickettemplatehiddenfields

DROP TABLE IF EXISTS `ntas_tickettemplatehiddenfields`;
CREATE TABLE `ntas_tickettemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_changeemplatehiddenfields

DROP TABLE IF EXISTS `ntas_changetemplatehiddenfields`;
CREATE TABLE `ntas_changetemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_problemtemplatehiddenfields

DROP TABLE IF EXISTS `ntas_problemtemplatehiddenfields`;
CREATE TABLE `ntas_problemtemplatehiddenfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_tickettemplatereadonlyfields

DROP TABLE IF EXISTS `ntas_tickettemplatereadonlyfields`;
CREATE TABLE `ntas_tickettemplatereadonlyfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_changeemplatereadonlyfields

DROP TABLE IF EXISTS `ntas_changetemplatereadonlyfields`;
CREATE TABLE `ntas_changetemplatereadonlyfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_problemtemplatereadonlyfields

DROP TABLE IF EXISTS `ntas_problemtemplatereadonlyfields`;
CREATE TABLE `ntas_problemtemplatereadonlyfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_tickettemplatemandatoryfields

DROP TABLE IF EXISTS `ntas_tickettemplatemandatoryfields`;
CREATE TABLE `ntas_tickettemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changetemplatemandatoryfields

DROP TABLE IF EXISTS `ntas_changetemplatemandatoryfields`;
CREATE TABLE `ntas_changetemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_problemtemplatemandatoryfields

DROP TABLE IF EXISTS `ntas_problemtemplatemandatoryfields`;
CREATE TABLE `ntas_problemtemplatemandatoryfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_tickettemplatepredefinedfields

DROP TABLE IF EXISTS `ntas_tickettemplatepredefinedfields`;
CREATE TABLE `ntas_tickettemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `tickettemplates_id` (`tickettemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_changetemplatepredefinedfields

DROP TABLE IF EXISTS `ntas_changetemplatepredefinedfields`;
CREATE TABLE `ntas_changetemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `changetemplates_id` (`changetemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_problemtemplatepredefinedfields

DROP TABLE IF EXISTS `ntas_problemtemplatepredefinedfields`;
CREATE TABLE `ntas_problemtemplatepredefinedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `num` int NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `problemtemplates_id` (`problemtemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;



### Dump table ntas_tickettemplates

DROP TABLE IF EXISTS `ntas_tickettemplates`;
CREATE TABLE `ntas_tickettemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `allowed_statuses` varchar(255) NOT NULL DEFAULT '[1,10,2,3,4,5,6]',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_changetemplates

DROP TABLE IF EXISTS `ntas_changetemplates`;
CREATE TABLE `ntas_changetemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `allowed_statuses` varchar(255) NOT NULL DEFAULT '[1,9,10,7,4,11,12,5,8,6,14,13]',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_problemtemplates

DROP TABLE IF EXISTS `ntas_problemtemplates`;
CREATE TABLE `ntas_problemtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `allowed_statuses` varchar(255) NOT NULL DEFAULT '[1,7,2,3,4,5,8,6]',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_ticketvalidations

DROP TABLE IF EXISTS `ntas_ticketvalidations`;
CREATE TABLE `ntas_ticketvalidations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itils_validationsteps_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_validate` int unsigned NOT NULL DEFAULT '0',
  `itilvalidationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype_target` varchar(255) NOT NULL,
  `items_id_target` int unsigned NOT NULL DEFAULT '0',
  `comment_submission` text,
  `comment_validation` text,
  `status` int NOT NULL DEFAULT '2',
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `last_reminder_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `itilvalidationtemplates_id` (`itilvalidationtemplates_id`),
  KEY `item_target` (`itemtype_target`,`items_id_target`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`),
  KEY `itils_validationsteps_id` (`itils_validationsteps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_validationsteps - used by ValidationStep Dropdown

DROP TABLE IF EXISTS `ntas_validationsteps`;
CREATE TABLE `ntas_validationsteps` (
    `id`                                  int unsigned          NOT NULL    AUTO_INCREMENT,
    `name`                                varchar(255)                      DEFAULT NULL,
    `minimal_required_validation_percent` tinyint unsigned      NOT NULL    DEFAULT '100',
    `is_default`                          tinyint               NOT NULL    DEFAULT '0',
    `date_mod`                            timestamp             NULL        DEFAULT NULL,
    `date_creation`                       timestamp             NULL        DEFAULT NULL,
    `comment`                             text,
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `date_mod` (`date_mod`),
    KEY `date_creation` (`date_creation`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

### Dump table ntas_itils_validationsteps - used by ValidationStep Dropdown

DROP TABLE IF EXISTS `ntas_itils_validationsteps`;
CREATE TABLE `ntas_itils_validationsteps` (
    `id`                                    int unsigned        NOT NULL AUTO_INCREMENT,
    `minimal_required_validation_percent`   tinyint unsigned    NOT NULL,
    `validationsteps_id`                    int unsigned        NOT NULL DEFAULT '0',
    `itemtype`                              varchar(255)        NOT NULL,
    `items_id`                              int unsigned        NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unicity` (`itemtype`,`items_id`,`validationsteps_id`),
    KEY `validationsteps_id` (`validationsteps_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

### Dump table ntas_transfers

DROP TABLE IF EXISTS `ntas_transfers`;
CREATE TABLE `ntas_transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `keep_ticket` int NOT NULL DEFAULT '0',
  `keep_networklink` int NOT NULL DEFAULT '0',
  `keep_reservation` int NOT NULL DEFAULT '0',
  `keep_history` int NOT NULL DEFAULT '0',
  `keep_device` int NOT NULL DEFAULT '0',
  `keep_infocom` int NOT NULL DEFAULT '0',
  `keep_dc_monitor` int NOT NULL DEFAULT '0',
  `clean_dc_monitor` int NOT NULL DEFAULT '0',
  `keep_dc_phone` int NOT NULL DEFAULT '0',
  `clean_dc_phone` int NOT NULL DEFAULT '0',
  `keep_dc_peripheral` int NOT NULL DEFAULT '0',
  `clean_dc_peripheral` int NOT NULL DEFAULT '0',
  `keep_dc_printer` int NOT NULL DEFAULT '0',
  `clean_dc_printer` int NOT NULL DEFAULT '0',
  `keep_supplier` int NOT NULL DEFAULT '0',
  `clean_supplier` int NOT NULL DEFAULT '0',
  `keep_contact` int NOT NULL DEFAULT '0',
  `clean_contact` int NOT NULL DEFAULT '0',
  `keep_contract` int NOT NULL DEFAULT '0',
  `clean_contract` int NOT NULL DEFAULT '0',
  `keep_software` int NOT NULL DEFAULT '0',
  `clean_software` int NOT NULL DEFAULT '0',
  `keep_document` int NOT NULL DEFAULT '0',
  `clean_document` int NOT NULL DEFAULT '0',
  `keep_cartridgeitem` int NOT NULL DEFAULT '0',
  `clean_cartridgeitem` int NOT NULL DEFAULT '0',
  `keep_cartridge` int NOT NULL DEFAULT '0',
  `keep_consumable` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text,
  `keep_disk` int NOT NULL DEFAULT '0',
  `keep_certificate` int NOT NULL DEFAULT '0',
  `clean_certificate` int NOT NULL DEFAULT '0',
  `lock_updated_fields` int NOT NULL DEFAULT '0',
  `keep_location` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_usercategories

DROP TABLE IF EXISTS `ntas_usercategories`;
CREATE TABLE `ntas_usercategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_useremails

DROP TABLE IF EXISTS `ntas_useremails`;
CREATE TABLE `ntas_useremails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_users

DROP TABLE IF EXISTS `ntas_users`;
CREATE TABLE `ntas_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_last_update` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `language` char(10) DEFAULT NULL,
  `use_mode` int NOT NULL DEFAULT '0',
  `list_limit` int DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `comment` text,
  `auths_id` int unsigned NOT NULL DEFAULT '0',
  `authtype` int NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_sync` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `profiles_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned DEFAULT '0',
  `usertitles_id` int unsigned NOT NULL DEFAULT '0',
  `usercategories_id` int unsigned NOT NULL DEFAULT '0',
  `date_format` int DEFAULT NULL,
  `number_format` int DEFAULT NULL,
  `names_format` int DEFAULT NULL,
  `csv_delimiter` char(1) DEFAULT NULL,
  `is_ids_visible` tinyint DEFAULT NULL,
  `use_flat_dropdowntree` tinyint DEFAULT NULL,
  `use_flat_dropdowntree_on_search_result` tinyint DEFAULT NULL,
  `show_jobs_at_login` tinyint DEFAULT NULL,
  `priority_1` char(20) DEFAULT NULL,
  `priority_2` char(20) DEFAULT NULL,
  `priority_3` char(20) DEFAULT NULL,
  `priority_4` char(20) DEFAULT NULL,
  `priority_5` char(20) DEFAULT NULL,
  `priority_6` char(20) DEFAULT NULL,
  `followup_private` tinyint DEFAULT NULL,
  `task_private` tinyint DEFAULT NULL,
  `default_requesttypes_id` int unsigned DEFAULT NULL,
  `password_forget_token` varchar(255) DEFAULT NULL,
  `password_forget_token_date` timestamp NULL DEFAULT NULL,
  `user_dn` text,
  `user_dn_hash` varchar(32),
  `registration_number` varchar(255) DEFAULT NULL,
  `show_count_on_tabs` tinyint DEFAULT NULL,
  `refresh_views` int DEFAULT NULL,
  `set_default_tech` tinyint DEFAULT NULL,
  `set_followup_tech` tinyint DEFAULT NULL,
  `set_solution_tech` tinyint DEFAULT NULL,
  `personal_token` varchar(255) DEFAULT NULL,
  `personal_token_date` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `api_token_date` timestamp NULL DEFAULT NULL,
  `cookie_token` varchar(255) DEFAULT NULL,
  `cookie_token_date` timestamp NULL DEFAULT NULL,
  `display_count_on_home` int DEFAULT NULL,
  `notification_to_myself` tinyint DEFAULT NULL,
  `duedateok_color` varchar(255) DEFAULT NULL,
  `duedatewarning_color` varchar(255) DEFAULT NULL,
  `duedatecritical_color` varchar(255) DEFAULT NULL,
  `duedatewarning_less` int DEFAULT NULL,
  `duedatecritical_less` int DEFAULT NULL,
  `duedatewarning_unit` varchar(255) DEFAULT NULL,
  `duedatecritical_unit` varchar(255) DEFAULT NULL,
  `is_deleted_ldap` tinyint NOT NULL DEFAULT '0',
  `pdffont` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint DEFAULT NULL,
  `privatebookmarkorder` longtext,
  `backcreated` tinyint DEFAULT NULL,
  `task_state` int DEFAULT NULL,
  `planned_task_state` int DEFAULT NULL,
  `palette` char(20) DEFAULT NULL,
  `page_layout` char(20) DEFAULT NULL,
  `fold_menu` tinyint DEFAULT NULL,
  `savedsearches_pinned` text,
  `timeline_order` char(20) DEFAULT NULL,
  `itil_layout` text,
  `richtext_layout` char(20) DEFAULT NULL,
  `set_default_requester` tinyint DEFAULT NULL,
  `lock_autolock_mode` tinyint DEFAULT NULL,
  `lock_directunlock_notification` tinyint DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `highcontrast_css` tinyint DEFAULT '0',
  `plannings` text,
  `sync_field` varchar(255) DEFAULT NULL,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_supervisor` int unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(50) DEFAULT NULL,
  `default_dashboard_central` varchar(100) DEFAULT NULL,
  `default_dashboard_assets` varchar(100) DEFAULT NULL,
  `default_dashboard_helpdesk` varchar(100) DEFAULT NULL,
  `default_dashboard_mini_ticket` varchar(100) DEFAULT NULL,
  `default_central_tab` tinyint DEFAULT '0',
  `nickname` varchar(255) DEFAULT NULL,
  `substitution_end_date` timestamp NULL DEFAULT NULL,
  `substitution_start_date` timestamp NULL DEFAULT NULL,
  `toast_location` varchar(255) DEFAULT NULL,
  `timeline_action_btn_layout` tinyint DEFAULT NULL,
  `timeline_date_format` tinyint DEFAULT NULL,
  `2fa` text,
  `2fa_unenforced` tinyint NOT NULL DEFAULT 0 COMMENT 'If 1, the user is excluded from 2FA enforcement policies',
  `password_history` longtext,
  `is_notif_enable_default` tinyint DEFAULT NULL,
  `show_search_form` tinyint DEFAULT NULL,
  `search_pagination_on_top` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`),
  KEY `is_deleted_ldap` (`is_deleted_ldap`),
  KEY `date_creation` (`date_creation`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `sync_field` (`sync_field`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id_supervisor` (`users_id_supervisor`),
  KEY `auths_id` (`auths_id`),
  KEY `default_requesttypes_id` (`default_requesttypes_id`),
  KEY `user_dn_hash` (`user_dn_hash`),
  KEY `substitution_end_date` (`substitution_end_date`),
  KEY `substitution_start_date` (`substitution_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_usertitles

DROP TABLE IF EXISTS `ntas_usertitles`;
CREATE TABLE `ntas_usertitles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_virtualmachinestates

DROP TABLE IF EXISTS `ntas_virtualmachinestates`;
CREATE TABLE `ntas_virtualmachinestates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_virtualmachinesystems

DROP TABLE IF EXISTS `ntas_virtualmachinesystems`;
CREATE TABLE `ntas_virtualmachinesystems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_virtualmachinetypes

DROP TABLE IF EXISTS `ntas_virtualmachinetypes`;
CREATE TABLE `ntas_virtualmachinetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_vlans

DROP TABLE IF EXISTS `ntas_vlans`;
CREATE TABLE `ntas_vlans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `tag` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tag` (`tag`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


### Dump table ntas_wifinetworks

DROP TABLE IF EXISTS `ntas_wifinetworks`;
CREATE TABLE `ntas_wifinetworks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `essid` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `essid` (`essid`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_knowbaseitems_items

DROP TABLE IF EXISTS `ntas_knowbaseitems_items`;
CREATE TABLE `ntas_knowbaseitems_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_knowbaseitems_revisions

DROP TABLE IF EXISTS `ntas_knowbaseitems_revisions`;
CREATE TABLE `ntas_knowbaseitems_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `revision` int NOT NULL,
  `name` text,
  `answer` longtext,
  `language` varchar(10) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  KEY `revision` (`revision`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_knowbaseitems_comments

DROP TABLE IF EXISTS `ntas_knowbaseitems_comments`;
CREATE TABLE `ntas_knowbaseitems_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) DEFAULT NULL,
  `comment` text,
  `parent_comment_id` int unsigned DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `parent_comment_id` (`parent_comment_id`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicebatterymodels

DROP TABLE IF EXISTS `ntas_devicebatterymodels`;
CREATE TABLE `ntas_devicebatterymodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicebatteries

DROP TABLE IF EXISTS `ntas_devicebatteries`;
CREATE TABLE `ntas_devicebatteries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `voltage` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `devicebatterytypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicebatterymodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  KEY `devicebatterytypes_id` (`devicebatterytypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_items_devicebatteries

DROP TABLE IF EXISTS `ntas_items_devicebatteries`;
CREATE TABLE `ntas_items_devicebatteries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicebatteries_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `real_capacity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicebatteries_id` (`devicebatteries_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_devicebatterytypes`;
CREATE TABLE `ntas_devicebatterytypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicefirmwaremodels

DROP TABLE IF EXISTS `ntas_devicefirmwaremodels`;
CREATE TABLE `ntas_devicefirmwaremodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_devicefirmwares

DROP TABLE IF EXISTS `ntas_devicefirmwares`;
CREATE TABLE `ntas_devicefirmwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `devicefirmwaretypes_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `devicefirmwaremodels_id` int unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_items_devicefirmwares

DROP TABLE IF EXISTS `ntas_items_devicefirmwares`;
CREATE TABLE `ntas_items_devicefirmwares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `devicefirmwares_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `devicefirmwares_id` (`devicefirmwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_devicefirmwaretypes`;
CREATE TABLE `ntas_devicefirmwaretypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


-- Datacenters

DROP TABLE IF EXISTS `ntas_datacenters`;
CREATE TABLE `ntas_datacenters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_dcrooms`;
CREATE TABLE `ntas_dcrooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `vis_cols` int DEFAULT NULL,
  `vis_rows` int DEFAULT NULL,
  `vis_cell_width` int NOT NULL DEFAULT '40',
  `vis_cell_height` int NOT NULL DEFAULT '40',
  `blueprint` text,
  `datacenters_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `datacenters_id` (`datacenters_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_rackmodels`;
CREATE TABLE `ntas_rackmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_racktypes`;
CREATE TABLE `ntas_racktypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_racks`;
CREATE TABLE `ntas_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `rackmodels_id` int unsigned DEFAULT NULL,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `racktypes_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `depth` int DEFAULT NULL,
  `number_units` int DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `dcrooms_id` int unsigned NOT NULL DEFAULT '0',
  `room_orientation` int NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `max_power` int NOT NULL DEFAULT '0',
  `mesured_power` int NOT NULL DEFAULT '0',
  `max_weight` int NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `rackmodels_id` (`rackmodels_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `racktypes_id` (`racktypes_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `dcrooms_id` (`dcrooms_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_racks`;
CREATE TABLE `ntas_items_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int unsigned NOT NULL,
  `position` int NOT NULL,
  `orientation` tinyint DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `hpos` tinyint NOT NULL DEFAULT '0',
  `is_reserved` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  KEY `relation` (`racks_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_enclosuremodels`;
CREATE TABLE `ntas_enclosuremodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_enclosures`;
CREATE TABLE `ntas_enclosures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `enclosuremodels_id` int unsigned DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `orientation` tinyint DEFAULT NULL,
  `power_supplies` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `enclosuremodels_id` (`enclosuremodels_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_enclosures`;
CREATE TABLE `ntas_items_enclosures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `enclosures_id` int unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int unsigned NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `relation` (`enclosures_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pdumodels`;
CREATE TABLE `ntas_pdumodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `max_power` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `is_rackable` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_rackable` (`is_rackable`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pdutypes`;
CREATE TABLE `ntas_pdutypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_pdus`;
CREATE TABLE `ntas_pdus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pdumodels_id` int unsigned DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `pdutypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `pdumodels_id` (`pdumodels_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `pdutypes_id` (`pdutypes_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_plugs`;
CREATE TABLE `ntas_plugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_plugs`;
CREATE TABLE `ntas_items_plugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugs_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `number_plugs` int DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugs_id` (`plugs_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pdus_racks`;
CREATE TABLE `ntas_pdus_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int unsigned NOT NULL DEFAULT '0',
  `pdus_id` int unsigned NOT NULL DEFAULT '0',
  `side` int DEFAULT '0',
  `position` int NOT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racks_id` (`racks_id`),
  KEY `pdus_id` (`pdus_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
-- /Datacenters

DROP TABLE IF EXISTS `ntas_itilfollowuptemplates`;
CREATE TABLE `ntas_itilfollowuptemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `is_private` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `pendingreasons_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`),
  KEY `pendingreasons_id` (`pendingreasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_itilfollowups`;
CREATE TABLE `ntas_itilfollowups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_editor` int unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `is_private` tinyint NOT NULL DEFAULT '0',
  `requesttypes_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint NOT NULL DEFAULT '0',
  `sourceitems_id` int unsigned NOT NULL DEFAULT '0',
  `sourceof_items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_clustertypes`;
CREATE TABLE `ntas_clustertypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_clusters`;
CREATE TABLE `ntas_clusters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `clustertypes_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `clustertypes_id` (`clustertypes_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_clusters`;
CREATE TABLE `ntas_items_clusters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `clusters_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`clusters_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_planningexternalevents

DROP TABLE IF EXISTS `ntas_planningexternalevents`;
CREATE TABLE `ntas_planningexternalevents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `planningexternaleventtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '1',
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_guests` text,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rrule` text,
  `state` int NOT NULL DEFAULT '0',
  `planningeventcategories_id` int unsigned NOT NULL DEFAULT '0',
  `background` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `planningexternaleventtemplates_id` (`planningexternaleventtemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_planningexternaleventtemplates

DROP TABLE IF EXISTS `ntas_planningexternaleventtemplates`;
CREATE TABLE `ntas_planningexternaleventtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `text` mediumtext,
  `comment` text,
  `duration` int NOT NULL DEFAULT '0',
  `before_time` int NOT NULL DEFAULT '0',
  `rrule` text,
  `state` int NOT NULL DEFAULT '0',
  `planningeventcategories_id` int unsigned NOT NULL DEFAULT '0',
  `background` tinyint NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_planningeventcategories

DROP TABLE IF EXISTS `ntas_planningeventcategories`;
CREATE TABLE `ntas_planningeventcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_items_kanbans

DROP TABLE IF EXISTS `ntas_items_kanbans`;
CREATE TABLE `ntas_items_kanbans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned DEFAULT NULL,
  `users_id` int unsigned NOT NULL,
  `state` mediumtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

### Dump table ntas_vobjects

DROP TABLE IF EXISTS `ntas_vobjects`;
CREATE TABLE `ntas_vobjects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `data` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_domaintypes`;
CREATE TABLE `ntas_domaintypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_domainrelations`;
CREATE TABLE `ntas_domainrelations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_domains_items`;
CREATE TABLE `ntas_domains_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domains_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `domainrelations_id` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`domains_id`,`itemtype`,`items_id`),
  KEY `domainrelations_id` (`domainrelations_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_domainrecordtypes`;
CREATE TABLE `ntas_domainrecordtypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fields` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_domainrecords`;
CREATE TABLE `ntas_domainrecords` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `data_obj` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `domains_id` int unsigned NOT NULL DEFAULT '0',
  `domainrecordtypes_id` int unsigned NOT NULL DEFAULT '0',
  `ttl` int NOT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domains_id` (`domains_id`),
  KEY `domainrecordtypes_id` (`domainrecordtypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_appliances`;
CREATE TABLE `ntas_appliances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `appliancetypes_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `applianceenvironments_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `externalidentifier` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `pictures` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`externalidentifier`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_deleted` (`is_deleted`),
  KEY `appliancetypes_id` (`appliancetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `applianceenvironments_id` (`applianceenvironments_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_appliances_items`;
CREATE TABLE `ntas_appliances_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appliances_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`appliances_id`,`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_appliancetypes`;
CREATE TABLE `ntas_appliancetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `externalidentifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `externalidentifier` (`externalidentifier`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_applianceenvironments`;
CREATE TABLE `ntas_applianceenvironments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_appliances_items_relations`;
CREATE TABLE `ntas_appliances_items_relations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appliances_items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `appliances_items_id` (`appliances_items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_agenttypes`;
CREATE TABLE `ntas_agenttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_agents`;
CREATE TABLE `ntas_agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(255) NOT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `agenttypes_id` int unsigned NOT NULL,
  `last_contact` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `locked` tinyint NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `port` varchar(6) DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `threads_networkdiscovery` int NOT NULL DEFAULT '1',
  `threads_networkinventory` int NOT NULL DEFAULT '1',
  `timeout_networkdiscovery` int NOT NULL DEFAULT '0',
  `timeout_networkinventory` int NOT NULL DEFAULT '0',
  `use_module_wake_on_lan` tinyint NOT NULL DEFAULT '0',
  `use_module_computer_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_esx_remote_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_remote_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_network_inventory` tinyint NOT NULL DEFAULT '0',
  `use_module_network_discovery` tinyint NOT NULL DEFAULT '0',
  `use_module_package_deployment` tinyint NOT NULL DEFAULT '0',
  `use_module_collect_data` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `agenttypes_id` (`agenttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_rulematchedlogs`;
CREATE TABLE `ntas_rulematchedlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `rules_id` int unsigned DEFAULT NULL,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) DEFAULT NULL,
  `input` text,
  PRIMARY KEY (`id`),
  KEY `agents_id` (`agents_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `rules_id` (`rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_lockedfields`;
CREATE TABLE `ntas_lockedfields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `field` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_global` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`field`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_global` (`is_global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_unmanageds`;
CREATE TABLE `ntas_unmanageds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text,
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `networks_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `sysdescr` text,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `accepted` tinyint NOT NULL DEFAULT '0',
  `hub` tinyint NOT NULL DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `snmpcredentials_id` int unsigned NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `agents_id` (`agents_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `users_id_tech` (`users_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_networkporttypes`;
CREATE TABLE `ntas_networkporttypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `value_decimal` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_importable` tinyint NOT NULL DEFAULT '0',
  `instantiation_type` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `value_decimal` (`value_decimal`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_importable` (`is_importable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_printerlogs`;
CREATE TABLE `ntas_printerlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `total_pages` int NOT NULL DEFAULT '0',
  `bw_pages` int NOT NULL DEFAULT '0',
  `color_pages` int NOT NULL DEFAULT '0',
  `rv_pages` int NOT NULL DEFAULT '0',
  `prints` int NOT NULL DEFAULT '0',
  `bw_prints` int NOT NULL DEFAULT '0',
  `color_prints` int NOT NULL DEFAULT '0',
  `copies` int NOT NULL DEFAULT '0',
  `bw_copies` int NOT NULL DEFAULT '0',
  `color_copies` int NOT NULL DEFAULT '0',
  `scanned` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `faxed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`date`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_networkportconnectionlogs`;
CREATE TABLE `ntas_networkportconnectionlogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `connected` tinyint NOT NULL DEFAULT '0',
  `networkports_id_source` int unsigned NOT NULL DEFAULT '0',
  `networkports_id_destination` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `networkports_id_source` (`networkports_id_source`),
  KEY `networkports_id_destination` (`networkports_id_destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_networkportmetrics`;
CREATE TABLE `ntas_networkportmetrics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `ifinbytes` bigint NOT NULL DEFAULT '0',
  `ifinerrors` bigint NOT NULL DEFAULT '0',
  `ifoutbytes` bigint NOT NULL DEFAULT '0',
  `ifouterrors` bigint NOT NULL DEFAULT '0',
  `networkports_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`date`),
  KEY `date` (`date`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_refusedequipments`;
CREATE TABLE `ntas_refusedequipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `ip` text,
  `mac` text,
  `rules_id` int unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `agents_id` int unsigned NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `agents_id` (`agents_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `rules_id` (`rules_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_usbvendors`;
CREATE TABLE `ntas_usbvendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pcivendors`;
CREATE TABLE `ntas_pcivendors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_remotemanagements`;
CREATE TABLE `ntas_items_remotemanagements` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `remoteid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pendingreasons`;
CREATE TABLE `ntas_pendingreasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `is_pending_per_default` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `followup_frequency` int NOT NULL DEFAULT '0',
  `followups_before_resolution` int NOT NULL DEFAULT '0',
  `itilfollowuptemplates_id` int unsigned NOT NULL DEFAULT '0',
  `solutiontemplates_id` int unsigned NOT NULL DEFAULT '0',
  `calendars_id` int unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itilfollowuptemplates_id` (`itilfollowuptemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontemplates_id` (`solutiontemplates_id`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_pendingreasons_items`;
CREATE TABLE `ntas_pendingreasons_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendingreasons_id` int unsigned NOT NULL DEFAULT '0',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `followup_frequency` int NOT NULL DEFAULT '0',
  `followups_before_resolution` int NOT NULL DEFAULT '0',
  `bump_count` int NOT NULL DEFAULT '0',
  `last_bump_date` timestamp NULL DEFAULT NULL,
  `previous_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`),
  KEY `pendingreasons_id` (`pendingreasons_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_manuallinks`;
CREATE TABLE `ntas_manuallinks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(8096) NOT NULL,
  `open_window` tinyint NOT NULL DEFAULT '1',
  `icon` varchar(255) DEFAULT NULL,
  `comment` text,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `items_id` (`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_tickets_contracts`;
CREATE TABLE `ntas_tickets_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int unsigned NOT NULL DEFAULT '0',
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_databaseinstancetypes`;
CREATE TABLE `ntas_databaseinstancetypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_databaseinstancecategories`;
CREATE TABLE `ntas_databaseinstancecategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_databaseinstances`;
CREATE TABLE `ntas_databaseinstances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `databaseinstancetypes_id` int unsigned NOT NULL DEFAULT '0',
  `databaseinstancecategories_id` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `is_onbackup` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_helpdesk_visible` tinyint NOT NULL DEFAULT '1',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_lastboot` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `databaseinstancetypes_id` (`databaseinstancetypes_id`),
  KEY `databaseinstancecategories_id` (`databaseinstancecategories_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_databases`;
CREATE TABLE `ntas_databases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `size` int NOT NULL DEFAULT '0',
  `databaseinstances_id` int unsigned NOT NULL DEFAULT '0',
  `is_onbackup` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `databaseinstances_id` (`databaseinstances_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `ntas_snmpcredentials`;
CREATE TABLE `ntas_snmpcredentials` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `name` varchar(64) DEFAULT NULL,
   `snmpversion` varchar(8) NOT NULL DEFAULT '1',
   `community` varchar(255) DEFAULT NULL,
   `username` varchar(255) DEFAULT NULL,
   `authentication` varchar(255) DEFAULT NULL,
   `auth_passphrase` varchar(255) DEFAULT NULL,
   `encryption` varchar(255) DEFAULT NULL,
   `priv_passphrase` varchar(255) DEFAULT NULL,
   `is_deleted` tinyint NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`),
   KEY `name` (`name`),
   KEY `snmpversion` (`snmpversion`),
   KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_categories`;
CREATE TABLE `ntas_forms_categories` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL DEFAULT '',
    `description` longtext,
    `illustration` varchar(255) NOT NULL DEFAULT '',
    `forms_categories_id` int unsigned NOT NULL DEFAULT '0',
    `completename` text,
    `level` int NOT NULL DEFAULT '0',
    `ancestors_cache` longtext,
    `sons_cache` longtext,
    `comment` text,
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `level` (`level`),
    KEY `forms_categories_id` (`forms_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_forms`;
CREATE TABLE `ntas_forms_forms` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varchar(255) NOT NULL DEFAULT '',
    `entities_id` int unsigned NOT NULL DEFAULT '0',
    `is_recursive` tinyint NOT NULL DEFAULT '0',
    `is_active` tinyint NOT NULL DEFAULT '0',
    `is_deleted` tinyint NOT NULL DEFAULT '0',
    `is_draft` tinyint NOT NULL DEFAULT '0',
    `is_pinned` tinyint NOT NULL DEFAULT '0',
    `render_layout` varchar(30) NOT NULL DEFAULT '',
    `name` varchar(255) NOT NULL DEFAULT '',
    `header` longtext,
    `illustration` varchar(255) NOT NULL DEFAULT '',
    `description` longtext,
    `forms_categories_id` int unsigned NOT NULL DEFAULT '0',
    `usage_count` int unsigned NOT NULL DEFAULT '0',
    `submit_button_visibility_strategy` varchar(30) NOT NULL DEFAULT '',
    `submit_button_conditions` JSON NOT NULL,
    `date_mod` timestamp NULL DEFAULT NULL,
    `date_creation` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `name` (`name`),
    KEY `entities_id` (`entities_id`),
    KEY `is_recursive` (`is_recursive`),
    KEY `is_active` (`is_active`),
    KEY `is_deleted` (`is_deleted`),
    KEY `is_draft` (`is_draft`),
    KEY `date_mod` (`date_mod`),
    KEY `date_creation` (`date_creation`),
    KEY `forms_categories_id` (`forms_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_sections`;
CREATE TABLE `ntas_forms_sections` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varchar(255) NOT NULL DEFAULT '',
    `forms_forms_id` int unsigned NOT NULL DEFAULT '0',
    `name` varchar(255) NOT NULL DEFAULT '',
    `description` longtext,
    `rank` int NOT NULL DEFAULT '0',
    `visibility_strategy` varchar(30) NOT NULL DEFAULT '',
    `conditions` JSON NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `name` (`name`),
    KEY `forms_forms_id` (`forms_forms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_questions`;
CREATE TABLE `ntas_forms_questions` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varchar(255) NOT NULL DEFAULT '',
    `forms_sections_id` int unsigned NOT NULL DEFAULT '0',
    `forms_sections_uuid` varchar(255) NOT NULL DEFAULT '',
    `name` varchar(255) NOT NULL DEFAULT '',
    `type` varchar(255) NOT NULL DEFAULT '',
    `is_mandatory` tinyint NOT NULL DEFAULT '0',
    `vertical_rank` int NOT NULL DEFAULT '0',
    `horizontal_rank` int DEFAULT NULL,
    `description` longtext,
    `default_value` text COMMENT 'JSON - The default value type may not be the same for all questions type',
    `extra_data` text COMMENT 'JSON - Extra configuration field(s) depending on the questions type',
    `visibility_strategy` varchar(30) NOT NULL DEFAULT '',
    `conditions` JSON NOT NULL,
    `validation_strategy` varchar(30) NOT NULL DEFAULT '',
    `validation_conditions` JSON NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `name` (`name`),
    KEY `forms_sections_id` (`forms_sections_id`),
    KEY `forms_sections_uuid` (`forms_sections_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_comments`;
CREATE TABLE `ntas_forms_comments` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varchar(255) NOT NULL DEFAULT '',
    `forms_sections_id` int unsigned NOT NULL DEFAULT '0',
    `forms_sections_uuid` varchar(255) NOT NULL DEFAULT '',
    `name` varchar(255) NOT NULL DEFAULT '',
    `description` longtext,
    `vertical_rank` int NOT NULL DEFAULT '0',
    `horizontal_rank` int DEFAULT NULL,
    `visibility_strategy` varchar(30) NOT NULL DEFAULT '',
    `conditions` JSON NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `name` (`name`),
    KEY `forms_sections_id` (`forms_sections_id`),
    KEY `forms_sections_uuid` (`forms_sections_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_answerssets`;
CREATE TABLE `ntas_forms_answerssets` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `forms_forms_id` int unsigned NOT NULL DEFAULT '0',
    `entities_id` int unsigned NOT NULL DEFAULT '0',
    `users_id` int unsigned NOT NULL DEFAULT '0',
    `name` varchar(255) NOT NULL DEFAULT '',
    `date_creation` timestamp NULL DEFAULT NULL,
    `date_mod` timestamp NULL DEFAULT NULL,
    `index` int NOT NULL DEFAULT '0',
    `answers` json COMMENT 'JSON - Answers for each questions of the parent form',
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `date_creation` (`date_creation`),
    KEY `date_mod` (`date_mod`),
    KEY `forms_forms_id` (`forms_forms_id`),
    KEY `users_id` (`users_id`),
    KEY `entities_id` (`entities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_destinations_answerssets_formdestinationitems`;
CREATE TABLE `ntas_forms_destinations_answerssets_formdestinationitems` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `forms_answerssets_id` int unsigned NOT NULL DEFAULT '0',
    `itemtype` varchar(255) NOT NULL,
    `items_id` int unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unicity` (`forms_answerssets_id`,`itemtype`,`items_id`),
    KEY `item` (`itemtype`, `items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_destinations_formdestinations`;
CREATE TABLE `ntas_forms_destinations_formdestinations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `forms_forms_id` int unsigned NOT NULL DEFAULT '0',
    `itemtype` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `config` JSON NOT NULL COMMENT 'Extra configuration field(s) depending on the destination type',
    `creation_strategy` varchar(30) NOT NULL DEFAULT '',
    `conditions` JSON NOT NULL,
    PRIMARY KEY (`id`),
    KEY `name` (`name`),
    KEY `itemtype` (`itemtype`),
    KEY `forms_forms_id` (`forms_forms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_forms_accesscontrols_formaccesscontrols`;
CREATE TABLE `ntas_forms_accesscontrols_formaccesscontrols` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `forms_forms_id` int unsigned NOT NULL DEFAULT '0',
    `strategy` varchar(255) NOT NULL,
    `config` JSON NOT NULL,
    `is_active` tinyint NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unicity` (`forms_forms_id`, `strategy`),
    KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_ticketrecurrents`;
CREATE TABLE `ntas_items_ticketrecurrents` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `itemtype` varchar(255) DEFAULT NULL,
   `items_id` int unsigned NOT NULL DEFAULT '0',
   `ticketrecurrents_id` int unsigned NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`),
   UNIQUE KEY `unicity` (`itemtype`,`items_id`,`ticketrecurrents_id`),
   KEY `items_id` (`items_id`),
   KEY `ticketrecurrents_id` (`ticketrecurrents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_items_lines`;
CREATE TABLE `ntas_items_lines` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `lines_id` int unsigned NOT NULL DEFAULT '0',
   `itemtype` varchar(100) DEFAULT NULL,
   `items_id` int unsigned NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`),
   UNIQUE KEY `unicity` (`lines_id`,`itemtype`,`items_id`),
   KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_changes_changes`;
CREATE TABLE `ntas_changes_changes` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `changes_id_1` int unsigned NOT NULL DEFAULT '0',
   `changes_id_2` int unsigned NOT NULL DEFAULT '0',
   `link` int NOT NULL DEFAULT '1',
   PRIMARY KEY (`id`),
   UNIQUE KEY `unicity` (`changes_id_1`,`changes_id_2`),
   KEY `changes_id_2` (`changes_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_problems_problems`;
CREATE TABLE `ntas_problems_problems` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `problems_id_1` int unsigned NOT NULL DEFAULT '0',
   `problems_id_2` int unsigned NOT NULL DEFAULT '0',
   `link` int NOT NULL DEFAULT '1',
   PRIMARY KEY (`id`),
   UNIQUE KEY `unicity` (`problems_id_1`,`problems_id_2`),
   KEY `problems_id_2` (`problems_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_changesatisfactions`;
CREATE TABLE `ntas_changesatisfactions` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `changes_id` int unsigned NOT NULL DEFAULT '0',
   `type` int NOT NULL DEFAULT '1',
   `date_begin` timestamp NULL DEFAULT NULL,
   `date_answered` timestamp NULL DEFAULT NULL,
   `satisfaction` int DEFAULT NULL,
   `satisfaction_scaled_to_5` float DEFAULT NULL,
   `comment` text,
   PRIMARY KEY (`id`),
   UNIQUE KEY `changes_id` (`changes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_oauth_access_tokens`;
CREATE TABLE `ntas_oauth_access_tokens` (
   `identifier` varchar(255) NOT NULL,
   `client` varchar(255) NOT NULL,
   `date_expiration` timestamp NOT NULL,
   `user_identifier` varchar(255) DEFAULT NULL,
   `scopes` text DEFAULT NULL,
   PRIMARY KEY (`identifier`),
   KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_oauth_refresh_tokens`;
CREATE TABLE `ntas_oauth_refresh_tokens` (
   `identifier` varchar(255) NOT NULL,
   `access_token` varchar(255) NOT NULL,
   `date_expiration` timestamp NOT NULL,
   PRIMARY KEY (`identifier`),
   KEY `access_token` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_oauth_auth_codes`;
CREATE TABLE `ntas_oauth_auth_codes` (
   `identifier` varchar(255) NOT NULL,
   `client` varchar(255) NOT NULL,
   `date_expiration` timestamp NOT NULL,
   `user_identifier` varchar(255) DEFAULT NULL,
   `scopes` text DEFAULT NULL,
   PRIMARY KEY (`identifier`),
   KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_oauthclients`;
CREATE TABLE `ntas_oauthclients` (
   `identifier` varchar(255) NOT NULL,
   `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal GLPI ID',
   `name` varchar(255) NOT NULL DEFAULT '',
   `comment` text DEFAULT NULL,
   `secret` varchar(255) NOT NULL,
   `redirect_uri` TEXT NOT NULL,
   `grants` text NOT NULL,
   `scopes` text NOT NULL,
   `is_active` tinyint NOT NULL DEFAULT '1',
   `is_confidential` tinyint NOT NULL DEFAULT '1',
   `allowed_ips` text DEFAULT NULL,
   PRIMARY KEY (`identifier`),
   KEY `id` (`id`),
   KEY `name` (`name`),
   KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_validatorsubstitutes`;
CREATE TABLE `ntas_validatorsubstitutes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned  NOT NULL DEFAULT '0' COMMENT 'Delegator user',
  `users_id_substitute` int unsigned  NOT NULL DEFAULT '0' COMMENT 'Substitute user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_users_id_substitute` (`users_id`, `users_id_substitute`),
  KEY `users_id_substitute` (`users_id_substitute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_searches_criteriafilters`;
CREATE TABLE `ntas_searches_criteriafilters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `search_itemtype` varchar(255) DEFAULT NULL,
  `search_criteria` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`, `items_id`),
  KEY `search_itemtype` (`search_itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_itilvalidationtemplates`;
CREATE TABLE `ntas_itilvalidationtemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `validationsteps_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `validationsteps_id` (`validationsteps_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_itilvalidationtemplates_targets`;
CREATE TABLE `ntas_itilvalidationtemplates_targets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itilvalidationtemplates_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `groups_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itilvalidationtemplates_id` (`itilvalidationtemplates_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `groups_id` (`groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_itilreminders`;
CREATE TABLE `ntas_itilreminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `pendingreasons_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `pendingreasons_id` (`pendingreasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_defaultfilters`;
CREATE TABLE `ntas_defaultfilters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `comment` text DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype` (`itemtype`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_webhooks`;
CREATE TABLE `ntas_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `webhookcategories_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `payload` longtext,
  `use_default_payload` tinyint NOT NULL DEFAULT '1',
  `custom_headers` text,
  `url` text DEFAULT NULL,
  `secret` text,
  `use_cra_challenge` tinyint NOT NULL DEFAULT '0',
  `http_method` varchar(255) DEFAULT 'POST',
  `sent_try` tinyint NOT NULL DEFAULT '3',
  `expiration` int NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '0',
  `save_response_body` tinyint NOT NULL DEFAULT '0',
  `log_in_item_history` tinyint NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `use_oauth` tinyint NOT NULL DEFAULT '0',
  `oauth_url` varchar(255) DEFAULT NULL,
  `clientid` varchar(255) DEFAULT NULL,
  `clientsecret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `use_cra_challenge` (`use_cra_challenge`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `webhookcategories_id` (`webhookcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_webhookcategories`;
CREATE TABLE `ntas_webhookcategories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `webhookcategories_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`webhookcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_queuedwebhooks`;
CREATE TABLE `ntas_queuedwebhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `sent_try` int NOT NULL DEFAULT '0',
  `webhooks_id` int unsigned NOT NULL DEFAULT '0',
  `url` text DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `headers` text,
  `body` longtext,
  `event` varchar(255) DEFAULT NULL,
  `last_status_code` int DEFAULT NULL,
  `save_response_body` tinyint NOT NULL DEFAULT '0',
  `response_body` longtext,
  `http_method` varchar(255) DEFAULT 'POST',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `webhooks_id` (`webhooks_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_stencils`;
CREATE TABLE `ntas_stencils` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `nb_zones` int NOT NULL DEFAULT '1',
  `zones` JSON,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_assets_assetdefinitions`;
CREATE TABLE `ntas_assets_assetdefinitions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `system_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `picture` text,
  `comment` text,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `capacities` JSON NOT NULL,
  `profiles` JSON NOT NULL,
  `translations` JSON NOT NULL,
  `fields_display` JSON NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_name` (`system_name`),
  KEY `label` (`label`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_assets_assets`;
CREATE TABLE `ntas_assets_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assets_assetdefinitions_id` int unsigned NOT NULL,
  `assets_assetmodels_id` int unsigned NOT NULL DEFAULT '0',
  `assets_assettypes_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `comment` text,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id` int unsigned NOT NULL DEFAULT '0',
  `users_id_tech` int unsigned NOT NULL DEFAULT '0',
  `locations_id` int unsigned NOT NULL DEFAULT '0',
  `manufacturers_id` int unsigned NOT NULL DEFAULT '0',
  `states_id` int unsigned NOT NULL DEFAULT '0',
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_template` tinyint NOT NULL DEFAULT '0',
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  `template_name` varchar(255) DEFAULT NULL,
  `autoupdatesystems_id` int unsigned NOT NULL DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `custom_fields` json,
  PRIMARY KEY (`id`),
  KEY `assets_assetdefinitions_id` (`assets_assetdefinitions_id`),
  KEY `assets_assetmodels_id` (`assets_assetmodels_id`),
  KEY `assets_assettypes_id` (`assets_assettypes_id`),
  KEY `name` (`name`),
  KEY `uuid` (`uuid`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `active_assets` (`is_deleted`, `is_template`),
  KEY `is_template` (`is_template`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_assets_assetmodels`;
CREATE TABLE `ntas_assets_assetmodels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assets_assetdefinitions_id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `required_units` int NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int NOT NULL DEFAULT '0',
  `power_consumption` int NOT NULL DEFAULT '0',
  `max_power` int NOT NULL DEFAULT '0',
  `is_half_rack` tinyint NOT NULL DEFAULT '0',
  `picture_front` text,
  `picture_rear` text,
  `pictures` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_assetdefinitions_id` (`assets_assetdefinitions_id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_assets_assettypes`;
CREATE TABLE `ntas_assets_assettypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assets_assetdefinitions_id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_assetdefinitions_id` (`assets_assetdefinitions_id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_groups_items`;
CREATE TABLE `ntas_groups_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `groups_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`groups_id`,`itemtype`,`items_id`, `type`),
  KEY `item` (`itemtype`, `items_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_dropdowns_dropdowndefinitions`;
CREATE TABLE `ntas_dropdowns_dropdowndefinitions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `system_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `profiles` JSON NOT NULL,
  `translations` JSON NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_name` (`system_name`),
  KEY `label` (`label`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_dropdowns_dropdowns`;
CREATE TABLE `ntas_dropdowns_dropdowns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `dropdowns_dropdowndefinitions_id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `entities_id` int unsigned NOT NULL DEFAULT '0',
  `is_recursive` tinyint NOT NULL DEFAULT '0',
  `dropdowns_dropdowns_id` int unsigned NOT NULL DEFAULT '0',
  `completename` text,
  `level` int NOT NULL DEFAULT '0',
  `ancestors_cache` longtext,
  `sons_cache` longtext,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dropdowns_dropdowndefinitions_id` (`dropdowns_dropdowndefinitions_id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `dropdowns_dropdowns_id` (`dropdowns_dropdowns_id`),
  KEY `level` (`level`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_assets_customfielddefinitions`;
CREATE TABLE `ntas_assets_customfielddefinitions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assets_assetdefinitions_id` int unsigned NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `field_options` json,
  `itemtype` VARCHAR(255) NULL DEFAULT NULL,
  `default_value` text,
  `translations` JSON NOT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`assets_assetdefinitions_id`, `system_name`),
  KEY `system_name` (`system_name`),
  KEY `label` (`label`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_contracts_users`;
CREATE TABLE `ntas_contracts_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`, `users_id`),
  KEY `item` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_softwarelicenses_users`;
CREATE TABLE `ntas_softwarelicenses_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `softwarelicenses_id` int unsigned NOT NULL DEFAULT '0',
  `users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ntas_itemtranslations_itemtranslations`;
CREATE TABLE `ntas_itemtranslations_itemtranslations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int unsigned NOT NULL DEFAULT '0',
  `itemtype` varchar(100) NOT NULL,
  `key` varchar(255) NOT NULL,
  `language` varchar(10) NOT NULL,
  `translations` JSON NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_item_key` (`items_id`, `itemtype`, `key`, `language`),
  KEY `item` (`itemtype`, `items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS=1;
