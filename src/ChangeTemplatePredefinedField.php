<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ChangeTemplatePredefinedField Class
 *
 * Predefined fields for change template class
 *
 * @since 0.83
 **/
class ChangeTemplatePredefinedField extends ITILTemplatePredefinedField
{
    // From CommonDBChild
    public static $itemtype = ChangeTemplate::class;
    public static $items_id = 'changetemplates_id';
    public static $itiltype = Change::class;
}
