<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Marketplace;

use Notification;
use NotificationTarget;
use Override;
use Plugin;
use Session;

/**
 * @extends NotificationTarget<\Glpi\Marketplace\Controller>
 */
class NotificationTargetController extends NotificationTarget
{
    #[Override]
    public function addNotificationTargets($entity)
    {
        $this->addProfilesToTargets();
        $this->addGroupsToTargets($entity);
        $this->addTarget(Notification::GLOBAL_ADMINISTRATOR, __('Administrator'));
    }

    #[Override]
    public function getEvents()
    {
        return ['checkpluginsupdate' => __('Check all plugin updates')];
    }

    #[Override]
    public function addDataForTemplate($event, $options = [])
    {
        $updated_plugins = $options['plugins'];
        $plugin = new Plugin();
        foreach ($updated_plugins as $plugin_key => $version) {
            $plugin_info = $plugin->getInformationsFromDirectory($plugin_key);

            $this->data['plugins'][] = [
                '##plugin.name##'        => $plugin_info['name'],
                '##plugin.key##'         => $plugin_key,
                '##plugin.version##'     => $version,
                '##plugin.old_version##' => $plugin_info['version'],
            ];
        }

        $this->data['##marketplace.url##'] = $this->formatURL(
            $options['additionnaloption']['usertype'],
            '/front/marketplace.php'
        );

        $this->getTags();
        foreach ($this->tag_descriptions[NotificationTarget::TAG_LANGUAGE] as $tag => $values) {
            if (!isset($this->data[$tag])) {
                $this->data[$tag] = $values['label'];
            }
        }
    }

    #[Override]
    public function getTags()
    {
        //Tags with just lang
        $tags = [
            'plugins_updates_available' => __('Some updates are available for your installed plugins!'),
        ];

        foreach ($tags as $tag => $label) {
            $this->addTagToList([
                'tag'   => $tag,
                'label' => $label,
                'value' => false,
                'lang'  => true,
            ]);
        }

        //Foreach global tags
        $tags = [
            'plugins' => _n('Plugin', 'Plugins', Session::getPluralNumber()),
        ];

        foreach ($tags as $tag => $label) {
            $this->addTagToList([
                'tag'     => $tag,
                'label'   => $label,
                'value'   => false,
                'foreach' => true,
            ]);
        }

        // sub tags
        $tags = [
            'plugin.name'        => __('Plugin name'),
            'plugin.key'         => __('Plugin directory'),
            'plugin.version'     => __('Plugin new version number'),
            'plugin.old_version' => __('Plugin old version number'),
            'marketplace.url'    => __('URL of GLPI marketplace'),
        ];

        foreach ($tags as $tag => $label) {
            $this->addTagToList([
                'tag'    => $tag,
                'label'  => $label,
                'value'  => true,
            ]);
        }
    }
}
