<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class KnowbaseItemCategory
class KnowbaseItemCategory extends CommonTreeDropdown
{
    // From CommonDBTM
    public $dohistory          = true;
    public $can_be_translated  = true;

    public static $rightname          = 'knowbasecategory';

    public const SEEALL = -1;

    public static function getTypeName($nb = 0)
    {
        return _n('Knowledge base category', 'Knowledge base categories', $nb);
    }

    public static function canView(): bool
    {
        if (Session::getCurrentInterface() == "helpdesk") {
            return true;
        }

        return parent::canView();
    }

    public static function getIcon()
    {
        return KnowbaseItem::getIcon();
    }

    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb(
            [
                KnowbaseItem_KnowbaseItemCategory::class,
            ]
        );
    }
}
