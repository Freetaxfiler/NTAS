<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/// Class NetworkEquipmentModel
class NetworkEquipmentModel extends CommonDCModelDropdown
{
    public static function getTypeName($nb = 0)
    {
        return _n('Networking equipment model', 'Networking equipment models', $nb);
    }

    public function defineTabs($options = [])
    {
        $ong = parent::defineTabs($options);

        // Add stencil tab if there is at least one picture field defined
        foreach ((new NetworkEquipmentModelStencil())->getPicturesFields() as $picture_field) {
            if (!empty($this->getItemtypeOrModelPicture($picture_field))) {
                $this->addStandardTab(NetworkEquipmentModelStencil::class, $ong, $options);
                break;
            }
        }

        return $ong;
    }
}
