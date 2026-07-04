<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\Destination\CommonITILField;

use Glpi\Form\Form;
use Glpi\Form\QuestionType\QuestionTypeEmail;
use Glpi\Form\QuestionType\QuestionTypeRequester;
use Group;
use Override;
use Session;
use User;

final class RequesterField extends ITILActorField
{
    #[Override]
    public function getAllowedQuestionType(): array
    {
        return [new QuestionTypeRequester(), new QuestionTypeEmail()];
    }

    #[Override]
    public function getAllowedQuestionItemTypes(): array
    {
        return [User::class, Group::class];
    }

    #[Override]
    public function getActorType(): string
    {
        return 'requester';
    }

    #[Override]
    public function getLabel(): string
    {
        return _n('Requester', 'Requesters', Session::getPluralNumber());
    }

    #[Override]
    public function getConfigClass(): string
    {
        return RequesterFieldConfig::class;
    }

    #[Override]
    public function getDefaultConfig(Form $form): RequesterFieldConfig
    {
        return new RequesterFieldConfig(
            [ITILActorFieldStrategy::FORM_FILLER],
        );
    }

    #[Override]
    public function getWeight(): int
    {
        return 100;
    }
}
