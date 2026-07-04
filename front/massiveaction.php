<?php

/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

require_once(__DIR__ . '/_check_webserver_config.php');

global $CFG_GLPI;

header("Content-Type: text/html; charset=UTF-8");
Html::header_nocache();

try {
    $ma = new MassiveAction($_POST, $_GET, 'process');
} catch (Throwable $e) {
    Html::popHeader(__('Bulk modification error'));

    echo "<div class='center'><img src='" . $CFG_GLPI["root_doc"] . "/pics/warning.png' alt='"
      . __s('Warning') . "'><br><br>";
    echo "<span class='b'>" . htmlescape($e->getMessage()) . "</span><br>";
    Html::displayBackLink();
    echo "</div>";

    Html::popFooter();
    return;
}
Html::includeHeader(__('Bulk modification'));
echo '<body><div id="page">';
$ma->displayProgressBar();
echo '</div></body></html>';
flush(); // force displaying the output

$results   = $ma->process();

$nbok       = $results['ok'];
$nbnoaction = $results['noaction'];
$nbko       = $results['ko'];
$nbnoright  = $results['noright'];

$msg_type = INFO;
if ($nbnoaction > 0 && $nbok === 0 && $nbko === 0 && $nbnoright === 0) {
    $message = __s('Operation was done but no action was required');
} elseif ($nbok == 0) {
    $message = __s('Failed operation');
    $msg_type = ERROR;
} elseif ($nbnoright || $nbko) {
    $message = __s('Operation performed partially successful');
    $msg_type = WARNING;
} else {
    $message = __s('Operation successful');
    if ($nbnoaction > 0) {
        $message .= "<br>" . htmlescape(sprintf(__('(%1$d items required no action)'), $nbnoaction));
    }
}
if ($nbnoright || $nbko) {
    //TRANS: %$1d and %$2d are numbers
    $message .= "<br>" . htmlescape(sprintf(
        __('(%1$d authorizations problems, %2$d failures)'),
        $nbnoright,
        $nbko
    ));
}
Session::addMessageAfterRedirect($message, false, $msg_type);
if (isset($results['messages']) && is_array($results['messages']) && count($results['messages'])) {
    foreach ($results['messages'] as $message) {
        Session::addMessageAfterRedirect($message, false, ERROR);
    }
}
Html::redirect($results['redirect']);
