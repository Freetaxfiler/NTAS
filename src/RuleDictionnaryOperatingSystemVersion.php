<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

class RuleDictionnaryOperatingSystemVersion extends RuleDictionnaryDropdown
{
    public function getCriterias()
    {
        static $criterias = [];

        if (count($criterias)) {
            return $criterias;
        }

        $criterias['name']['field'] = 'name';
        $criterias['name']['name']  = _n('Version', 'Versions', 1);
        $criterias['name']['table'] = 'ntas_operatingsystemversions';

        $criterias['os_name']['field'] = 'name';
        $criterias['os_name']['name']  = OperatingSystem::getTypeName(1);
        $criterias['os_name']['table'] = 'ntas_operatingsystems';

        $criterias['arch_name']['field'] = 'name';
        $criterias['arch_name']['name']  = OperatingSystemArchitecture::getTypeName(1);
        $criterias['arch_name']['table'] = 'ntas_operatingsystemarchitectures';

        $criterias['servicepack_name']['field'] = 'name';
        $criterias['servicepack_name']['name']  = OperatingSystemServicePack::getTypeName(1);
        $criterias['servicepack_name']['table'] = 'ntas_operatingsystemservicepacks';

        $criterias['os_edition']['field'] = 'name';
        $criterias['os_edition']['name']  = OperatingSystemEdition::getTypeName(1);
        $criterias['os_edition']['table'] = 'ntas_operatingsystemeditions';

        return $criterias;
    }

    public function getActions()
    {
        $actions                          = [];
        $actions['name']['name']          = _n('Version', 'Versions', 1);
        $actions['name']['force_actions'] = ['append_regex_result', 'assign', 'regex_result'];

        return $actions;
    }
}
