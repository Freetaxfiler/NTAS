<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class Profile_RSSFeed
/// @since 0.84
class Profile_RSSFeed extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1          = RSSFeed::class;
    public static $items_id_1          = 'rssfeeds_id';
    public static $itemtype_2 = Profile::class;
    public static $items_id_2          = 'profiles_id';

    public static $checkItem_2_Rights  = self::DONT_CHECK_ITEM_RIGHTS;
    public static $logs_for_item_2     = false;


    /**
     * Get profiles for a rssfeed
     *
     * @param int $rssfeeds_id ID of the rssfeed
     *
     * @return array
     */
    public static function getProfiles($rssfeeds_id)
    {
        global $DB;

        $prof  = [];
        $iterator = $DB->request([
            'FROM'   => self::getTable(),
            'WHERE'  => ['rssfeeds_id' => $rssfeeds_id],
        ]);

        foreach ($iterator as $data) {
            $prof[$data['profiles_id']][] = $data;
        }
        return $prof;
    }
}
