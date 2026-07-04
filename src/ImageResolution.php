<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ImageResolution extends CommonDropdown
{
    public $can_be_translated = false;

    public static function getTypeName($nb = 0)
    {
        return _nx('image', 'Resolution', 'Resolutions', $nb);
    }

    public static function getIcon()
    {
        return "fas fa-expand";
    }

    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb([
            Item_DeviceCamera_ImageResolution::class,
        ]);
    }
}
