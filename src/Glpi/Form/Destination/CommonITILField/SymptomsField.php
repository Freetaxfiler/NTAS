<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination\CommonITILField;

use Glpi\Form\Destination\HasFormTags;
use Glpi\Form\Migration\TagConversionTrait;
use Override;

#[HasFormTags]
final class SymptomsField extends AbstractTextAreaField
{
    use TagConversionTrait;

    #[Override]
    protected function getColumnName(): string
    {
        return 'symptomcontent';
    }

    #[Override]
    public function getLabel(): string
    {
        return __("Symptoms");
    }

    #[Override]
    public function getCategory(): Category
    {
        return Category::ANALYSIS;
    }

    #[Override]
    public function getWeight(): int
    {
        return 30;
    }
}
