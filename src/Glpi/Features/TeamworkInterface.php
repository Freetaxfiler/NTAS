<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Features;

use CommonDBTM;

interface TeamworkInterface
{
    /**
     * Get an array of all possible roles
     * @return array
     */
    public static function getTeamRoles(): array;

    /**
     * Get the localized name for a team role
     * @param int $role
     * @param int $nb
     * @return string
     */
    public static function getTeamRoleName(int $role, int $nb = 1): string;

    /**
     * Get all types of team members that are supported by this item type
     * @return array
     */
    public static function getTeamItemtypes(): array;

    /**
     * Add a team member to this item
     * @param string $itemtype
     * @param int $items_id
     * @param array $params
     * @return bool
     */
    public function addTeamMember(string $itemtype, int $items_id, array $params = []): bool;

    /**
     * Remove a team member to this item
     * @param string $itemtype
     * @param int $items_id
     * @param array $params
     * @return bool
     */
    public function deleteTeamMember(string $itemtype, int $items_id, array $params = []): bool;

    /**
     * Get all team members
     * @return array
     */
    public function getTeam(): array;

    public static function getTeamMemberForm(CommonDBTM $item): string;
}
