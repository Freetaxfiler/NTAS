<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Inventory\MainAsset;

use PhoneModel;
use PhoneType;

class Phone extends MainAsset
{
    protected function getModelsFieldName(): string
    {
        return PhoneModel::getForeignKeyField();
    }

    protected function getTypesFieldName(): string
    {
        return PhoneType::getForeignKeyField();
    }
}
