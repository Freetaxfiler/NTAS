<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\Features\Clonable;

/**
 * TaskCategory class
 **/
class TaskCategory extends CommonTreeDropdown
{
    /** @use Clonable<static> */
    use Clonable;

    // From CommonDBTM
    public $dohistory          = true;
    public $can_be_translated  = true;

    public static $rightname          = 'taskcategory';

    public function getAdditionalFields()
    {

        $tab = parent::getAdditionalFields();

        $tab[] = ['name'  => 'is_active',
            'label' => __('Active'),
            'type'  => 'bool',
        ];

        $tab[] = ['name'  => 'knowbaseitemcategories_id',
            'label' => KnowbaseItemCategory::getTypeName(),
            'type'  => 'dropdownValue',
            'list'  => true,
        ];

        return $tab;
    }


    public function rawSearchOptions()
    {
        $tab = parent::rawSearchOptions();

        $tab[] = [
            'id'                 => '8',
            'table'              => $this->getTable(),
            'field'              => 'is_active',
            'name'               => __('Active'),
            'datatype'           => 'bool',
        ];

        return $tab;
    }


    public static function getTypeName($nb = 0)
    {
        return _n('Task category', 'Task categories', $nb);
    }

    public static function getIcon()
    {
        return "ti ti-tags";
    }

    public function getCloneRelations(): array
    {
        return [];
    }
}
