<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Console\Maintenance;

use Config;
use Glpi\Console\AbstractCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class DisableMaintenanceModeCommand extends AbstractCommand
{
    protected $requires_db_up_to_date = false;

    protected function configure()
    {
        parent::configure();

        $this->setName('maintenance:disable');
        $this->setDescription(__('Disable maintenance mode'));
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {

        $config = new Config();
        $config->setConfigurationValues('core', ['maintenance_mode' => '0']);

        $output->writeln('<info>' . __('Maintenance mode disabled.') . '</info>');

        return 0; // Success
    }
}
