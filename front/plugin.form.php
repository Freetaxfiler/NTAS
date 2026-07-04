<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Exception\Http\BadRequestHttpException;

/**
 * @since 0.84
 */

Session::checkRight("config", UPDATE);

$plugin = new Plugin();

$id     = isset($_POST['id']) && is_numeric($_POST['id']) ? (int) $_POST['id'] : null;
$action = $_POST['action'] ?? null;

switch ($action) {
    case 'install':
    case 'activate':
    case 'unactivate':
    case 'uninstall':
    case 'clean':
        if (!$id) {
            throw new BadRequestHttpException();
        }
        $plugin->{$action}($id);
        break;
    case 'resume_all_execution':
        $plugin->resumeAllPluginsExecution();
        Session::addMessageAfterRedirect(__s('Execution of all active plugins has been resumed.'));
        break;
    case 'suspend_all_execution':
        $plugin->suspendAllPluginsExecution();
        Session::addMessageAfterRedirect(__s('Execution of all active plugins has been suspended.'));
        break;
    default:
        throw new BadRequestHttpException();
}

Html::back();
