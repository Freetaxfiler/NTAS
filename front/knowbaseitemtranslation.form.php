<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

/**
 * @since 0.85
 */

global $CFG_GLPI;

$translation = new KnowbaseItemTranslation();
if (isset($_POST['add'])) {
    $translation->check(-1, CREATE, $_POST);
    $translation->add($_POST);
    Html::back();
} elseif (isset($_POST['update'])) {
    $translation->check($_POST['id'], UPDATE, $_POST);
    $translation->update($_POST);
    Html::back();
} elseif (isset($_POST["purge"])) {
    $translation->check($_POST['id'], PURGE, $_POST);
    $translation->delete($_POST, true);
    Html::redirect(KnowbaseItem::getFormURLWithID($_POST['knowbaseitems_id']));
} elseif (isset($_GET["id"]) && isset($_GET['to_rev'])) {
    $translation->check($_GET["id"], UPDATE, $_POST);
    if ($translation->revertTo($_GET['to_rev'])) {
        Session::addMessageAfterRedirect(
            htmlescape(sprintf(
                __('Knowledge base item translation has been reverted to revision %s'),
                $_GET['to_rev']
            ))
        );
    } else {
        Session::addMessageAfterRedirect(
            htmlescape(sprintf(
                __('Knowledge base item translation has not been reverted to revision %s'),
                $_GET['to_rev']
            )),
            false,
            ERROR
        );
    }
    Html::redirect($translation->getFormURLWithID($_GET['id']));
} elseif (isset($_GET["id"])) {
    $translation->check($_GET["id"], READ);

    if (Session::getLoginUserID()) {
        if (Session::getCurrentInterface() == "central") {
            Html::header(KnowbaseItem::getTypeName(1), '', "tools", "knowbaseitemtranslation");
        } else {
            Html::helpHeader(__('FAQ'));
        }
        Html::helpHeader(__('FAQ'));
    } else {
        $_SESSION["glpilanguage"] = $CFG_GLPI['language'];
        // Anonymous FAQ
        Html::simpleHeader(__('FAQ'), [
            __('Authentication') => '/',
            __('FAQ')            => '/front/helpdesk.faq.php',
        ]);
    }

    $translation->display(['id' => $_GET['id']]);

    if (Session::getLoginUserID()) {
        if (Session::getCurrentInterface() == "central") {
            Html::footer();
        } else {
            Html::helpFooter();
        }
    } else {
        Html::helpFooter();
    }
}
