<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Update from 9.5.2 to 9.5.3
 *
 * @return bool
 **/
function update952to953()
{
    /**
     * @var DBmysql $DB
     * @var Migration $migration
     */
    global $DB, $migration;

    $updateresult     = true;

    $migration->setVersion('9.5.3');

    /* Fix rule criteria names */
    $mapping = [
        'RuleMailCollector' => [
            'GROUPS' => '_groups_id_requester',
        ],
        'RuleRight' => [
            'GROUPS' => '_groups_id',
        ],
        'RuleTicket' => [
            'users_locations' => '_locations_id_of_requester',
            'items_locations' => '_locations_id_of_item',
            'items_groups'    => '_groups_id_of_item',
            'items_states'    => '_states_id_of_item',
        ],
    ];
    foreach ($mapping as $type => $names) {
        foreach ($names as $oldname => $newname) {
            $migration->addPostQuery(
                $DB->buildUpdate(
                    'ntas_rulecriterias',
                    ['criteria' => $newname],
                    ['ntas_rulecriterias.criteria' => $oldname, 'ntas_rules.sub_type' => $type],
                    [
                        'LEFT JOIN' => [
                            'ntas_rules' => [
                                'FKEY' => [
                                    'ntas_rulecriterias' => 'rules_id',
                                    'ntas_rules'         => 'id',
                                ],
                            ],
                        ],
                    ]
                )
            );
        }
    }
    /* /Fix rule criteria names */

    // ************ Keep it at the end **************
    $migration->executeMigration();

    return $updateresult;
}
