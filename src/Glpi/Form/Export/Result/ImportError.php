<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Export\Result;

enum ImportError
{
    case MISSING_DATA_REQUIREMENT;
    case MISSING_CUSTOM_TYPE_REQUIREMENT;
    case MISSING_PLUGIN_REQUIREMENT;
}
