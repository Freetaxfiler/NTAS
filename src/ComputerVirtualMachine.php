<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Manage ComputerVirtualMachine.
 * @deprecated 11.0.0 Use ItemVirtualMachine
 */
class ComputerVirtualMachine extends ItemVirtualMachine
{
    public static function getTable($classname = null)
    {
        return ItemVirtualMachine::getTable();
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
