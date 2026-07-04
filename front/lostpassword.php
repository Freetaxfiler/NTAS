<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Application\View\TemplateRenderer;

global $CFG_GLPI;

if (
    !$CFG_GLPI['notifications_mailing']
    || !countElementsInTable(
        'ntas_notifications',
        ['itemtype' => User::class, 'event' => 'passwordforget', 'is_active' => 1]
    )
) {
    Session::addMessageAfterRedirect(
        __s('Sending password forget notification is not enabled.'),
        true,
        ERROR
    );
    TemplateRenderer::getInstance()->display('forgotpassword.html.twig', [
        'messages_only' => true,
    ]);
    return;
}

$user = new User();

// Manage lost password
// REQUEST needed : GET on first access / POST on submit form
if (isset($_REQUEST['password_forget_token'])) {
    if (isset($_POST['password'])) {
        $user->showUpdateForgottenPassword($_REQUEST);
    } else {
        User::showPasswordForgetChangeForm($_REQUEST['password_forget_token']);
    }
} else {
    if (isset($_POST['email'])) {
        $user->showForgetPassword($_POST['email']);
    } else {
        User::showPasswordForgetRequestForm();
    }
}
