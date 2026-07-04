<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Console\Config;

use Config;
use Glpi\Console\AbstractCommand;
use Symfony\Component\Console\Helper\QuestionHelper;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Question\Question;

use function Safe\preg_match;

class SetCommand extends AbstractCommand
{
    /**
     * Error thrown when context is invalid.
     *
     * @var int
     */
    public const ERROR_INVALID_CONTEXT = 1;

    protected function configure()
    {
        parent::configure();

        $this->setName('config:set');
        $this->setDescription(__('Set configuration value'));
        $this->addArgument('key', InputArgument::REQUIRED, 'Configuration key');
        $this->addArgument('value', InputArgument::REQUIRED, 'Configuration value (ommit argument to be prompted for value)');
        $this->addOption('context', 'c', InputOption::VALUE_REQUIRED, 'Configuration context', 'core');
    }

    protected function interact(InputInterface $input, OutputInterface $output)
    {
        if (null === $input->getArgument('value')) {
            $question_helper = new QuestionHelper();
            $question = new Question(__('Configuration value:'), '');
            $question->setHidden(true); // Hide prompt as configuration value may be sensitive
            $value = $question_helper->ask($input, $output, $question);
            $input->setArgument('value', $value);
        }
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {

        $context = $input->getOption('context');
        $key     = $input->getArgument('key');
        $value   = $input->getArgument('value');

        if (!preg_match('/^core|inventory|plugin:[a-z]+$/', $context)) {
            $output->writeln(
                sprintf(
                    '<error>' . __('Invalid context "%s".') . '</error>',
                    $context
                ),
                OutputInterface::VERBOSITY_QUIET
            );
            return self::ERROR_INVALID_CONTEXT;
        }

        Config::setConfigurationValues($context, [$key => $value]);

        $output->writeln('<info>' . __(sprintf('Configuration "%s" updated.', $key)) . '</info>');

        return 0; // Success
    }
}
