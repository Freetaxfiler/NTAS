<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryPrinterType extends RuleDictionnaryDropdown
{
    public function getCriterias()
    {
        static $criterias = [];

        if (count($criterias)) {
            return $criterias;
        }

        $criterias['name']['field'] = 'name';
        $criterias['name']['name']  = _n('Type', 'Types', 1);
        $criterias['name']['table'] = 'ntas_printertypes';

        return $criterias;
    }

    public function getActions()
    {
        $actions                          = [];
        $actions['name']['name']          = _n('Type', 'Types', 1);
        $actions['name']['force_actions'] = ['assign', 'regex_result', 'append_regex_result'];

        return $actions;
    }
}
