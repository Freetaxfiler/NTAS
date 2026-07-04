<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Asset\Capacity;

use CommonGLPI;
use Glpi\Asset\CapacityConfig;
use Item_Plug;
use Override;
use Plug;
use Session;

class HasPlugCapacity extends AbstractCapacity
{
    public function getLabel(): string
    {
        return Plug::getTypeName(Session::getPluralNumber());
    }

    public function getIcon(): string
    {
        return Plug::getIcon();
    }

    #[Override]
    public function getDescription(): string
    {
        return __("Has power plugs. Usually related to PDU or UPS");
    }

    public function getCloneRelations(): array
    {
        return [
            Item_Plug::class,
        ];
    }

    public function isUsed(string $classname): bool
    {
        return parent::isUsed($classname)
            && $this->countAssetsLinkedToPeerItem($classname, Item_Plug::class) > 0;
    }

    public function getCapacityUsageDescription(string $classname): string
    {
        return sprintf(
            __('%1$s plugs attached to %2$s assets'),
            $this->countPeerItemsUsage($classname, Item_Plug::class),
            $this->countAssetsLinkedToPeerItem($classname, Item_Plug::class)
        );
    }

    public function onClassBootstrap(string $classname, CapacityConfig $config): void
    {
        $this->registerToTypeConfig('plug_types', $classname);

        CommonGLPI::registerStandardTab($classname, Item_Plug::class, 55);
    }

    public function onCapacityDisabled(string $classname, CapacityConfig $config): void
    {
        // Unregister from types
        $this->unregisterFromTypeConfig('plug_types', $classname);

        //Delete related items
        $item_plug = new Item_Plug();
        $item_plug->deleteByCriteria(['itemtype' => $classname], force: true, history: false);

        // Clean history related items
        $this->deleteRelationLogs($classname, Item_Plug::class);
    }
}
