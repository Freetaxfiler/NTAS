<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

use Glpi\DBAL\QueryExpression;
use Glpi\Search\Provider\SQLProvider;

/// Class Ticket links
class Ticket_Ticket extends CommonITILObject_CommonITILObject
{
    // From CommonDBRelation
    public static $itemtype_1 = Ticket::class;
    public static $items_id_1     = 'tickets_id_1';
    public static $itemtype_2 = Ticket::class;
    public static $items_id_2     = 'tickets_id_2';

    public static $check_entity_coherency = false;

    public static function getTypeName($nb = 0)
    {
        return _n('Linked ticket', 'Linked tickets', $nb);
    }

    public static function showMassiveActionsSubForm(MassiveAction $ma)
    {

        switch ($ma->getAction()) {
            case 'add':
                Toolbox::deprecated('Ticket_Ticket "add" massive action is deprecated. Use CommonITILObject_CommonITILObject "add" massive action.');
                Ticket_Ticket::dropdownLinks('link');
                echo htmlescape(sprintf(__('%1$s: %2$s'), Ticket::getTypeName(1), __('ID')));
                echo "&nbsp;<input type='text' name='tickets_id_1' value='' size='10'>\n";
                echo "<br><br>";
                echo "<br><br><input type='submit' name='massiveaction' class='btn btn-primary' value='"
                           . _sx('button', 'Post') . "'>";
                return true;
        }
        return parent::showMassiveActionsSubForm($ma);
    }

    public static function processMassiveActionsForOneItemtype(
        MassiveAction $ma,
        CommonDBTM $item,
        array $ids
    ) {

        switch ($ma->getAction()) {
            case 'add':
                Toolbox::deprecated('Ticket_Ticket "add" massive action is deprecated. Use CommonITILObject_CommonITILObject "add" massive action.');
                $input = $ma->getInput();
                $ticket = new Ticket();
                if (
                    isset($input['link'])
                    && isset($input['tickets_id_1'])
                ) {
                    if ($item->getFromDB($input['tickets_id_1'])) {
                        foreach ($ids as $id) {
                            $input2                          = [];
                            $input2['id']                    = $input['tickets_id_1'];
                            $input2['_link']['tickets_id_1'] = $id;
                            $input2['_link']['link']         = $input['link'];
                            $input2['_link']['tickets_id_2'] = $input['tickets_id_1'];
                            if ($item->can($input['tickets_id_1'], UPDATE)) {
                                if ($ticket->update($input2)) {
                                    $ma->itemDone($item->getType(), $id, MassiveAction::ACTION_OK);
                                } else {
                                    $ma->itemDone($item->getType(), $id, MassiveAction::ACTION_KO);
                                    $ma->addMessage($item->getErrorMessage(ERROR_ON_ACTION));
                                }
                            } else {
                                $ma->itemDone($item->getType(), $id, MassiveAction::ACTION_NORIGHT);
                                $ma->addMessage($item->getErrorMessage(ERROR_RIGHT));
                            }
                        }
                    }
                }
                return;
        }
        parent::processMassiveActionsForOneItemtype($ma, $item, $ids);
    }


    /**
     * Get linked tickets to a ticket
     *
     * @param int $ID ID of the ticket id
     * @param bool $check_view_rights check view rights
     *
     * @return array of linked tickets  array(id=>linktype)
     * @deprecated 11.0.0 Use CommonITILObject_CommonITILObject::getLinkedTo()
     **/
    public static function getLinkedTicketsTo($ID, bool $check_view_rights = false)
    {
        Toolbox::deprecated('Use "Ticket_Ticket::getLinkedTo()"');

        global $DB;

        // Make new database object and fill variables
        if (empty($ID)) {
            return [];
        }

        $table = self::getTable();
        $criteria = [
            'SELECT' => ["{$table}.*"],
            'FROM'   => $table,
            'WHERE'  => [
                'OR'  => [
                    'tickets_id_1' => $ID,
                    'tickets_id_2' => $ID,
                ],
            ],
        ];
        if ($check_view_rights && !Session::haveRight(Ticket::$rightname, Ticket::READALL)) {
            $ticket_table = Ticket::getTable();
            $criteria['LEFT JOIN'] = [
                $ticket_table => [
                    'ON' => new QueryExpression("{$ticket_table}.id=(CASE WHEN {$table}.tickets_id_1={$ID} THEN {$table}.tickets_id_2 ELSE {$table}.tickets_id_1 END)"),
                ],
            ];
            $unused_ref = [];
            $default_join = SQLProvider::getDefaultJoinCriteria(Ticket::class, Ticket::getTable(), $unused_ref);
            if ($default_join !== []) {
                $criteria = array_merge_recursive($criteria, $default_join);
            }
            $criteria['WHERE'][] = SQLProvider::getDefaultWhereCriteria(Ticket::class);
        }
        $iterator = $DB->request($criteria);
        $tickets = [];

        foreach ($iterator as $data) {
            if ($data['tickets_id_1'] != $ID) {
                $tickets[$data['id']] = [
                    'link'         => $data['link'],
                    'tickets_id_1' => $data['tickets_id_1'],
                    'tickets_id'   => $data['tickets_id_1'],
                ];
            } else {
                $tickets[$data['id']] = [
                    'link'       => $data['link'],
                    'tickets_id' => $data['tickets_id_2'],
                ];
            }
        }

        ksort($tickets);
        return $tickets;
    }
}
