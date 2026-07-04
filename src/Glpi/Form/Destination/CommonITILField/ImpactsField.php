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
final class ImpactsField extends AbstractTextAreaField
{
    use TagConversionTrait;

    #[Override]
    protected function getColumnName(): string
    {
        return 'impactcontent';
    }

    #[Override]
    public function getLabel(): string
    {
        return __("Impacts");
    }

    #[Override]
    public function getCategory(): Category
    {
        return Category::ANALYSIS;
    }

    #[Override]
    public function getWeight(): int
    {
        return 10;
    }
}
