<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Readonly fields for problem template class
/// since version 11.0.0
class ProblemTemplateReadonlyField extends ITILTemplateReadonlyField
{
    // From CommonDBChild
    public static $itemtype = ProblemTemplate::class;
    public static $items_id  = 'problemtemplates_id';
    public static $itiltype = Problem::class;
}
