<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Inventory\MainAsset;

use ComputerModel;
use ComputerType;

class Computer extends MainAsset
{
    protected function getModelsFieldName(): string
    {
        return ComputerModel::getForeignKeyField();
    }

    protected function getTypesFieldName(): string
    {
        return ComputerType::getForeignKeyField();
    }
}
