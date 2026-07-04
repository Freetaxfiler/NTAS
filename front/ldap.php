<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Application\View\TemplateRenderer;

Session::checkRight("user", User::IMPORTEXTAUTHUSERS);

Html::header(__('LDAP directory link'), '', "admin", "user", "ldap");

echo TemplateRenderer::getInstance()->render(
    'pages/admin/ldap.users.html.twig'
);

Html::footer();
