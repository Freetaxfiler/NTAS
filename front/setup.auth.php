<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Application\View\TemplateRenderer;

Session::checkRight("config", READ);

Html::header(__('External authentication sources'), '', "config", "auth");

echo TemplateRenderer::getInstance()->render(
    'pages/setup/authentication.html.twig',
    [
        'can_use_ldap' => Toolbox::canUseLdap(),
    ]
);

Html::footer();
