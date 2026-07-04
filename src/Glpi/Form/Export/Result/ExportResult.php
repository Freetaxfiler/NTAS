<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Result;

final class ExportResult
{
    public function __construct(
        private string $filename,
        private string $json_content,
    ) {}

    public function getFileName(): string
    {
        return $this->filename;
    }

    public function getJsonContent(): string
    {
        return $this->json_content;
    }
}
