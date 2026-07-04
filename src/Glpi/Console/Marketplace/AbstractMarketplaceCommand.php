<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Console\Marketplace;

use Glpi\Console\AbstractCommand;
use Glpi\Marketplace\Controller;
use Symfony\Component\Console\Helper\QuestionHelper;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Question\ChoiceQuestion;

abstract class AbstractMarketplaceCommand extends AbstractCommand
{
    /**
     * Get the available choices for the plugin selection
     *
     * @return array Array of choices where the key is the plugin key and the value is the plugin name
     */
    protected function getPluginChoiceChoices(): array
    {
        $controller = new Controller();
        $plugins = $controller::getAPI()->getAllPlugins();
        $result = [];

        foreach ($plugins as $plugin) {
            $result[$plugin['key']] = $plugin['name'];
        }
        return $result;
    }

    /**
     * Get the plugin choice question prompt
     * @return string
     */
    abstract protected function getPluginChoiceQuestion(): string;

    protected function interact(InputInterface $input, OutputInterface $output)
    {
        $plugin_arg_name = null;

        if ($this->getDefinition()->hasArgument('plugin')) {
            $plugin_arg_name = 'plugin';
        } elseif ($this->getDefinition()->hasArgument('plugins')) {
            $plugin_arg_name = 'plugins';
        }
        if ($plugin_arg_name === null) {
            return;
        }

        $directories = $input->getArgument($plugin_arg_name);

        if (empty($directories)) {
            // Ask for plugin list if directory argument is empty
            $choices = $this->getPluginChoiceChoices();

            if ($choices !== []) {
                $question_helper = new QuestionHelper();
                $question = new ChoiceQuestion(
                    $this->getPluginChoiceQuestion(),
                    $choices
                );
                $question->setAutocompleterValues(array_keys($choices));
                $question->setMultiselect($plugin_arg_name === 'plugins');
                $answer = $question_helper->ask(
                    $input,
                    $output,
                    $question
                );
                $input->setArgument($plugin_arg_name, $answer);
            }
        }
    }
}
