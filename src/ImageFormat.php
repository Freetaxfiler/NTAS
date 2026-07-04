<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class ImageFormat extends CommonDropdown
{
    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return _n('Image format', 'Image formats', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-photo-cog";
    }

    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb([
            Item_DeviceCamera_ImageFormat::class,
        ]);
    }
}
