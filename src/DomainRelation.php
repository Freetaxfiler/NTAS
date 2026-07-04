<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class DomainRelation extends CommonDropdown
{
    public const BELONGS = 1;
    public const MANAGE = 2;
    // From CommonDBTM
    public $dohistory                   = true;
    public static $rightname                   = 'dropdown';

    /** @var array */
    public static $knowrelations = [
        [
            'id'        => self::BELONGS,
            'name'      => 'Belongs',
            'comment'   => 'Item belongs to domain',
        ], [
            'id'        => self::MANAGE,
            'name'      => 'Manage',
            'comment'   => 'Item manages domain',
        ],
    ];

    public static function getTypeName($nb = 0)
    {
        return _n('Domain relation', 'Domains relations', $nb);
    }

    public function defineTabs($options = [])
    {

        $ong = [];
        $this->addDefaultFormTab($ong);
        $this->addStandardTab(Domain_Item::class, $ong, $options);
        $this->addStandardTab(Log::class, $ong, $options);

        return $ong;
    }

    /**
     * @return array
     */
    public static function getDefaults()
    {
        return array_map(
            function ($e) {
                $e['is_recursive'] = 1;
                return $e;
            },
            self::$knowrelations
        );
    }

    public function pre_deleteItem()
    {
        if (in_array($this->fields['id'], [self::BELONGS, self::MANAGE])) {
            //keep defaults
            return false;
        }
        return true;
    }
}
