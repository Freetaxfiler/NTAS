<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Csv;

use League\Csv\Writer;

class CsvResponse
{
    /**
     * Output a CSV file using League\Csv
     *
     * @param ExportToCsvInterface $export
     */
    public static function output(ExportToCsvInterface $export): void
    {
        $csv = Writer::createFromString('');

        // Using a non-empty string for `$escape` is deprecated in PHP 8.4.
        // According to https://www.php.net/manual/fr/function.fgetcsv.php, using an empty value for `$escape`
        // will result in the same as using `\`.
        $csv->setEscape('');

        $csv->setDelimiter($_SESSION["glpicsv_delimiter"] ?? ";");
        $csv->insertOne($export->getFileHeader());
        $csv->insertAll($export->getFileContent());
        $csv->download($export->getFileName());
    }
}
