<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class PrinterModel
class PrinterModel extends CommonDropdown
{
    public $additional_fields_for_dictionnary = ['manufacturer'];


    public static function getTypeName($nb = 0)
    {
        return _n('Printer model', 'Printer models', $nb);
    }


    public static function getFieldLabel()
    {
        return _n('Model', 'Models', 1);
    }


    public function cleanDBonPurge()
    {

        // Temporary solution to clean wrong updated items
        $this->deleteChildrenAndRelationsFromDb(
            [
                CartridgeItem_PrinterModel::class,
            ]
        );
    }

    public static function getIcon()
    {
        return Printer::getIcon();
    }
}
