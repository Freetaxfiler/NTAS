<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\System\Requirement;

use Psr\Log\LoggerInterface;
use UnexpectedValueException;

/**
 * @since 9.5.0
 */
class LogsWriteAccess extends AbstractRequirement
{
    /**
     * Logger.
     *
     * @var LoggerInterface
     */
    private $logger;

    /**
     *
     * @param LoggerInterface $logger
     */
    public function __construct(LoggerInterface $logger)
    {
        parent::__construct(
            __('Permissions for log files')
        );

        $this->logger = $logger;
    }

    protected function check()
    {
        // Only write test for GLPI_LOG as SElinux prevent removing log file.
        try {
            $this->logger->warning('Test logger');
            $this->validated = true;
            $this->validation_messages[] = __('The log file has been created successfully.');
        } catch (UnexpectedValueException $e) {
            $this->validated = false;
            $this->validation_messages[] = sprintf(__('The log file could not be created in %s.'), GLPI_LOG_DIR);
        }
    }
}
