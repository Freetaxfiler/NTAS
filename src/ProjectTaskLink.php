<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Represents a dependency relation between project tasks
 * Possible link types are "finish_to_start":"0", "start_to_start":"1", "finish_to_finish":"2", "start_to_finish":"3"
 *
 * @since 9.5.4
 *
 */
class ProjectTaskLink extends CommonDBRelation
{
    // From CommonDBRelation
    public static $itemtype_1 = ProjectTask::class;
    public static $items_id_1 = 'projecttasks_id_source';

    public static $itemtype_2 = ProjectTask::class;
    public static $items_id_2 = 'projecttasks_id_target';

    /**
     * @param string $projecttaskIds Comma-separated list of project task IDs
     * @return DBmysqlIterator
     * @used-by gantt plugin
     */
    public function getFromDBForItemIDs($projecttaskIds)
    {
        global $DB;

        $iterator = $DB->request([
            'SELECT' => ['ntas_projecttasklinks.*'],
            'FROM' => 'ntas_projecttasklinks',
            'WHERE' => "projecttasks_id_source IN (" . $projecttaskIds . ") AND projecttasks_id_target IN (" . $projecttaskIds . ")",
        ]);

        return $iterator;
    }

    /**
     * @param array{projecttasks_id_source: int, projecttasks_id_target: int, type: int} $taskLink
     * @return bool
     */
    public function checkIfExist($taskLink)
    {
        global $DB;
        $iterator = $DB->request([
            'SELECT' => 'id',
            'FROM' => self::getTable(),
            'WHERE' => [
                'AND' => ['projecttasks_id_source' => $taskLink['projecttasks_id_source'],
                ],
                ['projecttasks_id_target' => $taskLink['projecttasks_id_target']],
                ['type' => $taskLink['type']],
            ],
        ]);
        return count($iterator) > 0;
    }
}
