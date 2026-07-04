<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 9.2
 */


/**
 * SLA Class
 **/
class SLA extends LevelAgreement
{
    /**
     * @var string
     */
    protected static $prefix            = 'sla';
    /**
     * @var string
     */
    protected static $prefixticket      = '';
    protected static $levelclass        = SlaLevel::class;
    protected static $levelticketclass  = SlaLevel_Ticket::class;
    protected static $forward_entity_to = [SlaLevel::class];

    public static function getTypeName($nb = 0)
    {
        // Acronym, no plural
        return __('SLA');
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

    public function showFormWarning() {}

    public function getAddConfirmation(): array
    {
        return [
            __("The assignment of a SLA to a ticket causes the recalculation of the date."),
            __("Escalations defined in the SLA will be triggered under this new date."),
        ];
    }
}
