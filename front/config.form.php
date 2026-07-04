<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Cache\CacheManager;

Session::checkRight("config", READ);

if (isset($_GET['check_version'])) {
    Session::checkRight("config", UPDATE);
    Session::addMessageAfterRedirect(
        htmlescape(Toolbox::checkNewVersionAvailable())
    );
    Html::back();
}

$config = new Config();
$_POST['id'] = Config::getConfigIDForContext('core');
if (!empty($_POST["update_auth"])) {
    Session::checkRight("config", UPDATE);
    $config->update($_POST);
    Html::back();
}
if (!empty($_POST["update"])) {
    Session::checkRight("config", UPDATE);
    $config->update($_POST);
    Html::redirect(Toolbox::getItemTypeFormURL('Config'));
}
if (!empty($_POST['reset_registration_key'])) {
    $config->checkGlobal(UPDATE);
    Config::setConfigurationValues('core', ['glpinetwork_registration_key' => '']);
    Html::redirect(Toolbox::getItemTypeFormURL('Config'));
}
if (!empty($_POST['reset_opcache'])) {
    $config->checkGlobal(UPDATE);
    if (opcache_reset()) {
        Session::addMessageAfterRedirect(__s('PHP OPcache reset successful'));
    }
    Html::redirect(Toolbox::getItemTypeFormURL('Config'));
}
if (!empty($_POST['reset_core_cache'])) {
    $config->checkGlobal(UPDATE);
    $cache_manager = new CacheManager();
    if ($cache_manager->getCoreCacheInstance()->clear()) {
        Session::addMessageAfterRedirect(__s('GLPI cache reset successful'));
    }
    Html::redirect(Toolbox::getItemTypeFormURL('Config'));
}
if (!empty($_POST['reset_translation_cache'])) {
    $config->checkGlobal(UPDATE);
    $cache_manager = new CacheManager();
    if ($cache_manager->getTranslationsCacheInstance()->clear()) {
        Session::addMessageAfterRedirect(__s('Translation cache reset successful'));
    }
    Html::redirect(Toolbox::getItemTypeFormURL('Config'));
}

Config::displayFullPageForItem($_POST['id'], ["config", "config"], [
    'formoptions'  => "data-track-changes=true",
]);
