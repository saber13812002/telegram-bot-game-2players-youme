<?php
include 'Telegram.php';

require_once __DIR__ . '/db.php';
$sql = new DB ();

require_once __DIR__ . '/core.php';
$core = new CORE ();

$bot_token = '1180039785:dsfgsdfgsdfgsdfg';
$telegram = new Telegram($bot_token);

$botname='botHamsaran';

$core->init($telegram,$sql,$bot_token);


?>