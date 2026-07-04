<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class ExportContentSpecification
{
    public int $version;

    /** @var FormContentSpecification[] */
    public array $forms = [];

    public function addForm(FormContentSpecification $spec): void
    {
        $this->forms[] = $spec;
    }
}
