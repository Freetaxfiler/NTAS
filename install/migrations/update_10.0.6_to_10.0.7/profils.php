<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var Migration $migration
 */
$migration->addRightByInterface('reminder_public', Reminder::PERSONAL, 'central');
$migration->addRightByInterface('rssfeed_public', RSSFeed::PERSONAL, 'central');
