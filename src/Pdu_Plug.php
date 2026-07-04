<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @deprecated 11.0.0 Use Item_Plug
 */
class Pdu_Plug extends Item_Plug
{
    public function prepareInputForAdd($input)
    {
        $input['itemtype'] = 'PDU';
        $input['items_id'] = $input['pdus_id'];
        return parent::prepareInputForAdd($input);
    }

    public function prepareInputForUpdate($input)
    {
        $input['itemtype'] = 'PDU';
        $input['items_id'] = $input['pdus_id'];
        return parent::prepareInputForUpdate($input);
    }

    public function post_getFromDB()
    {
        $this->fields['pdus_id'] = $this->fields['items_id'];
        parent::post_getFromDB();
    }

    public static function getTable($classname = null)
    {
        return Item_Plug::getTable();
    }
}
