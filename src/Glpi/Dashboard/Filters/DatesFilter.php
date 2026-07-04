<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Dashboard\Filters;

use Change;
use Html;
use Problem;
use Ticket;

class DatesFilter extends AbstractFilter
{
    public static function getName(): string
    {
        return __("Creation date");
    }

    public static function getId(): string
    {
        return "dates";
    }

    public static function canBeApplied(string $table): bool
    {
        global $DB;

        return $DB->fieldExists($table, 'date')
            || (
                $DB->fieldExists($table, 'date_creation')
                // exclude itilobject already processed with 'date'
                && !in_array($table, [Ticket::getTable(), Change::getTable(), Problem::getTable()])
            );
    }

    public static function getCriteria(string $table, $value): array
    {
        global $DB;

        if (!is_array($value) || count($value) !== 2) {
            // Empty filter value
            return [];
        }

        $criteria = [
            'WHERE' => [],
        ];

        if ($DB->fieldExists($table, 'date')) {
            $criteria['WHERE'][] = self::getDatesCriteria("$table.date", $value);
        }

        if (
            $DB->fieldExists($table, 'date_creation')
            // exclude itilobject already processed with 'date'
            && !in_array($table, [Ticket::getTable(), Change::getTable(), Problem::getTable()])
        ) {
            $criteria['WHERE'][] = self::getDatesCriteria("$table.date_creation", $value);
        }

        return $criteria;
    }

    public static function getSearchCriteria(string $table, $value): array
    {
        global $DB;

        if (!is_array($value) || count($value) !== 2) {
            // Empty filter value
            return [];
        }

        $criteria = [];

        if ($DB->fieldExists($table, 'date')) {
            $date_option_id = self::getSearchOptionID($table, "date", $table);
            $criteria[] = self::getDatesSearchCriteria($date_option_id, $value, 'begin');
            $criteria[] = self::getDatesSearchCriteria($date_option_id, $value, 'end');
        }

        if (
            $DB->fieldExists($table, 'date_creation')
            // exclude itilobject already processed with 'date'
            && !in_array($table, [Ticket::getTable(), Change::getTable(), Problem::getTable()])
        ) {
            $date_creation_option_id = self::getSearchOptionID($table, "date_creation", $table);
            $criteria[] = self::getDatesSearchCriteria($date_creation_option_id, $value, 'begin');
            $criteria[] = self::getDatesSearchCriteria($date_creation_option_id, $value, 'end');
        }

        return $criteria;
    }

    public static function getHtml($value): string
    {
        $values = is_array($value)
            ? $value
            : [] // can be a string if values are not initialized yet
        ;

        $rand  = mt_rand();
        $label = self::getName();
        $field = Html::showDateField('filter-dates', [
            'value'        => $values,
            'rand'         => $rand,
            'range'        => true,
            'display'      => false,
            'calendar_btn' => false,
            'placeholder'  => $label,
            'on_change'    => "on_change_{$rand}(selectedDates, dateStr, instance)",
        ]);

        $js = <<<JAVASCRIPT
            var on_change_{$rand} = function(selectedDates, dateStr, instance) {
                // we are waiting for empty value or a range of dates,
                // don't trigger when only the first date is selected
                var nb_dates = selectedDates.length;
                if (nb_dates == 0 || nb_dates == 2) {
                    GLPI.Dashboard.getActiveDashboard().saveFilter('dates', selectedDates);
                    $(instance.input).closest("fieldset").addClass("filled");
                }
            };
JAVASCRIPT;
        $field .= Html::scriptBlock($js);

        return self::field('dates', $field, $label, count($values) > 0);
    }
}
