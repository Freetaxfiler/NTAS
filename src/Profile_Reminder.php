<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Profile_Reminder
/// @since 0.83
class Profile_Reminder extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1 = Reminder::class;
    public static $items_id_1          = 'reminders_id';
    public static $itemtype_2 = Profile::class;
    public static $items_id_2          = 'profiles_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get profiles for a reminder
     *
     * @param int $reminders_id ID of the reminder
     *
     * @return array
     */
    public static function getProfiles($reminders_id)
    {
        global $DB;

        $prof  = [];
        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => [
                'reminders_id' => $reminders_id,
            ],
        ]);

        foreach ($iterator as $data) {
            $prof[$data['profiles_id']][] = $data;
        }
        return $prof;
    }
}
