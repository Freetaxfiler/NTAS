<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\Form;

use Glpi\Altcha\AltchaManager;
use Glpi\Controller\AbstractController;
use Glpi\Controller\Form\Utils\CanCheckAccessPolicies;
use Glpi\Exception\Http\BadRequestHttpException;
use Glpi\Exception\Http\NotFoundHttpException;
use Glpi\Form\AnswersHandler\AnswersHandler;
use Glpi\Form\AnswersSet;
use Glpi\Form\DelegationData;
use Glpi\Form\EndUserInputNameProvider;
use Glpi\Form\Form;
use Glpi\Http\Firewall;
use Glpi\Security\Attribute\SecurityStrategy;
use Psr\Log\LoggerInterface;
use Session;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SubmitAnswerController extends AbstractController
{
    use CanCheckAccessPolicies;

    public function __construct(private LoggerInterface $logger) {}

    #[SecurityStrategy(Firewall::STRATEGY_NO_CHECK)] // Some forms can be accessed anonymously
    #[Route(
        "/Form/SubmitAnswers",
        name: "ntas_form_submit_answers",
        methods: "POST"
    )]
    public function __invoke(Request $request): Response
    {
        $is_unauthenticated_user = !Session::isAuthenticated();
        if ($is_unauthenticated_user) {
            $altcha = $request->request->getString('altcha');
            if (!AltchaManager::getInstance()->verifySolution($altcha)) {
                throw new BadRequestHttpException();
            }
        }

        $form = $this->loadSubmittedForm($request);
        $this->checkFormAccessPolicies($form, $request);

        try {
            $answers = $this->saveSubmittedAnswers($form, $request);
            $links = $answers->getLinksToCreatedItems();

            if ($is_unauthenticated_user) {
                AltchaManager::getInstance()->removeChallenge($altcha);
            }

            return new JsonResponse([
                'links_to_created_items' => $links,
            ]);
        } catch (\Throwable $th) {
            $this->logger->error(
                sprintf(
                    'An error occured during the form `%s` submission: %s',
                    $form->getName(),
                    $th->getMessage(),
                ),
                ['exception' => $th]
            );

            $messages = [];
            if (isset($_SESSION['MESSAGE_AFTER_REDIRECT'][ERROR])) {
                $messages = $_SESSION['MESSAGE_AFTER_REDIRECT'][ERROR];
                unset($_SESSION['MESSAGE_AFTER_REDIRECT'][ERROR]);
            }

            return new JsonResponse([
                'errors' => $messages,
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    private function loadSubmittedForm(Request $request): Form
    {
        $forms_id = $request->request->getInt("forms_id");
        if (!$forms_id) {
            throw new BadRequestHttpException();
        }

        $form = Form::getById($forms_id);
        if (!$form instanceof Form) {
            throw new NotFoundHttpException();
        }

        return $form;
    }

    private function saveSubmittedAnswers(
        Form $form,
        Request $request
    ): AnswersSet {
        $post = $request->request->all();
        $provider = new EndUserInputNameProvider();

        $delegation = new DelegationData(
            $request->request->getInt('delegation_users_id', 0) ?: null,
            $request->request->getBoolean('delegation_use_notification', false) ?: null,
            $request->request->getString('delegation_alternative_email', '') ?: null
        );
        $answers    = $provider->getAnswers($post);
        $files      = $provider->getFiles($post, $answers);
        if ($answers === []) {
            throw new BadRequestHttpException();
        }

        $handler = AnswersHandler::getInstance();

        // Check if answers are valid
        if (!$handler->validateAnswers($form, $answers)->isValid()) {
            throw new BadRequestHttpException();
        }

        $answers = $handler->removeUnusedAnswers($form, $answers);
        $answers = $handler->saveAnswers(
            $form,
            $answers,
            Session::getLoginUserID(),
            $files,
            $delegation
        );

        return $answers;
    }
}
