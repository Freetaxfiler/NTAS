<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class PlanningEventCategory extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Event category', 'Event categories', $nb);
    }

    public function getAdditionalFields()
    {
        return [
            [
                'name'  => 'color',
                'label' => __('Color'),
                'type'  => 'color',
            ],
        ];
    }

    public static function getIcon()
    {
        return "ti ti-tags";
    }
}
