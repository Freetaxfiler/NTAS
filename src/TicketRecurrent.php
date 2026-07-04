<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Ticket Recurrent class
 *
 * @since 0.83
 **/
class TicketRecurrent extends CommonITILRecurrent
{
    /**
     * @var string Right managements
     */
    public static $rightname = 'ticketrecurrent';

    public static function getTypeName($nb = 0)
    {
        return __('Recurrent tickets');
    }

    public static function getSectorizedDetails(): array
    {
        return ['helpdesk', self::class];
    }

    public static function getConcreteClass()
    {
        return Ticket::class;
    }

    public static function getTemplateClass()
    {
        return TicketTemplate::class;
    }

    public static function getPredefinedFieldsClass()
    {
        return TicketTemplatePredefinedField::class;
    }

    public function handlePredefinedFields(
        array $predefined,
        array $input
    ): array {
        $input = parent::handlePredefinedFields($predefined, $input);

        // Compute internal_time_to_resolve if predefined based on create date
        if (isset($predefined['internal_time_to_resolve'])) {
            $input['internal_time_to_resolve'] = Html::computeGenericDateTimeSearch(
                $predefined['internal_time_to_resolve'],
                false,
                $this->getCreateTime()
            );
        }

        return $input;
    }


    public function defineTabs($options = [])
    {
        $ong = parent::defineTabs($options);
        $this->addStandardTab(Item_TicketRecurrent::class, $ong, $options);
        return $ong;
    }

    public static function getItemLinkClass(): ?string
    {
        return Item_TicketRecurrent::class;
    }

    public function getAdditionalFields()
    {
        $tab = parent::getAdditionalFields();
        $tab[] = [
            'name'  => 'ticket_per_item',
            'label' => __('Create a ticket per linked element'),
            'type'  => 'bool',
            'list'  => false,
        ];
        return $tab;
    }


    public function cleanDBonPurge()
    {
        $this->deleteChildrenAndRelationsFromDb(
            [
                Item_TicketRecurrent::class,
            ]
        );

        parent::cleanDBonPurge();
    }
}
