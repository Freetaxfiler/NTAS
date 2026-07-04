<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Mandatory fields for change template class
 *
 * @since 0.83
 */
class ChangeTemplateMandatoryField extends ITILTemplateMandatoryField
{
    // From CommonDBChild
    public static $itemtype = ChangeTemplate::class;
    public static $items_id  = 'changetemplates_id';
    public static $itiltype = Change::class;
}
