<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ProjectTaskType Class
 *
 * @since 0.85
 **/
class ProjectTaskType extends CommonDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Project tasks type', 'Project tasks types', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-category";
    }
}
