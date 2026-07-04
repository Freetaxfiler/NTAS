<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Inventory\Asset;

use Item_DeviceFirmware;

class Firmware extends Device
{
    public function prepare(): array
    {
        $mapping = [
            'name'         => 'designation',
            'manufacturer' => 'manufacturers_id',
            'type'         => 'devicefirmwaretypes_id',
        ];

        foreach ($this->data as &$val) {
            foreach ($mapping as $origin => $dest) {
                if (property_exists($val, $origin)) {
                    $val->$dest = $val->$origin;
                }
            }
            $val->is_dynamic = 1;
        }

        return $this->data;
    }

    public function getItemtype(): string
    {
        return Item_DeviceFirmware::class;
    }
}
