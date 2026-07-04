<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class WebhookCategory extends CommonTreeDropdown
{
    public $can_be_translated = true;

    public static function getTypeName($nb = 0)
    {
        return _n('Webhook category', 'Webhook categories', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-tags";
    }
}
