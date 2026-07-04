<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Csv;

interface ExportToCsvInterface
{
    /**
     * Get name of the csv file
     *
     * @return string
     */
    public function getFileName(): ?string;

    /**
     * Get header of the csv file
     *
     * @return array
     */
    public function getFileHeader(): array;

    /**
     * Get content of the csv file
     *
     * @return array
     */
    public function getFileContent(): array;
}
