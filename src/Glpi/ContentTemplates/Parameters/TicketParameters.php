<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use CommonDBTM;
use Glpi\ContentTemplates\Parameters\ParametersTypes\ArrayParameter;
use Glpi\ContentTemplates\Parameters\ParametersTypes\AttributeParameter;
use Glpi\ContentTemplates\Parameters\ParametersTypes\ObjectParameter;
use Item_Ticket;
use KnowbaseItem;
use KnowbaseItem_Item;
use Location;
use OLA;
use RequestType;
use Session;
use SLA;
use Ticket;
use TicketValidation;

/**
 * Parameters for "Ticket" items.
 *
 * @since 10.0.0
 */
class TicketParameters extends CommonITILObjectParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'ticket';
    }

    public static function getObjectLabel(): string
    {
        return Ticket::getTypeName(1);
    }

    protected function getTargetClasses(): array
    {
        return [Ticket::class];
    }

    public function getAvailableParameters(): array
    {
        return array_merge(parent::getAvailableParameters(), [
            new AttributeParameter("type", _n('Type', 'Types', 1)),
            new AttributeParameter("global_validation", _n('Approval', 'Approvals', 1)),
            new AttributeParameter("tto", __('Time to own'), 'date("d/m/y H:i")'),
            new AttributeParameter("ttr", __('Time to resolve'), 'date("d/m/y H:i")'),
            new ObjectParameter(new SLAParameters(), 'sla_tto'),
            new ObjectParameter(new SLAParameters(), 'sla_ttr'),
            new ObjectParameter(new OLAParameters(), 'ola_tto'),
            new ObjectParameter(new OLAParameters(), 'ola_ttr'),
            new ObjectParameter(new RequestTypeParameters()),
            new ObjectParameter(new LocationParameters()),
            new ArrayParameter("knowbaseitems", new KnowbaseItemParameters(), KnowbaseItem_Item::getTypeName(Session::getPluralNumber())),
            new ArrayParameter("assets", new AssetParameters(), Item_Ticket::getTypeName(Session::getPluralNumber())),
        ]);
    }

    protected function defineValues(CommonDBTM $ticket): array
    {
        global $CFG_GLPI;

        $fields = $ticket->fields;

        $values = parent::defineValues($ticket);

        /** @var Ticket $ticket  */
        $values['type'] = $ticket::getTicketTypeName($fields['type']);
        $values['global_validation'] = TicketValidation::getStatus($fields['global_validation']);
        $values['tto'] = $fields['time_to_own'];
        $values['ttr'] = $fields['time_to_resolve'];

        // Add ticket's SLA / OLA
        $sla_parameters = new SLAParameters();
        if ($sla = SLA::getById($fields['slas_id_tto'])) {
            $values['sla_tto'] = $sla_parameters->getValues($sla);
        }
        if ($sla = SLA::getById($fields['slas_id_ttr'])) {
            $values['sla_ttr'] = $sla_parameters->getValues($sla);
        }
        $ola_parameters = new OLAParameters();
        if ($ola = OLA::getById($fields['olas_id_tto'])) {
            $values['ola_tto'] = $ola_parameters->getValues($ola);
        }
        if ($ola = OLA::getById($fields['olas_id_ttr'])) {
            $values['ola_ttr'] = $ola_parameters->getValues($ola);
        }

        // Add ticket's request type
        if ($requesttype = RequestType::getById($fields['requesttypes_id'])) {
            $requesttype_parameters = new RequestTypeParameters();
            $values['requesttype'] = $requesttype_parameters->getValues($requesttype);
        }

        // Add location
        if ($location = Location::getById($fields['locations_id'])) {
            $location_parameters = new LocationParameters();
            $values['location'] = $location_parameters->getValues($location);
        }

        // Add KBs
        $kbis = KnowbaseItem_Item::getItems($ticket);
        $values['knowbaseitems'] = [];
        foreach ($kbis as $data) {
            if ($kbi = KnowbaseItem::getById($data[KnowbaseItem::getForeignKeyField()])) {
                $kbi_parameters = new KnowbaseItemParameters();
                $values['knowbaseitems'][] = $kbi_parameters->getValues($kbi);
            }
        }

        // Add assets
        $values['assets'] = [];
        $items_ticket = Item_Ticket::getItemsAssociatedTo($ticket::getType(), $fields['id']);
        foreach ($items_ticket as $item_ticket) {
            $itemtype = $item_ticket->fields['itemtype'];
            if (!in_array($itemtype, $CFG_GLPI["asset_types"])) {
                continue;
            }
            if (!class_exists($itemtype)) {
                trigger_error(sprintf('No class found for type %s', $itemtype), E_USER_WARNING);
                // May happen if the itemtype belongs to a plugin and this plugin is inactive
                continue;
            }
            if ($item = $itemtype::getById($item_ticket->fields['items_id'])) {
                $asset_parameters = new AssetParameters();
                $values['assets'][] = $asset_parameters->getValues($item);
            }
        }

        return $values;
    }
}
