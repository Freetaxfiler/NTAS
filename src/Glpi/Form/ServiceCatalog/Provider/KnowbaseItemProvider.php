<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\ServiceCatalog\Provider;

use Glpi\DBAL\QueryExpression;
use Glpi\Form\ServiceCatalog\ItemRequest;
use Glpi\Form\ServiceCatalog\ItemRequestContext;
use Glpi\FuzzyMatcher\FuzzyMatcher;
use Glpi\FuzzyMatcher\PartialMatchStrategy;
use KnowbaseItem;
use Override;

/** @implements LeafProviderInterface<KnowbaseItem> */
final class KnowbaseItemProvider implements LeafProviderInterface
{
    private FuzzyMatcher $matcher;

    public function __construct()
    {
        $this->matcher = new FuzzyMatcher(new PartialMatchStrategy());
    }

    #[Override]
    public function getItems(ItemRequest $item_request): array
    {
        $category_id = $item_request->getCategoryID();
        $filter = $item_request->getFilter();

        $knowbase_items = [];

        $criteria = [new QueryExpression('true')];
        if ($category_id !== null) {
            $criteria['forms_categories_id'] = $category_id;
        }

        // On the home page we want to search for all KB items even if they are
        // not enabled for the service catalog itself.
        if ($item_request->getContext() !== ItemRequestContext::HOME_PAGE_SEARCH) {
            $criteria['show_in_service_catalog'] = true;
        }
        $raw_knowbase_items = (new KnowbaseItem())->find($criteria, ['name']);

        foreach ($raw_knowbase_items as $raw_knowbase_item) {
            $knowbase_item = new KnowbaseItem();
            $knowbase_item->getFromResultSet($raw_knowbase_item);
            $knowbase_item->post_getFromDB();

            // Fuzzy matching
            $name        = $knowbase_item->fields['name'] ?? "";
            $answer      = $knowbase_item->fields['answer'] ?? "";
            $description = $knowbase_item->fields['description'] ?? "";
            if (
                !$this->matcher->match($name, $filter)
                && !$this->matcher->match($answer, $filter)
                && !$this->matcher->match($description, $filter)
            ) {
                continue;
            }

            /// Note: this is in theory less performant than applying the parameters
            // directly to the SQL query (which would require more complicated code).
            // However, the number of KB items is expected to be low, so this is acceptable.
            // If performance becomes an issue, we can revisit this and/or add a cache.
            if (!$knowbase_item->canViewItem()) {
                continue;
            }

            $knowbase_items[] = $knowbase_item;
        }

        return $knowbase_items;
    }

    #[Override]
    public function getItemsLabel(): string
    {
        return __("FAQ articles");
    }

    #[Override]
    public function getWeight(): int
    {
        return 20;
    }
}
