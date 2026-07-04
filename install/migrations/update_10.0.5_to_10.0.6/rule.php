<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

/** Rename 'name' criteria in dictionnaries */
//move criteria 'name' to 'os_name' for 'RuleDictionnaryOperatingSystem'
//move criteria 'name' to 'os_version' for 'RuleDictionnaryOperatingSystemVersion'
//move criteria 'name' to 'os_edition' for 'RuleDictionnaryOperatingSystemEdition'
//move criteria 'name' to 'arch_name' for 'RuleDictionnaryOperatingSystemArchitecture'
//move criteria 'name' to 'servicepack_name' for 'RuleDictionnaryOperatingSystemServicePack'

$subType = [
    'servicepack_name' => 'RuleDictionnaryOperatingSystemServicePack',
    'os_edition' => 'RuleDictionnaryOperatingSystemEdition',
    'arch_name' => 'RuleDictionnaryOperatingSystemArchitecture',
    'os_version' => 'RuleDictionnaryOperatingSystemVersion',
    'os_name' => 'RuleDictionnaryOperatingSystem',
];

//Get all ntas_rulecriteria with 'name' criteria for OS Dictionnary
$result = $DB->request(
    [
        'SELECT'    => [
            'ntas_rulecriterias.id AS criteria_id',
            'ntas_rulecriterias.criteria',
            'ntas_rules.sub_type',
        ],
        'FROM'      => 'ntas_rulecriterias',
        'LEFT JOIN' => [
            'ntas_rules' => [
                'FKEY' => [
                    'ntas_rulecriterias'   => 'rules_id',
                    'ntas_rules'            => 'id',
                ],
            ],
        ],
        'WHERE'     => [
            'ntas_rulecriterias.criteria'      => 'name',
            'ntas_rules.sub_type' => array_values($subType),
        ],
    ]
);

//foreach criteria, change 'name' key to desired
foreach ($result as $data) {
    $migration->addPostQuery(
        $DB->buildUpdate(
            'ntas_rulecriterias',
            [
                'criteria' => array_search($data['sub_type'], $subType),
            ],
            [
                'id' => $data['criteria_id'],
            ]
        )
    );
}
/** /Rename 'name' criteria in dictionnaries */

/** Init 'initialized_rules_collections' config */
$migration->addConfig(['initialized_rules_collections' => '[]']);
/** /Init 'initialized_rules_collections' config */

/** Fix 'contact' rule criteria */
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_rulecriterias',
        [
            'pattern' => $DB->escape('/(.*)[,|\/]/'),
        ],
        [
            'id' => 19,
            'pattern' => '/(.*)[,|/]/',
        ]
    )
);
/** /Fix 'contact' rule criteria */
