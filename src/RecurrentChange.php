<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RecurrentChange extends CommonITILRecurrent
{
    /**
     * @var string Right managements
     */
    public static $rightname = 'recurrentchange';

    public static function getTypeName($nb = 0)
    {
        return __('Recurrent changes');
    }

    public static function getSectorizedDetails(): array
    {
        return ['helpdesk', self::class];
    }

    public static function getConcreteClass()
    {
        return Change::class;
    }

    public static function getTemplateClass()
    {
        return ChangeTemplate::class;
    }

    public static function getPredefinedFieldsClass()
    {
        return ChangeTemplatePredefinedField::class;
    }
}
