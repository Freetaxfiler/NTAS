<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Migration;

use Glpi\DBAL\JsonFieldInterface;
use Glpi\Form\Form;

interface DestinationFieldConverterInterface
{
    /**
     * Convert field config
     *
     * @param FormMigration $migration
     * @param Form $form
     * @param array<string, mixed> $rawData
     * @return JsonFieldInterface
     */
    public function convertFieldConfig(FormMigration $migration, Form $form, array $rawData): JsonFieldInterface;
}
