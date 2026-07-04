<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * ProblemTemplatePredefinedField Class
 *
 * Predefined fields for problem template class
 *
 * @since 0.83
 **/
class ProblemTemplatePredefinedField extends ITILTemplatePredefinedField
{
    // From CommonDBChild
    public static $itemtype = ProblemTemplate::class;
    public static $items_id = 'problemtemplates_id';
    public static $itiltype = Problem::class;
}
