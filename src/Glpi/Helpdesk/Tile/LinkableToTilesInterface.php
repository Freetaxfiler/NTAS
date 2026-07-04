<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Helpdesk\Tile;

interface LinkableToTilesInterface
{
    public function acceptTiles(): bool;

    public function getTilesConfigInformationText(): ?string;
}
