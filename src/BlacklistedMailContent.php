<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\Features\Clonable;

/**
 * BlacklistedMailContent Class
 *
 * @since 0.85
 **/
class BlacklistedMailContent extends CommonDropdown
{
    /** @use Clonable<static> */
    use Clonable;

    // From CommonDBTM
    public $dohistory       = false;

    public static $rightname       = 'config';

    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {
        return __('Blacklisted mail content');
    }


    public static function canCreate(): bool
    {
        return static::canUpdate();
    }


    public static function canPurge(): bool
    {
        return static::canUpdate();
    }


    public function getAdditionalFields()
    {

        return [['name'  => 'content',
            'label' => __('Content'),
            'type'  => 'textarea',
            'rows'  => 20,
            'list'  => true,
            'enable_richtext' => false,
        ],
        ];
    }


    public function rawSearchOptions()
    {
        $tab = parent::rawSearchOptions();

        $tab[] = [
            'id'                 => '11',
            'table'              => $this->getTable(),
            'field'              => 'content',
            'name'               => __('Content'),
            'datatype'           => 'text',
            'massiveaction'      => false,
        ];

        return $tab;
    }

    public static function getIcon()
    {
        return "ti ti-mail-x";
    }

    public function getCloneRelations(): array
    {
        return [];
    }
}
