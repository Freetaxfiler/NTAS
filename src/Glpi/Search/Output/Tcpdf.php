<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Search\Output;

use GLPIPDF;

use function Safe\preg_replace;

class Tcpdf extends \PhpOffice\PhpSpreadsheet\Writer\Pdf\Tcpdf
{
    protected function createExternalWriterInstance($orientation, $unit, $paperSize): \TCPDF
    {
        $instance = new class (
            [
                'orientation' => $orientation,
                'unit' => $unit,
                'format' => $paperSize,
                'font_size' => 8,
                'font' => $_SESSION['glpipdffont'] ?? 'helvetica',
                'margin_bottom' => 30,
            ],
            $this->spreadsheet->getProperties()->getCustomPropertyValue('items count'),
            null,
            false
        ) extends GLPIPDF {
            /**
             * @param bool $val
             *
             * @return void
             */
            public function setPrintFooter($val = true)
            {
                //override because \PhpOffice\PhpSpreadsheet\Writer\Pdf\Tcpdf::save() explicitly calls setPrintFooter(false) -_-
                $this->print_footer = true;
            }
        };

        //remove size considerations so TCPDF do its work.
        $callback = (fn($html) => preg_replace(
            [
                '|</style>|',
                '|width:\d+pt"|',
                '|padding-left:\dpx;|',
            ],
            [
                'table { width: 100%; };</style>',
                '"',
                '',
            ],
            $html
        ));
        $this->setEditHtmlCallback($callback);

        return $instance;
    }
}
