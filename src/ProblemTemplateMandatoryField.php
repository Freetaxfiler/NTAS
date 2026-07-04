<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Mandatory fields for problem template class
/// since version 0.83
class ProblemTemplateMandatoryField extends ITILTemplateMandatoryField
{
    // From CommonDBChild
    public static $itemtype = ProblemTemplate::class;
    public static $items_id  = 'problemtemplates_id';
    public static $itiltype = Problem::class;
}
