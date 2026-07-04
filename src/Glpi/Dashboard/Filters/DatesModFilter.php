<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Dashboard\Filters;

use Html;

class DatesModFilter extends AbstractFilter
{
    public static function getName(): string
    {
        return __("Last update");
    }

    public static function getId(): string
    {
        return "dates_mod";
    }

    public static function canBeApplied(string $table): bool
    {
        global $DB;

        return $DB->fieldExists($table, 'date_mod');
    }

    public static function getCriteria(string $table, $value): array
    {
        if (!is_array($value) || count($value) !== 2) {
            // Empty filter value
            return [];
        }

        return [
            'WHERE' => self::getDatesCriteria("$table.date_mod", $value),
        ];
    }

    public static function getSearchCriteria(string $table, $value): array
    {
        if (!is_array($value) || count($value) !== 2) {
            // Empty filter value
            return [];
        }

        $date_mod_option_id = self::getSearchOptionID($table, "date_mod", $table);

        return [
            self::getDatesSearchCriteria($date_mod_option_id, $value, 'begin'),
            self::getDatesSearchCriteria($date_mod_option_id, $value, 'end'),
        ];
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
                    GLPI.Dashboard.getActiveDashboard().saveFilter('dates_mod', selectedDates);
                    $(instance.input).closest("fieldset").addClass("filled");
                }
            };
JAVASCRIPT;
        $field .= Html::scriptBlock($js);

        return self::field('dates_mod', $field, $label, count($values) > 0);
    }
}
