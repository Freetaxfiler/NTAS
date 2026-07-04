<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 * @var Migration $migration
 */
$default_charset = DBConnection::getDefaultCharset();
$default_collation = DBConnection::getDefaultCollation();

if (!$DB->fieldExists('ntas_authldaps', 'tls_certfile')) {
    $migration->addField(
        'ntas_authldaps',
        'tls_certfile',
        'text',
        [
            'after'  => 'inventory_domain',
        ]
    );
}

if (!$DB->fieldExists('ntas_authldaps', 'tls_keyfile')) {
    $migration->addField(
        'ntas_authldaps',
        'tls_keyfile',
        'text',
        [
            'after'  => 'tls_certfile',
        ]
    );
}

if (!$DB->fieldExists('ntas_authldaps', 'use_bind')) {
    $migration->addField(
        'ntas_authldaps',
        'use_bind',
        'bool',
        [
            'after'  => 'tls_keyfile',
            'value' => 1,
        ]
    );
}

if (!$DB->fieldExists('ntas_authldaps', 'timeout')) {
    $migration->addField(
        'ntas_authldaps',
        'timeout',
        'int',
        [
            'after'  => 'use_bind',
            'value' => 10,
        ]
    );
}

if (!$DB->fieldExists('ntas_authldapreplicates', 'timeout')) {
    $migration->addField(
        'ntas_authldapreplicates',
        'timeout',
        'int',
        [
            'after'  => 'name',
            'value' => 10,
        ]
    );
}
