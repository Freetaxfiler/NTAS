<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Api\HL\GraphQL;

use Glpi\Api\HL\OpenAPIGenerator;
use Glpi\Debug\Profiler;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Schema;

final readonly class SchemaGenerator
{
    public function __construct(
        private string $api_version
    ) {}

    public function getSchema(): Schema
    {
        $query_type_config = [
            'name' => 'Query',
            'fields' => [],
        ];
        Profiler::getInstance()->start('OpenAPI Component Schemas Retrieval', Profiler::CATEGORY_HLAPI);
        $component_schemas = OpenAPIGenerator::getComponentSchemas($this->api_version);
        Profiler::getInstance()->stop('OpenAPI Component Schemas Retrieval');
        foreach (array_keys($component_schemas) as $schema_name) {
            $query_type_config['fields'][$schema_name] = [
                'type' => Type::listOf(fn(): Type => Types::load($schema_name, $this->api_version)),
                'args' => [
                    'id' => ['type' => Type::int()],
                    'filter' => ['type' => Type::string()],
                    'start' => ['type' => Type::int()],
                    'limit' => ['type' => Type::int()],
                    'sort' => ['type' => Type::string()],
                    'order' => ['type' => Type::string()],
                ],
            ];
        }
        return new Schema([
            'query' => new ObjectType($query_type_config),
        ]);
    }
}
