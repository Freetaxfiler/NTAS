<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 *  Timer class for debug and some other cases
 * @deprecated 11.0.0
 */
class Timer
{
    /**
     * Timer value
     * @var int|float
     */
    public $timer = 0;


    /**
     * Start the Timer
     *
     * @return true
     */
    public function start()
    {
        Toolbox::deprecated();
        $this->timer = microtime(true);
        return true;
    }


    /**
     * Get the current time of the timer
     *
     * @param int $decimals Number of decimal of the result (default 3)
     * @param bool $raw      Get raw time
     *
     * @return string time past from start
     **/
    public function getTime($decimals = 3, $raw = false)
    {
        $elapsed = microtime(true) - $this->timer;
        if ($raw === true) {
            return (string) ($elapsed * 1000);
        } else {
            // $decimals will set the number of decimals you want for your milliseconds.
            return number_format($elapsed, $decimals, '.', ' ');
        }
    }
}
