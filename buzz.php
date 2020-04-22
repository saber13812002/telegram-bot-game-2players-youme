<?php

require '../Telegram.php';

require  'db.php';
$sql = new DB();

$bot_token = '1180039785:----------------------------------';
$telegram = new Telegram($bot_token);

$query = "SELECT chat_id,chat_username, MAX(timestamp)
FROM `log`
GROUP BY chat_id
ORDER BY MAX(timestamp) DESC";

$sql->query($query);


while ($r = mysqli_fetch_assoc($sql->get_result())) {
    // Do something with $value.
    echo $r["chat_id"] . " - " . $r["MAX(timestamp)"] . " - " . $r["chat_username"] . '
' . "\n\r";

    //sendMsg($telegram,"/start",$bot_token,$r["chat_id"]);
}



function sendMsg($telegram, $message, $bot_token, $chat_id_)
{
    $content = array('chat_id' => $chat_id_, 'text' => $message);
    $telegram->sendMessage($content);
    return true;
}
//echo 1;
