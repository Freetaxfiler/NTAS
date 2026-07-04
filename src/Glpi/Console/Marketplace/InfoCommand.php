<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Console\Marketplace;

use Glpi\Marketplace\Controller;
use GLPINetwork;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class InfoCommand extends AbstractMarketplaceCommand
{
    protected function configure()
    {
        parent::configure();

        $this->setName('marketplace:info');
        $this->setDescription(__('Get information about a plugin'));

        $this->addArgument('plugin', InputArgument::REQUIRED, __('The plugin key'));
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        if (!Controller::isCLIAllowed()) {
            $output->writeln("<error>" . __('Access to the marketplace CLI commands is disallowed by the GLPI configuration') . "</error>");
            return 1;
        }

        if (!GLPINetwork::isRegistered()) {
            $output->writeln("<error>" . __("The GLPI Network registration key is missing or invalid") . "</error>");
        }

        $plugin = $input->getArgument('plugin');

        $controller = new Controller();
        $plugins = $controller::getAPI()->getAllPlugins();

        $result = array_filter($plugins, static fn($p) => strtolower($p['key']) === strtolower($plugin));

        if (count($result) === 0) {
            $output->writeln('<error>' . sprintf(__('Plugin %1$s not found!'), $plugin) . '</error>');
            return 1;
        }

        $result = reset($result);
        $output->write(var_export($result, true));

        return 0; // Success
    }

    protected function getPluginChoiceQuestion(): string
    {
        return __('Which plugin do you want information on?');
    }
}
