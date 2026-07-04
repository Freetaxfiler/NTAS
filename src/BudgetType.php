<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Class BudgetType
 * @since 9.1
 **/
class BudgetType extends CommonType
{
    public static function getTypeName($nb = 0)
    {
        return _n('Budget type', 'Budget types', $nb);
    }
}
