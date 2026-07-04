<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

use Glpi\Event;
use Glpi\Exception\Http\BadRequestHttpException;

$comment = new KnowbaseItem_Comment();
if (!isset($_POST['knowbaseitems_id'])) {
    Session::addMessageAfterRedirect(__s('Mandatory fields are not filled!'), false, ERROR);
    Html::back();
}

if (isset($_POST["add"])) {
    if (!isset($_POST['knowbaseitems_id'], $_POST['comment'])) {
        Session::addMessageAfterRedirect(__s('Mandatory fields are not filled!'), false, ERROR);
        Html::back();
    }

    $comment->check(-1, CREATE, $_POST);
    if ($newid = $comment->add($_POST)) {
        Event::log(
            $_POST["knowbaseitems_id"],
            "knowbaseitem_comment",
            4,
            "tracking",
            sprintf(__('%s adds a comment on knowledge base'), $_SESSION["glpiname"])
        );
        Session::addMessageAfterRedirect(
            "<a href='#kbcomment$newid'>" . __s('Your comment has been added') . "</a>",
            false,
            INFO
        );
    }
    Html::back();
}

if (isset($_POST["edit"])) {
    if (!isset($_POST['knowbaseitems_id']) || !isset($_POST['id']) || !isset($_POST['comment'])) {
        Session::addMessageAfterRedirect(__s('Mandatory fields are not filled!'), false, ERROR);
        Html::back();
    }

    $comment->getFromDB($_POST['id']);
    $comment->check($_POST['id'], UPDATE, $_POST);

    $data = array_merge($comment->fields, $_POST);
    if ($comment->update($data)) {
        Event::log(
            $_POST["knowbaseitems_id"],
            "knowbaseitem_comment",
            4,
            "tracking",
            sprintf(__('%s edit a comment on knowledge base'), $_SESSION["glpiname"])
        );
        Session::addMessageAfterRedirect(
            "<a href='#kbcomment{$comment->getID()}'>" . __s('Your comment has been edited') . "</a>",
            false,
            INFO
        );
    }
    Html::back();
}

throw new BadRequestHttpException();
