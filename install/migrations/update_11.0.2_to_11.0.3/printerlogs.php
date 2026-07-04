<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * @var DBmysql $DB
 */

//Fix possible duplicates, see https://github.com/glpi-project/glpi/issues/22235
$DB->doQuery(
    "
  DELETE FROM ntas_printerlogs WHERE id IN (
    SELECT id FROM (
      SELECT a.id FROM ntas_printerlogs AS a
      JOIN(
          SELECT items_id, date
          FROM ntas_printerlogs
          GROUP BY items_id, date
          HAVING COUNT(items_id) > 1
      ) AS b
      WHERE a.items_id = b.items_id AND a.date = b.date AND a.itemtype = ''
    ) AS temp
  )"
);

//add missing itemtype
$DB->update('ntas_printerlogs', ['itemtype' => 'Printer'], ['itemtype' => '']);
