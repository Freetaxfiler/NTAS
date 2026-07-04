<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryFunction;

class PurgeLogs extends CommonDBTM
{
    protected static $notable = true;

    public static function getTypeName($nb = 0)
    {
        return __('Logs purge');
    }

    /**
     * @param CronTask $task
     *
     * @return int
     */
    public static function cronPurgeLogs($task)
    {
        $cron_status = 0;

        $logs_before = self::getLogsCount();
        if ($logs_before) {
            self::purgeSoftware();
            self::purgeInfocom();
            self::purgeUserInfos();
            self::purgeDevices();
            self::purgeRelations();
            self::purgeItems();
            self::purgeRefusedLogs();
            self::purgeOthers();
            self::purgePlugins();
            self::purgeAll();
            $logs_after = self::getLogsCount();
            Log::history(0, self::class, [0, $logs_before, $logs_after], '', Log::HISTORY_LOG_SIMPLE_MESSAGE);
            $task->addVolume($logs_before - $logs_after);
            $cron_status = 1;
        } else {
            $task->addVolume(0);
        }
        return $cron_status;
    }

    /**
     * @param string $name
     *
     * @return array
     */
    public static function cronInfo($name)
    {
        return ['description' => __("Purge history")];
    }

    /**
     * Purge software logs
     *
     * @return void
     */
    public static function purgeSoftware()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_item_software_install']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => $CFG_GLPI['software_types'],
                    'linked_action'   => [
                        Log::HISTORY_INSTALL_SOFTWARE,
                        Log::HISTORY_UNINSTALL_SOFTWARE,
                        Log::HISTORY_ADD_SUBITEM,
                        Log::HISTORY_UPDATE_SUBITEM,
                        Log::HISTORY_DELETE_SUBITEM,
                    ],
                ] + $month
            );
        }

        $month = self::getDateModRestriction($CFG_GLPI['purge_software_item_install']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => SoftwareVersion::class,
                    'linked_action'   => [
                        Log::HISTORY_INSTALL_SOFTWARE,
                        Log::HISTORY_UNINSTALL_SOFTWARE,
                    ],
                ] + $month
            );
        }

        $month = self::getDateModRestriction($CFG_GLPI['purge_software_version_install']);
        if ($month) {
            //Delete software version association
            $DB->delete(
                'ntas_logs',
                [
                    'OR' => [
                        [
                            'itemtype'        => Computer::class,
                            'itemtype_link'   => 'Software',
                        ],
                        [
                            'itemtype'        => Software::class,
                            'itemtype_link'   => 'SoftwareVersion',
                        ],
                        [
                            'itemtype'        => Software::class,
                            'itemtype_link'   => 'Item_SoftwareVersion',
                        ],
                        [
                            'itemtype'        => SoftwareVersion::class,
                            'itemtype_link'   => 'Item_SoftwareVersion',
                        ],
                    ],
                    'linked_action'   => [
                        Log::HISTORY_ADD_SUBITEM,
                        Log::HISTORY_UPDATE_SUBITEM,
                        Log::HISTORY_DELETE_SUBITEM,
                    ],
                ] + $month
            );
        }
    }

    /**
     * Purge infocom logs
     *
     * @return void
     */
    public static function purgeInfocom()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_infocom_creation']);
        if ($month) {
            //Delete add infocom
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => Software::class,
                    'itemtype_link'   => 'Infocom',
                    'linked_action'   => Log::HISTORY_ADD_SUBITEM,
                ] + $month
            );

            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => Infocom::class,
                    'linked_action'   => Log::HISTORY_CREATE_ITEM,
                ] + $month
            );
        }
    }

    /**
     * Purge users logs
     *
     * @return void
     */
    public static function purgeUserinfos()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_profile_user']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => User::class,
                    'itemtype_link'   => 'Profile_User',
                    'linked_action'   => [
                        Log::HISTORY_ADD_SUBITEM,
                        Log::HISTORY_UPDATE_SUBITEM,
                        Log::HISTORY_DELETE_SUBITEM,
                    ],
                ] + $month
            );
        }

        $month = self::getDateModRestriction($CFG_GLPI['purge_group_user']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => User::class,
                    'itemtype_link'   => 'Group_User',
                    'linked_action'   => [
                        Log::HISTORY_ADD_SUBITEM,
                        Log::HISTORY_UPDATE_SUBITEM,
                        Log::HISTORY_DELETE_SUBITEM,
                    ],
                ] + $month
            );
        }

        $month = self::getDateModRestriction($CFG_GLPI['purge_userdeletedfromldap']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => User::class,
                    'linked_action'   => Log::HISTORY_LOG_SIMPLE_MESSAGE,
                ] + $month
            );
        }

        $month = self::getDateModRestriction($CFG_GLPI['purge_user_auth_changes']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype'        => User::class,
                    'linked_action'   => Log::HISTORY_ADD_RELATION,
                ] + $month
            );
        }
    }


    /**
     * Purge devices logs
     *
     * @return void
     */
    public static function purgeDevices()
    {
        global $CFG_GLPI, $DB;

        $actions = [
            Log::HISTORY_ADD_DEVICE          => "adddevice",
            Log::HISTORY_UPDATE_DEVICE       => "updatedevice",
            Log::HISTORY_DELETE_DEVICE       => "deletedevice",
            Log::HISTORY_CONNECT_DEVICE      => "connectdevice",
            Log::HISTORY_DISCONNECT_DEVICE   => "disconnectdevice",
        ];
        foreach ($actions as $key => $value) {
            $month = self::getDateModRestriction($CFG_GLPI['purge_' . $value]);
            if ($month) {
                //Delete software version association
                $DB->delete(
                    'ntas_logs',
                    [
                        'linked_action' => $key,
                    ] + $month
                );
            }
        }
    }

    /**
     * Purge relations logs
     *
     * @return void
     */
    public static function purgeRelations()
    {
        global $CFG_GLPI, $DB;

        $actions = [
            Log::HISTORY_ADD_RELATION     => "addrelation",
            Log::HISTORY_UPDATE_RELATION  => "addrelation",
            Log::HISTORY_DEL_RELATION     => "deleterelation",
        ];
        foreach ($actions as $key => $value) {
            $month = self::getDateModRestriction($CFG_GLPI['purge_' . $value]);
            if ($month) {
                //Delete software version association
                $DB->delete(
                    'ntas_logs',
                    [
                        'linked_action' => $key,
                    ] + $month
                );
            }
        }
    }

    /**
     * Purge items logs
     *
     * @return void
     */
    public static function purgeItems()
    {
        global $CFG_GLPI, $DB;

        $actions = [
            Log::HISTORY_CREATE_ITEM      => "createitem",
            Log::HISTORY_ADD_SUBITEM      => "createitem",
            Log::HISTORY_DELETE_ITEM      => "deleteitem",
            Log::HISTORY_DELETE_SUBITEM   => "deleteitem",
            Log::HISTORY_UPDATE_SUBITEM   => "updateitem",
            Log::HISTORY_RESTORE_ITEM     => "restoreitem",
        ];
        foreach ($actions as $key => $value) {
            $month = self::getDateModRestriction($CFG_GLPI['purge_' . $value]);
            if ($month) {
                //Delete software version association
                $DB->delete(
                    'ntas_logs',
                    [
                        'linked_action' => $key,
                    ] + $month
                );
            }
        }
    }

    /**
     * Purge refused equipments logs
     *
     * @return void
     */
    public static function purgeRefusedLogs()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_refusedequipment']);
        if ($month) {
            $refused = new RefusedEquipment();
            $iterator = $DB->request([
                'SELECT' => 'id',
                'FROM' => RefusedEquipment::getTable(),
            ] + $month);

            foreach ($iterator as $row) {
                //purge each one
                $refused->delete($row, true);
            }
        }
    }


    /**
     * Purge othr logs
     *
     * @return void
     */
    public static function purgeOthers()
    {
        global $CFG_GLPI, $DB;

        $actions = [
            16 => 'comments',
            19 => 'datemod',
        ];
        foreach ($actions as $key => $value) {
            $month = self::getDateModRestriction($CFG_GLPI['purge_' . $value]);
            if ($month) {
                $DB->delete(
                    'ntas_logs',
                    [
                        'id_search_option' => $key,
                    ] + $month
                );
            }
        }
    }


    /**
     * Purge plugins logs
     *
     * @return void
     */
    public static function purgePlugins()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_plugins']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                [
                    'itemtype' => ['LIKE', 'Plugin%'],
                ] + $month
            );
        }
    }


    /**
     * Purge all logs
     *
     * @return void
     */
    public static function purgeAll()
    {
        global $CFG_GLPI, $DB;

        $month = self::getDateModRestriction($CFG_GLPI['purge_all']);
        if ($month) {
            $DB->delete(
                'ntas_logs',
                $month
            );
        }
    }

    /**
     * Get modification date restriction clause
     *
     * @param int $month Number of months
     *
     * @return array|false
     */
    public static function getDateModRestriction($month)
    {
        if ($month > 0) {
            return ['date_mod' => ['<=', QueryFunction::dateSub(QueryFunction::now(), $month, 'MONTH')]];
        } elseif ($month == Config::DELETE_ALL) {
            return [1 => 1];
        } elseif ($month == Config::KEEP_ALL) {
            return false;
        }

        return false; // Unknown value, keep all by default
    }

    /**
     * Count logs
     *
     * @return int
     */
    public static function getLogsCount()
    {
        return countElementsInTable('ntas_logs');
    }
}
