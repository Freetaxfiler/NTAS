<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

namespace Glpi\Controller\UI\Illustration;

use Document;
use Glpi\Controller\AbstractController;
use Glpi\Exception\Http\BadRequestHttpException;
use Glpi\UI\IllustrationManager;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

use function Safe\realpath;

final class UploadController extends AbstractController
{
    public function __construct(
        private IllustrationManager $illustration_manager
    ) {}

    #[Route(
        "/UI/Illustration/Upload",
        name: "ntas_ui_illustration_upload",
        methods: "POST",
    )]
    public function __invoke(Request $request): Response
    {
        // Read parameters
        $file_name = $request->request->getString('filename', "");
        $file_path = realpath(GLPI_TMP_DIR . "/$file_name");

        if (
            empty($file_name)
            || !str_starts_with($file_path, realpath(GLPI_TMP_DIR))
            || !file_exists($file_path)
            || !Document::isImage($file_path)
        ) {
            throw new BadRequestHttpException();
        }

        $this->illustration_manager->saveCustomIllustration($file_name, $file_path);
        return new JsonResponse(['file' => $file_name]);
    }
}
