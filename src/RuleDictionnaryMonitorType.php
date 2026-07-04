<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryMonitorType extends RuleDictionnaryDropdown
{
    public function getCriterias()
    {
        static $criterias = [];

        if (count($criterias)) {
            return $criterias;
        }

        $criterias['name']['field'] = 'name';
        $criterias['name']['name']  = _n('Type', 'Types', 1);
        $criterias['name']['table'] = 'ntas_monitortypes';

        return $criterias;
    }

    public function getActions()
    {
        $actions                          = [];
        $actions['name']['name']          = _n('Type', 'Types', 1);
        $actions['name']['force_actions'] = ['append_regex_result', 'assign', 'regex_result'];

        return $actions;
    }
}
