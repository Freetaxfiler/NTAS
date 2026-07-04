<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
//move criteria 'os_name' to 'name' for 'RuleDictionnaryOperatingSystem'
//move criteria 'os_version' to 'name' for 'RuleDictionnaryOperatingSystemVersion'
//move criteria 'os_edition' to 'name' for 'RuleDictionnaryOperatingSystemEdition'
//move criteria 'arch_name' to 'name' for 'RuleDictionnaryOperatingSystemArchitecture'
//move criteria 'servicepack_name' to 'name' for 'RuleDictionnaryOperatingSystemServicePack'
$sub_types = [
    'servicepack_name' => 'RuleDictionnaryOperatingSystemServicePack',
    'os_edition' => 'RuleDictionnaryOperatingSystemEdition',
    'arch_name' => 'RuleDictionnaryOperatingSystemArchitecture',
    'os_version' => 'RuleDictionnaryOperatingSystemVersion',
    'os_name' => 'RuleDictionnaryOperatingSystem',
];

//Get all ntas_rulecrtiteria with 'name' criteria for OS Dictionnary
foreach ($sub_types as $criteria => $sub_type) {
    $migration->addPostQuery(
        $DB->buildUpdate(
            'ntas_rulecriterias',
            ['criteria' => 'name'],
            ['criteria' => $criteria],
            [
                'INNER JOIN' => [
                    'ntas_rules' => [
                        'FKEY' => [
                            'ntas_rulecriterias' => 'rules_id',
                            'ntas_rules' => 'id',
                            [
                                'AND' => ['ntas_rules.sub_type' => $sub_type],
                            ],
                        ],
                    ],
                ],
            ]
        )
    );
}
