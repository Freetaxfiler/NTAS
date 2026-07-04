<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination;

use CommonDBRelation;
use Glpi\Form\AnswersSet;

final class AnswersSet_FormDestinationItem extends CommonDBRelation
{
    /**
     * Item 1 is an AnswersSet object
     */
    public static $itemtype_1 = AnswersSet::class;
    public static $items_id_1 = 'forms_answerssets_id';

    /**
     * Item 2 is any common DBTM item
     */
    public static $itemtype_2 = 'itemtype';
    public static $items_id_2 = 'items_id';
}
