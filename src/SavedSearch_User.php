<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class SavedSearch_User extends CommonDBRelation
{
    public $auto_message_on_action = false;

    public static $itemtype_1 = SavedSearch::class;
    public static $items_id_1          = 'savedsearches_id';

    public static $itemtype_2 = User::class;
    public static $items_id_2          = 'users_id';


    public static function getSpecificValueToDisplay($field, $values, array $options = [])
    {
        if (!is_array($values)) {
            $values = [$field => $values];
        }
        switch ($field) {
            case 'users_id':
                if (!empty($values[$field])) {
                    return "<span class='ti ti-star-filled bookmark_default'><span class='sr-only'>" . __s('Yes') . "</span></span>";
                } else {
                    return "<span class='ti ti-star-filled bookmark_record'><span class='sr-only'>" . __s('No') . "</span></span>";
                }
        }
        return parent::getSpecificValueToDisplay($field, $values, $options);
    }

    public static function getSpecificValueToSelect($field, $name = '', $values = '', array $options = [])
    {
        if (!is_array($values)) {
            $values = [$field => $values];
        }
        $options['display'] = false;

        switch ($field) {
            case 'users_id':
                $options['name']  = $name;
                $options['value'] = $values[$field];
                return Dropdown::showFromArray(
                    $options['name'],
                    [
                        '1'   => __('Yes'),
                        '0'   => __('No'),
                    ],
                    $options
                );
        }
        return parent::getSpecificValueToSelect($field, $name, $values, $options);
    }

    public function prepareInputForUpdate($input)
    {
        return $this->can($input['id'], READ) ? $input : false;
    }

    /**
     * Summary of getDefault
     * @param mixed $users_id id of the user
     * @param mixed $itemtype type of item
     * @return array|bool same output than SavedSearch::getParameters()
     * @since 9.2
     */
    public static function getDefault($users_id, $itemtype)
    {
        global $DB;

        $iter = $DB->request(['SELECT' => 'savedsearches_id',
            'FROM'   => 'ntas_savedsearches_users',
            'WHERE'  => ['users_id' => $users_id,
                'itemtype' => $itemtype,
            ],
        ]);
        if (count($iter)) {
            $row = $iter->current();
            // Load default bookmark for this $itemtype
            $bookmark = new SavedSearch();
            // Only get data for bookmarks
            return $bookmark->getParameters($row['savedsearches_id']);
        }
        return false;
    }
}
