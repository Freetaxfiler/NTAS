<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\ContentTemplates\Parameters;

use CommonDBTM;
use Entity;
use Glpi\ContentTemplates\Parameters\ParametersTypes\AttributeParameter;
use Glpi\ContentTemplates\Parameters\ParametersTypes\ObjectParameter;

/**
 * Parameters for "Assets" items (Computer, Monitor, ...).
 *
 * @since 10.0.0
 */
class AssetParameters extends AbstractParameters
{
    public static function getDefaultNodeName(): string
    {
        return 'asset';
    }

    public static function getObjectLabel(): string
    {
        return _n('Asset', 'Assets', 1);
    }

    protected function getTargetClasses(): array
    {
        global $CFG_GLPI;
        return $CFG_GLPI["asset_types"];
    }

    public function getAvailableParameters(): array
    {
        return [
            new AttributeParameter("id", __('ID')),
            new AttributeParameter("name", __('Name')),
            new AttributeParameter("itemtype", __('Itemtype')),
            new AttributeParameter("serial", __('Serial number')),
            new AttributeParameter("comment", __('Comments')),
            new ObjectParameter(new EntityParameters()),
        ];
    }

    protected function defineValues(CommonDBTM $asset): array
    {
        $fields = $asset->fields;

        $values = [
            'id'       => $fields['id'],
            'name'     => $fields['name'],
            'itemtype' => $asset->getType(),
            'serial'   => $fields['serial'],
            'comment'  => $fields['comment'],
        ];

        // Add asset's entity
        if ($entity = Entity::getById($fields['entities_id'])) {
            $entity_parameters = new EntityParameters();
            $values['entity'] = $entity_parameters->getValues($entity);
        }

        return $values;
    }
}
