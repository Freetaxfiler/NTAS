<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Config;

final readonly class ProxyExclusion
{
    public function __construct(
        private string $classname,
        private string $label,
        private string $description = ''
    ) {
        //
    }

    public function getClassname(): string
    {
        return $this->classname;
    }

    public function getLabel(): string
    {
        return $this->label;
    }

    public function getDescription(): string
    {
        if ($this->description !== '') {
            return sprintf(__('%s: %s'), $this->label, $this->description);
        }
        return $this->label;
    }
}
