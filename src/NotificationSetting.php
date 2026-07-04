<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Abstract notifications settings class
 */
abstract class NotificationSetting extends CommonDBTM
{
    public const ATTACH_INHERIT           = -2;   // Inherit from global config
    public const ATTACH_NO_DOCUMENT       = 0;    // No document
    public const ATTACH_ALL_DOCUMENTS     = 1;    // All documents
    public const ATTACH_FROM_TRIGGER_ONLY = 2;    // Only documents related to the item that triggers the event

    /**
     * @var string
     */
    public $table           = 'ntas_configs';
    protected $displaylist  = false;
    public static $rightname       = 'config';

    #[Override]
    public static function getTypeName($nb = 0)
    {
        throw new RuntimeException('getTypeName must be implemented');
    }

    /**
     * Get associated mode
     *
     * @return string
     */
    public static function getMode()
    {
        //For PHP 5.x; a method cannot be abstract and static
        throw new RuntimeException('getMode must be implemented');
    }

    /**
     * Get label for enable configuration
     *
     * @return string
     */
    abstract public function getEnableLabel();

    /**
     * Print the config form
     *
     * @return void
     */
    abstract protected function showFormConfig();

    #[Override]
    public static function getTable($classname = null)
    {
        return parent::getTable('Config');
    }

    #[Override]
    public function defineTabs($options = [])
    {
        $ong = [];
        $this->addStandardTab(static::class, $ong, $options);

        return $ong;
    }

    #[Override]
    public function getTabNameForItem(CommonGLPI $item, $withtemplate = 0)
    {
        switch ($item->getType()) {
            case static::class:
                $tabs[1] = self::createTabEntry(__('Setup'));
                return $tabs;
        }
        return '';
    }

    #[Override]
    public static function displayTabContentForItem(CommonGLPI $item, $tabnum = 1, $withtemplate = 0)
    {
        if (get_class($item) == static::class) {
            switch ($tabnum) {
                case 1:
                    $item->showFormConfig();
                    break;
            }
        }
        return true;
    }

    /**
     * Disable (temporary) all notifications for the rest of the request execution
     *
     * @return void
     */
    public static function disableAll()
    {
        global $CFG_GLPI;

        $CFG_GLPI['use_notifications'] = 0;
        foreach (array_keys($CFG_GLPI) as $key) {
            if (str_starts_with($key, 'notifications_')) {
                $CFG_GLPI[$key] = 0;
            }
        }
    }

    #[Override]
    public static function getIcon()
    {
        return "ti ti-bell";
    }
}
