<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\Doc;

use Attribute;

#[Attribute(Attribute::TARGET_METHOD)]
class CreateRoute extends Route
{
    public function __construct(string $schema_name, ?string $description = null)
    {
        parent::__construct(
            description: $description ?? 'Create a new ' . $schema_name,
            parameters: [
                new Parameter(
                    name: '_',
                    schema: new SchemaReference($schema_name),
                    location: Parameter::LOCATION_BODY,
                ),
            ]
        );
    }
}
