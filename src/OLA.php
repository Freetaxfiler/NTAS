<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * OLA Class
 * @since 9.2
 **/
class OLA extends LevelAgreement
{
    /**
     * @var string
     */
    protected static $prefix            = 'ola';
    /**
     * @var string
     */
    protected static $prefixticket      = 'internal_';
    protected static $levelclass        = 'OlaLevel';
    protected static $levelticketclass  = 'OlaLevel_Ticket';
    protected static $forward_entity_to = ['OlaLevel'];

    public static function getTypeName($nb = 0)
    {
        // Acronym, no plural
        return __('OLA');
    }

    public static function getSectorizedDetails(): array
    {
        return ['config', SLM::class, self::class];
    }

    public static function getLogDefaultServiceName(): string
    {
        return 'setup';
    }

    public static function getIcon()
    {
        return SLM::getIcon();
    }

    public function showFormWarning()
    {
        global $CFG_GLPI;

        echo "<img src='" . htmlescape($CFG_GLPI["root_doc"]) . "/pics/warning.png' alt='" . __s('Warning') . "'>";
        echo __s('The internal time is recalculated when assigning the OLA');
    }

    public function getAddConfirmation(): array
    {
        return [
            __("The assignment of an OLA to a ticket causes the recalculation of the date."),
            __("Escalations defined in the OLA will be triggered under this new date."),
        ];
    }
}
