<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @since 0.84
 **/
class SsoVariable extends CommonDropdown
{
    public static $rightname = 'config';

    public $can_be_translated = false;


    public static function getTypeName($nb = 0)
    {

        return _n(
            'Field storage of the login in the HTTP request',
            'Fields storage of the login in the HTTP request',
            $nb
        );
    }


    public static function canCreate(): bool
    {
        return static::canUpdate();
    }

    public static function canPurge(): bool
    {
        return static::canUpdate();
    }


    public function cleanRelationData()
    {

        parent::cleanRelationData();

        if ($this->isUsedInAuth()) {
            $newval = ($this->input['_replace_by'] ?? 0);

            Config::setConfigurationValues(
                'core',
                [
                    'ssovariables_id' => $newval,
                ]
            );
        }
    }


    public function isUsed()
    {

        if (parent::isUsed()) {
            return true;
        }

        return $this->isUsedInAuth();
    }


    /**
     * Check if variable is used in auth process.
     *
     * @return bool
     */
    private function isUsedInAuth()
    {

        $config_values = Config::getConfigurationValues('core', ['ssovariables_id']);

        return array_key_exists('ssovariables_id', $config_values)
         && $config_values['ssovariables_id'] == $this->fields['id'];
    }
}
