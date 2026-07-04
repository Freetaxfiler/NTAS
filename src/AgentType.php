<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 9.5
 **/
class AgentType extends CommonDBTM
{
    public static $rightname = 'agent';

    public static function getTypeName($nb = 0)
    {
        return _n('Agent type', 'Agents types', $nb);
    }

    public function cleanDBonPurge()
    {
        $agent = new Agent();
        $agent->deleteByCriteria(['agenttypes_id' => $this->fields['id']]);
    }
}
