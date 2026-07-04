<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\System\Diagnostic;

use DBmysql;
use Exception;

/**
 * @since 10.0.0
 */
abstract class AbstractDatabaseChecker
{
    /**
     * DB instance.
     *
     * @var DBmysql
     */
    protected $db;

    /**
     * Local cache for tables columns.
     *
     * @var array
     */
    private $columns = [];

    /**
     * Local cache for tables indexes.
     *
     * @var array
     */
    private $indexes = [];

    /**
     * @param DBmysql $db   DB instance.
     */
    public function __construct(DBmysql $db)
    {
        $this->db = $db;
    }

    /**
     * Return list of column names for given table.
     *
     * @param string $table_name
     *
     * @return array
     */
    protected function getColumnsNames(string $table_name): array
    {
        $this->fetchTableColumns($table_name);

        return array_column($this->columns[$table_name], 'Field');
    }

    /**
     * Return column type.
     *
     * @param string $table_name
     * @param string $column_name
     *
     * @return null|string
     */
    protected function getColumnType(string $table_name, string $column_name): ?string
    {
        $this->fetchTableColumns($table_name);

        foreach ($this->columns[$table_name] as $column_specs) {
            if ($column_specs['Field'] === $column_name) {
                return $column_specs['Type'];
            }
        }

        return null;
    }

    /**
     * Return column type.
     *
     * @param string $table_name
     *
     * @return void
     */
    private function fetchTableColumns(string $table_name): void
    {
        if (!array_key_exists($table_name, $this->columns)) {
            if (($columns_res = $this->db->doQuery('SHOW COLUMNS FROM ' . $this->db->quoteName($table_name))) === false) {
                throw new Exception(sprintf('Unable to get table "%s" columns', $table_name));
            }

            $this->columns[$table_name] = $columns_res->fetch_all(MYSQLI_ASSOC);
        }
    }

    /**
     * Return index for given table.
     * Array keys are index key, and values are fields related to this key.
     *
     * @param string $table_name
     *
     * @return array
     */
    protected function getIndex(string $table_name): array
    {
        if (!array_key_exists($table_name, $this->indexes)) {
            if (($keys_res = $this->db->doQuery('SHOW INDEX FROM ' . $this->db->quoteName($table_name))) === false) {
                throw new Exception(sprintf('Unable to get table "%s" index', $table_name));
            }

            $index = [];
            while ($key_specs = $keys_res->fetch_assoc()) {
                if ($key_specs['Index_type'] === 'FULLTEXT') {
                    continue; // Ignore FULLTEXT keys
                }
                $key_name = $key_specs['Key_name'];
                if (!array_key_exists($key_name, $index)) {
                    $index[$key_name] = [];
                }
                $index[$key_name][(int) $key_specs['Seq_in_index'] - 1] = $key_specs['Column_name'];
            }

            $this->indexes[$table_name] = $index;
        }

        return $this->indexes[$table_name];
    }
}
