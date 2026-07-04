<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Reminder_User
/// @since 0.83
class Reminder_User extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1          = Reminder::class;
    public static $items_id_1          = 'reminders_id';
    public static $itemtype_2          = User::class;
    public static $items_id_2          = 'users_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get users for a reminder
     *
     * @param int $reminders_id ID of the reminder
     *
     * @return array of users linked to a reminder
     */
    public static function getUsers($reminders_id)
    {
        global $DB;

        $users = [];

        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => [
                'reminders_id' => $reminders_id,
            ],
        ]);

        foreach ($iterator as $data) {
            $users[$data['users_id']][] = $data;
        }
        return $users;
    }
}
