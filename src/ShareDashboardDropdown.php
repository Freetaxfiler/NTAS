<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ShareDashboardDropdown extends AbstractRightsDropdown
{
    protected static function getAjaxUrl(): string
    {
        global $CFG_GLPI;

        return $CFG_GLPI['root_doc'] . "/ajax/getShareDashboardDropdownValue.php";
    }

    protected static function getTypes(array $options = []): array
    {
        return [
            User::getType(),
            Entity::getType(),
            Profile::getType(),
            Group::getType(),
        ];
    }
}
