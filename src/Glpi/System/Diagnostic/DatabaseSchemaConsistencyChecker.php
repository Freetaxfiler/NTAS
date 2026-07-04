<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\System\Diagnostic;

use CommonTreeDropdown;

/**
 * @since 10.0.0
 */
class DatabaseSchemaConsistencyChecker extends AbstractDatabaseChecker
{
    /**
     * Get list of missing fields, basing detection on other fields.
     *
     * @param string $table_name
     *
     * @return array
     */
    public function getMissingFields(string $table_name): array
    {
        $missing_columns = [];

        $columns = $this->getColumnsNames($table_name);
        $itemtype = getItemTypeForTable($table_name);

        if (is_subclass_of($itemtype, CommonTreeDropdown::class)) {
            foreach (['level', 'ancestors_cache', 'sons_cache'] as $expected_col) {
                if (!in_array($expected_col, $columns)) {
                    $missing_columns[] = $expected_col;
                }
            }
        }
        foreach ($columns as $column_name) {
            switch ($column_name) {
                case 'date_creation':
                    if (!in_array('date_mod', $columns)) {
                        $missing_columns[] = 'date_mod';
                    }
                    break;
                case 'is_dynamic':
                    $exclude_table = ['ntas_useremails', 'ntas_profiles_users', 'ntas_groups_users'];
                    if (!in_array($table_name, $exclude_table)) {
                        if (!in_array('is_deleted', $columns)) {
                            $missing_columns[] = 'is_deleted';
                        }
                    }
                    break;
                case 'date_mod':
                    if ($table_name === 'ntas_logs') {
                        // Logs cannot be modified and their date is stored on `date_mod`.
                        // FIXME It would be more logical to have a `date` instead, but renaming it is not so simple as table
                        // can contains millions of rows.
                        break;
                    }
                    if (!in_array('date_creation', $columns)) {
                        $missing_columns[] = 'date_creation';
                    }
                    break;
            }
        }

        return $missing_columns;
    }
}
