<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Stat\Data\Graph;

use Glpi\Stat\StatDataAlwaysDisplay;

class StatDataSatisfaction extends StatDataAlwaysDisplay
{
    public function __construct(array $params)
    {
        parent::__construct($params);

        $avgsatisfaction   = $this->getDataByType($params, "inter_avgsatisfaction");

        $this->labels = array_keys($avgsatisfaction);
        $this->series = [
            [
                'name' => __('Satisfaction'),
                'data' => $avgsatisfaction,
            ],
        ];
    }

    public function getTitle(): string
    {
        return __('Satisfaction');
    }
}
