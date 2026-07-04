<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Form\QuestionType;

use Exception;
use Glpi\Form\Question;
use Group;
use Override;
use Profile;
use Session;
use Supplier;
use Ticket;
use User;

final class QuestionTypeAssignee extends AbstractQuestionTypeActors
{
    #[Override]
    public function getName(): string
    {
        return _n('Assignee', 'Assignees', Session::getPluralNumber());
    }

    #[Override]
    public function getIcon(): string
    {
        return 'ti ti-user-check';
    }

    #[Override]
    public function getWeight(): int
    {
        return 30;
    }

    #[Override]
    public function getAllowedActorTypes(): array
    {
        return [User::class, Group::class, Supplier::class];
    }

    #[Override]
    public function getRightForUsers(): string
    {
        return 'own_ticket';
    }

    #[Override]
    public function getGroupConditions(): array
    {
        return ['is_assign' => 1];
    }

    #[Override]
    public function prepareEndUserAnswer(Question $question, mixed $answer): mixed
    {
        $actors = parent::prepareEndUserAnswer($question, $answer);
        foreach ($actors as $actor) {
            if ($actor['itemtype'] === User::class) {
                // Check if the user can be assigned
                if (
                    !Profile::haveUserRight(
                        $actor['items_id'],
                        Ticket::$rightname,
                        Ticket::OWN,
                        $question->getForm()->getEntityID()
                    )
                ) {
                    throw new Exception('Invalid actor: must be able to be assigned');
                }
            } elseif ($actor['itemtype'] === Group::class) {
                // Check if the group can be assigned
                if (Group::getById($actor['items_id'])->fields['is_assign'] !== 1) {
                    throw new Exception('Invalid actor: must be able to be assigned');
                }
            }
        }

        return $actors;
    }
}
