<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
// Add pendingreasons_id field
$migration->addField("ntas_itilfollowuptemplates", "pendingreasons_id", "fkey");
$migration->addKey("ntas_itilfollowuptemplates", "pendingreasons_id");
