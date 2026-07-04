<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */

// !43122 prevent SQL error when messageid exceeds column size
$migration->changeField('ntas_notimportedemails', 'messageid', 'messageid', 'varchar(1000) NOT NULL');
