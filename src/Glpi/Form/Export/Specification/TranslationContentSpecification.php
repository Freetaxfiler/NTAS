<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Specification;

final class TranslationContentSpecification implements ContentSpecificationInterface
{
    public string $itemtype;
    public string $items_id;
    public string $key;
    public string $language;
    public array $translations;
}
