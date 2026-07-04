<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class DeviceSimcard
class DeviceSimcard extends CommonDevice
{
    protected static $forward_entity_to = ['Item_DeviceSimcard', 'Infocom'];

    public static function getTypeName($nb = 0)
    {
        return _n('Simcard', 'Simcards', $nb);
    }

    public function getAdditionalFields()
    {
        return array_merge(
            parent::getAdditionalFields(),
            [
                [
                    'name'  => 'devicesimcardtypes_id',
                    'label' => _n('Type', 'Types', 1),
                    'type'  => 'dropdownValue',
                ],
                [
                    'name'  => 'voltage',
                    'label' => __('Voltage'),
                    'type'  => 'integer',
                    'min'   => 0,
                    'unit'  => 'mV',
                ],
                [
                    'name'  => 'allow_voip',
                    'label' => __('Allow VOIP'),
                    'type'  => 'bool',
                ],
            ]
        );
    }

    public function rawSearchOptions()
    {
        $tab = parent::rawSearchOptions();

        $tab[] = [
            'id'                 => '12',
            'table'              => static::getTable(),
            'field'              => 'voltage',
            'name'               => __('Voltage'),
            'datatype'           => 'integer',
        ];

        $tab[] = [
            'id'                 => '13',
            'table'              => 'ntas_devicesimcardtypes',
            'field'              => 'name',
            'name'               => _n('Type', 'Types', 1),
            'datatype'           => 'dropdown',
        ];

        $tab[] = [
            'id'                 => '14',
            'table'              => static::getTable(),
            'field'              => 'allow_voip',
            'name'               => __('Allow VOIP'),
            'datatype'           => 'bool',
        ];

        return $tab;
    }

    public function getImportCriteria()
    {
        return [
            'designation'             => 'equal',
            'manufacturers_id'        => 'equal',
            'devicesimcardtypes_id'   => 'equal',
        ];
    }

    public static function getIcon()
    {
        return "ti ti-device-sim";
    }
}
