<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */

/** Replace -1 values for ntas_networkportaliases.networkports_id_alias field */
// Migration may have been missed if user installed 10.x version before 9.5.7 release date.
$migration->addPostQuery(
    $DB->buildUpdate(
        'ntas_networkportaliases',
        ['networkports_id_alias' => '0'],
        ['networkports_id_alias' => '-1']
    )
);
/** /Replace -1 values for ntas_networkportaliases.networkports_id_alias field */
