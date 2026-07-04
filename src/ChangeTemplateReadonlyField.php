<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Readonly fields for change template class
 *
 * @since 11.0.0
 */
class ChangeTemplateReadonlyField extends ITILTemplateReadonlyField
{
    // From CommonDBChild
    public static $itemtype = ChangeTemplate::class;
    public static $items_id  = 'changetemplates_id';
    public static $itiltype = Change::class;
}
