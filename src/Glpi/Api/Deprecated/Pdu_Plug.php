<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\Deprecated;

use Item_Plug;
use PDU;

class Pdu_Plug implements DeprecatedInterface
{
    use CommonDeprecatedTrait;

    public function getType(): string
    {
        return Item_Plug::class;
    }

    public function mapCurrentToDeprecatedHateoas(array $hateoas): array
    {
        return $this->replaceCurrentHateoasRefByDeprecated($hateoas);
    }

    public function mapDeprecatedToCurrentFields(object $fields): object
    {
        $this->renameField($fields, 'pdus_id', 'items_id');
        $this->addField($fields, 'itemtype', PDU::class);

        return $fields;
    }

    public function mapCurrentToDeprecatedFields(array $fields): array
    {
        $this->renameField($fields, 'items_id', 'pdus_id');
        $this->deleteField($fields, 'itemtype');

        return $fields;
    }

    public function mapDeprecatedToCurrentCriteria(array $criteria): array
    {
        return $criteria;
    }

    public function mapCurrentToDeprecatedSearchOptions(array $soptions): array
    {
        $this->updateSearchOptionsUids($soptions);

        return array_map(
            static function ($soption) {
                if (isset($soption['table']) && $soption['table'] === 'ntas_pdu_plugs') {
                    $soption['table'] = 'ntas_item_plugs';
                }
                return $soption;
            },
            $soptions
        );
    }
}
