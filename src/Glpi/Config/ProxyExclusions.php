<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Config;

use CommonGLPI;

final class ProxyExclusions
{
    /** @var array<class-string<CommonGLPI>, ProxyExclusion> */
    private array $exclusions = [];

    public function addExclusion(ProxyExclusion $exclusion): self
    {
        $this->exclusions[$exclusion->getClassname()] = $exclusion;
        return $this;
    }

    /** @param array<ProxyExclusion> $exclusions */
    public function addExclusions(array $exclusions): self
    {
        foreach ($exclusions as $exclusion) {
            $this->addExclusion($exclusion);
        }
        return $this;
    }

    /**
     * @return array<class-string<CommonGLPI>, ProxyExclusion>
     */
    public function getExclusions(): array
    {
        return $this->exclusions;
    }

    public function getDropDownValues(): array
    {
        $values = [];
        foreach ($this->exclusions as $exclusion) {
            $values[$exclusion->getClassname()] = $exclusion->getLabel();
        }
        return $values;
    }

    public function getDescriptions(): array
    {
        $descriptions = [__('Objects that should not use proxy configuration:')];
        foreach ($this->exclusions as $exclusion) {
            $descriptions[] = $exclusion->getDescription();
        }
        return $descriptions;
    }
}
