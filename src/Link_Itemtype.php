<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class Link_Itemtype extends CommonDBChild
{
    // From CommonDbChild
    public static $itemtype = Link::class;
    public static $items_id = 'links_id';

    public function getForbiddenStandardMassiveAction()
    {
        $forbidden   = parent::getForbiddenStandardMassiveAction();
        $forbidden[] = 'update';
        return $forbidden;
    }

    /**
     *
     * Remove all associations for an itemtype
     *
     * @param class-string<CommonDBTM> $itemtype  itemtype for which all link associations must be removed
     *
     * @return void
     */
    public static function deleteForItemtype($itemtype)
    {
        global $DB;

        $DB->delete(
            self::getTable(),
            [
                'itemtype'  => ['LIKE', "%Plugin$itemtype%"],
            ]
        );
    }
}
