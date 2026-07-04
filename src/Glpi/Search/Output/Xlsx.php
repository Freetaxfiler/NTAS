<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Search\Output;

final class Xlsx extends Spreadsheet
{
    public function __construct()
    {
        parent::__construct();
        $this->writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($this->spread);
    }

    public function getMime(): string
    {
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    }

    public function getFileName(): string
    {
        return "glpi.xlsx";
    }
}
