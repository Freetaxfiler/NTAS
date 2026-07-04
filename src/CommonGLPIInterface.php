<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * CommonGLPI interface.
 */
interface CommonGLPIInterface
{
    /**
     * Constructor.
     *
     * Declared in interface to ensure that `getItemForItemtype()` will be able to create an instance of CommonGLPI without
     * having to pass any parameter.
     */
    public function __construct();
}
