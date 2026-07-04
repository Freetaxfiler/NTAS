<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Condition;

enum LogicOperator: string
{
    case AND = 'and';
    case OR = 'or';

    public function getLabel(): string
    {
        return match ($this) {
            self::AND => __("And"),
            self::OR  => __("Or"),
        };
    }

    public static function getDropdownValues(): array
    {
        return [
            self::AND->value => self::AND->getLabel(),
            self::OR->value  => self::OR->getLabel(),
        ];
    }

    public function apply(bool $a, bool $b): bool
    {
        return match ($this) {
            self::AND => $a && $b,
            self::OR  => $a || $b,
        };
    }
}
