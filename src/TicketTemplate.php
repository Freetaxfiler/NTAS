<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\Features\Clonable;

/**
 * Ticket Template class
 *
 * since version 0.83
 **/
class TicketTemplate extends ITILTemplate
{
    /** @use Clonable<static> */
    use Clonable;

    #[Override]
    public static function getPredefinedFields(): ITILTemplatePredefinedField
    {
        return new TicketTemplatePredefinedField();
    }

    public static function getTypeName($nb = 0)
    {
        return _n('Ticket template', 'Ticket templates', $nb);
    }

    public static function getSectorizedDetails(): array
    {
        return ['helpdesk', Ticket::class, self::class];
    }

    public function getCloneRelations(): array
    {
        return [
            TicketTemplateHiddenField::class,
            TicketTemplateMandatoryField::class,
            TicketTemplatePredefinedField::class,
            TicketTemplateReadonlyField::class,
        ];
    }

    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb(
            [
                TicketTemplateHiddenField::class,
                TicketTemplateMandatoryField::class,
                TicketTemplatePredefinedField::class,
            ]
        );
    }

    public static function getExtraAllowedFields($withtypeandcategory = false, $withitemtype = false)
    {
        $itil_object = new Ticket();
        $tab =  [
            $itil_object->getSearchOptionIDByField(
                'field',
                'name',
                'ntas_requesttypes'
            )
                                                       => 'requesttypes_id',
            $itil_object->getSearchOptionIDByField(
                'field',
                'slas_id_tto',
                'ntas_slas'
            )      => 'slas_id_tto',
            $itil_object->getSearchOptionIDByField(
                'field',
                'slas_id_ttr',
                'ntas_slas'
            )      => 'slas_id_ttr',
            $itil_object->getSearchOptionIDByField(
                'field',
                'olas_id_tto',
                'ntas_olas'
            )      => 'olas_id_tto',
            $itil_object->getSearchOptionIDByField(
                'field',
                'olas_id_ttr',
                'ntas_olas'
            )      => 'olas_id_ttr',
            $itil_object->getSearchOptionIDByField(
                'field',
                'time_to_own',
                'ntas_tickets'
            )   => 'time_to_own',
            $itil_object->getSearchOptionIDByField(
                'field',
                'internal_time_to_resolve',
                'ntas_tickets'
            )   => 'internal_time_to_resolve',
            $itil_object->getSearchOptionIDByField(
                'field',
                'internal_time_to_own',
                'ntas_tickets'
            )   => 'internal_time_to_own',
            $itil_object->getSearchOptionIDByField(
                'field',
                'global_validation',
                'ntas_tickets'
            )   => 'global_validation',
            $itil_object->getSearchOptionIDByField(
                'field',
                'name',
                'ntas_contracts'
            )   => '_contracts_id',
            $itil_object->getSearchOptionIDByField(
                'field',
                'type',
                'ntas_tickets'
            )   => 'type',
            $itil_object->getSearchOptionIDByField(
                'field',
                'externalid',
                'ntas_tickets'
            )   => 'externalid',
        ];

        if ($withtypeandcategory) {
            $tab[$itil_object->getSearchOptionIDByField(
                'field',
                'type',
                $itil_object->getTable()
            )]         = 'type';
        }

        return $tab;
    }
}
