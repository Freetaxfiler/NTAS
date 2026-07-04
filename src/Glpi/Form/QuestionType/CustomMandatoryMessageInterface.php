<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\QuestionType;

interface CustomMandatoryMessageInterface
{
    public function getCustomMandatoryErrorMessage(): string;
}
