<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Manage ComputerAntivirus.
 * @deprecated 11.0.0 Use ItemAntivirus
 */
class ComputerAntivirus extends ItemAntivirus
{
    public static function getTable($classname = null)
    {
        return ItemAntivirus::getTable();
    }

    public function prepareInputForAdd($input)
    {
        //add missing itemtype, rename computers_id to items_id
        $input['itemtype'] = 'Computer';
        if (isset($input['computers_id'])) {
            $input['itemps_id'] = $input['computers_id'];
            unset($input['computers_id']);
        }

        return parent::prepareInputForAdd($input);
    }

    public function prepareInputForUpdate($input)
    {
        //add missing itemtype, rename computers_id to items_id
        if (!isset($input['itemtype'])) {
            $input['itemtype'] = 'Computer';
        }
        if (isset($input['computers_id'])) {
            $input['itemps_id'] = $input['computers_id'];
            unset($input['computers_id']);
        }

        return parent::prepareInputForUpdate($input);
    }
}
