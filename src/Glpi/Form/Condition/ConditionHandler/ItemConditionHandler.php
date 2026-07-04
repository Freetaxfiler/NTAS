<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition\ConditionHandler;

use CommonDBTM;
use CommonTreeDropdown;
use Glpi\Exception\TooManyResultsException;
use Glpi\Form\Condition\ConditionData;
use Glpi\Form\Condition\ValueOperator;
use Glpi\Form\Migration\ConditionHandlerDataConverterInterface;
use Glpi\Form\Migration\FallbackToAnotherOperatorException;
use Override;

use function Safe\json_decode;

final class ItemConditionHandler implements ConditionHandlerInterface, ConditionHandlerDataConverterInterface
{
    use ArrayConditionHandlerTrait;

    /** @param class-string<CommonDBTM> $itemtype */
    public function __construct(
        private string $itemtype,
    ) {}

    #[Override]
    public function getSupportedValueOperators(): array
    {
        return [
            ValueOperator::EQUALS,
            ValueOperator::NOT_EQUALS,
        ];
    }

    #[Override]
    public function getTemplate(): string
    {
        return '/pages/admin/form/condition_handler_templates/item_dropdown.html.twig';
    }

    #[Override]
    public function getTemplateParameters(ConditionData $condition): array
    {
        return ['itemtype' => $this->itemtype];
    }

    #[Override]
    public function applyValueOperator(
        mixed $a,
        ValueOperator $operator,
        mixed $b,
    ): bool {
        // During form rendering, applyValueOperator is called to compute questions visibility
        // Default value is used as value
        if (!is_array($a) && json_validate($a)) {
            $a = json_decode($a, true);

            // itemtype key is not provided in the default value, use the one from the question
            $a['itemtype'] = $this->itemtype;
        }

        return $this->applyArrayValueOperator($a, $operator, $b);
    }

    #[Override]
    public function convertConditionValue(string $value): array|int
    {
        $nameFields = [];
        $item = getItemForItemtype($this->itemtype);
        if ($item instanceof CommonTreeDropdown) {
            $nameFields[] = $item::getCompleteNameField();
        }
        $nameFields[] = $item::getNameField();

        try {
            foreach ($nameFields as $nameField) {
                // Retrieve item by name
                if ($item->getFromDBByCrit([$nameField => $value])) {
                    return [
                        'itemtype' => $this->itemtype,
                        'items_id' => $item->getID(),
                    ];
                }
            }
        } catch (TooManyResultsException $e) {
            // We failed to find a single item for the given name.
            // This can happen because formcreator use raw strings, which do
            // not garantee that we will get a single result while checking by
            // name.
            // We can bypass this by falling back to a the contains operator,
            // which use raw text.
            $fallback = new FallbackToAnotherOperatorException(
                $e->getMessage(),
                $e->getCode(),
                $e,
            );
            $fallback->setOperator(ValueOperator::CONTAINS);
            $fallback->setValue($value);
            throw $fallback;
        }

        return 0;
    }
}
