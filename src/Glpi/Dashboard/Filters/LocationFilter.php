<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Dashboard\Filters;

use Location;
use Session;

class LocationFilter extends AbstractFilter
{
    public static function getName(): string
    {
        return Location::getTypeName(Session::getPluralNumber());
    }

    public static function getId(): string
    {
        return "location";
    }

    public static function canBeApplied(string $table): bool
    {
        global $DB;

        return $DB->fieldExists($table, 'locations_id');
    }

    public static function getCriteria(string $table, $value): array
    {
        $criteria = [];

        if ((int) $value > 0) {
            $criteria["WHERE"] = [
                "$table.locations_id" => (int) $value,
            ];
        }

        return $criteria;
    }

    public static function getSearchCriteria(string $table, $value): array
    {
        $criteria = [];

        if ((int) $value > 0) {
            $criteria[] = [
                'link'       => 'AND',
                'field'      => self::getSearchOptionID($table, 'locations_id', 'ntas_locations'),
                'searchtype' => 'equals',
                'value'      => (int) $value,
            ];
        }

        return $criteria;
    }

    public static function getHtml($value): string
    {
        return self::displayList(
            self::getName(),
            is_string($value) ? $value : "",
            'location',
            Location::class
        );
    }
}
