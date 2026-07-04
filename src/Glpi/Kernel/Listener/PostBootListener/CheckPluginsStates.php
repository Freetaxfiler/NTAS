<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Kernel\Listener\PostBootListener;

use Config;
use DBConnection;
use Glpi\Debug\Profiler;
use Glpi\Kernel\ListenersPriority;
use Glpi\Kernel\PostBootEvent;
use Plugin;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

final readonly class CheckPluginsStates implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PostBootEvent::class => ['onPostBoot', ListenersPriority::POST_BOOT_LISTENERS_PRIORITIES[self::class]],
        ];
    }

    public function onPostBoot(): void
    {
        global $DB;
        if (
            !DBConnection::isDbAvailable()
            || !Config::isLegacyConfigurationLoaded()
            || !$DB->tableExists(Plugin::getTable())
        ) {
            return;
        }

        Profiler::getInstance()->start('CheckPluginsStates::execute', Profiler::CATEGORY_BOOT);

        (new Plugin())->checkStates();

        Profiler::getInstance()->stop('CheckPluginsStates::execute');
    }
}
