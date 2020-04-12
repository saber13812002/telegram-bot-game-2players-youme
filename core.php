<?php
class CORE
{
    private $connection;
    private $result;
    function init($telegram, $sql, $bot_token)
    {
        $this->connection = 1;
        $this->result = 1;
        $botname = 'botHamsaran';

        $text = $telegram->Text();
        $chat_id = $telegram->ChatID();
        $chat_username = $telegram->Username();
        $chat_firstname = $telegram->FirstName();
        $chat_lastname = $telegram->LastName();
        $FromChatID = $telegram->FromChatID();
        $messageFromGroup = $telegram->messageFromGroup();
        $FromID = $telegram->FromID();
        $UpdateID = $telegram->UpdateID();

        $query_insert_log = "INSERT INTO `log` (`message_id`, `from_id`, `from_first_name`, `from_last_name`, `from_username`, `from_language_code`, `chat_id`, `chat_first_name`, `chat_last_name`, `chat_username`, `chat_type`, `date`, `text`, `botname`) VALUES ('$UpdateID', '$FromID', '$FromChatID', '', '', '', '$chat_id', '$chat_firstname', '$chat_lastname', '$chat_username', 'botProfile', '', '$text', '$botname');";
        $sql->query($query_insert_log);

        //$this->sendMsg($telegram, "salam", $bot_token, $chat_id);



        $cmd = substr($text, 0, 6);
        if ($text == '/start') {
            $reply = 'https://t.me/hamsaraanbot?start=' . $chat_id;
            $this->sendMsg($telegram, "لینک دعوت زیر رو بفرستید برای همسرتون و ازش بخواهید روبات استارت کنه و برگردید روبات بازی رو شروع کنید  : " . $reply, $bot_token, $chat_id);
            $this->invite($telegram, $sql, $bot_token);
        } else if ($cmd == '/start') {
            $r = substr($text, 7, strlen($text));
            if ($r == $chat_id) { //start bot without link
                $rrr = '#خودش #معرفی کرد #خودش را';
                $this->sendMsg($telegram, $rrr, $bot_token, $chat_id);
                $rp = 'شما توسط خودتون دعوت شدید. خب چرا؟ بفرست برای دوستت عزیزم که هم شما و هم ایشون امتیاز بگیرید';
                $this->sendMsg($telegram, $rp, $bot_token, $chat_id);
            } else { //start invitation
                $this->is_invited_before($telegram, $sql, $bot_token, $r);
                $new = 1;
                $this->setState($telegram, $sql, $r, $chat_id, $new);
                $this->question($telegram, $sql, $bot_token, $r);
            }
        } else {
            if ($text == 'من' || $text == 'او') {
                //get partnerid with States
                $q = "select * from states where chat_id = '$chat_id' order by id desc Limit 1 ";
                $sql->query($q);
                $row = mysqli_fetch_assoc($sql->get_result());
                $partner_id = $row['partner_id'];
                //partner_id
                //setAnswer
                $q = "select * from partner where id = '$partner_id' order by id desc Limit 1 ";
                $sql->query($q);
                $row = mysqli_fetch_assoc($sql->get_result());
                $step = $row['step'];
                $partner_chat_id = $row['chat_id_2'];
                $aya_man_2_hastam = false;
                if ($row['chat_id_2'] == $telegram->ChatID()) {
                    $partner_chat_id = $row['chat_id_1'];
                    $aya_man_2_hastam = true;
                }
                //$this->sendMsg($telegram, " partner_id: " . $partner_id . " step: " . $step, $bot_token, $chat_id);
                //if answered
                $qq = "select * from answers where partner_id = '$partner_id' and question_id = '$step' ;";
                $sql->query($qq);
                $number_of_rows = $sql->get_num_rows();
                //$this->sendMsg($telegram, "ans: " . $number_of_rows, $bot_token, $chat_id);

                $text = ($text == 'من' ? 0 : 1);
                //$this->sendMsg($telegram, "text: " . $text, $bot_token, $chat_id);

                if ($number_of_rows == 0) {
                    if ($aya_man_2_hastam)
                        $query_insert_log = "INSERT INTO `answers` (`partner_id`, `question_id` ,`chat_id_1`, `chat_id_2` , `answer_2`) VALUES ('$partner_id' , '$step', '$partner_chat_id', '$chat_id', '$text');";
                    else
                        $query_insert_log = "INSERT INTO `answers` (`partner_id`, `question_id` ,`chat_id_1`, `chat_id_2` , `answer_1`) VALUES ('$partner_id' , '$step', '$chat_id', '$partner_chat_id', '$text');";

                    $sql->query($query_insert_log);
                } else {
                    if ($aya_man_2_hastam)
                        $query = "UPDATE `answers` SET `answer_2` = '$text' WHERE partner_id = '$partner_id' and question_id = '$step'";
                    else
                        $query = "UPDATE `answers` SET `answer_1` = '$text' WHERE partner_id = '$partner_id' and question_id = '$step'";
                    $sql->query($query);
                }

                //$this->sendMsg($telegram, "aya man 2 hastam :" . $aya_man_2_hastam, $bot_token, $chat_id);

                if ($aya_man_2_hastam)
                    $qq = "select * from answers where partner_id = '$partner_id' and question_id = '$step' and answer_1 >= 0 ;";
                else
                    $qq = "select * from answers where partner_id = '$partner_id' and question_id = '$step' and answer_2 >= 0 ;";
                $sql->query($qq);
                $number_of_rows = $sql->get_num_rows();
                if ($number_of_rows == 1) {
                    $q = $this->question($telegram, $sql, $bot_token, null);

                    $w = $this->getTodaysCountLog();

                    if (!$q) {
                        $this->sendMsg($telegram, " دیگه سوال نداریم. لطفا لینک زیر رو برای دوستاتون بفرستید بازی کنن ", $bot_token, $chat_id);
                        $this->sendMsg($telegram, " روبات بازی سوال و جواب همسران رو دیدم خوشم اومد شما هم روی این لینک کلیک کنید t.me/hamsaraanbot ", $bot_token, $chat_id);
                    }
                } else {
                    // $this->sendMsg($telegram, $number_of_rows . " else  " . $reply, $bot_token, $chat_id);
                    $this->sendMsg($telegram, " باید یار شما هم جواب بده " . $reply, $bot_token, $chat_id);
                }
            }
        }
    }

    function getTodaysCountLog()
    {
        $count = 10;
        //SELECT count(*) FROM `log` where chat_id = 92848616 and timestamp >= DATE_SUB(CURDATE(),INTERVAL 1 DAY) and ( text ='من' or text ='او' ) ORDER BY `log`.`id` desc
        if ($count % 10 == 0)
            return true;
        else
            return false;
    }

    function is_invited_before($telegram, $sql, $bot_token, $r)
    {
        $chat_id = $telegram->ChatID();

        if (!$this->has_partner_when_invite($telegram, $sql, $r)) {
            $query_insert_log = "INSERT INTO `partner` (`chat_id_1`, `chat_id_2`, `step`) VALUES ('$r', '$chat_id', 1);";
            $sql->query($query_insert_log);

            $rp = "همسر شما دعوت شما رو قبول کرد. میتونید بازی رو شروع کنید" . $telegram->FirstName();
            $this->sendMsg($telegram, $rp, $bot_token, $r);
            $rp = "شما توسط همسرتون به این روبات دعوت شدید";
            $this->sendMsg($telegram, $rp, $bot_token, $chat_id);
        } else {

            $rp = "شما دفعه ی چندم هستش که دعوت میشید توسط همسرتون " . $telegram->FirstName();
            $this->sendMsg($telegram, $rp, $bot_token, $r);
            $rp = "شما مجددا توسط همسرتون به این روبات دعوت شدید";
            $this->sendMsg($telegram, $rp, $bot_token, $chat_id);
        }
    }

    function setState($telegram, $sql, $r, $chat_id, $new)
    {
        if ($new == 1) {
            $chat_id = $telegram->ChatID();
            $query_next_question = "select * from partner where chat_id_1 = '$r' and chat_id_2 = '$chat_id'  ";
            $sql->query($query_next_question);

            $row = mysqli_fetch_assoc($sql->get_result());
            $partner_id = $row['id'];
        } else
            $partner_id = $this->getPartnerIdFromState($telegram, $sql);


        $query = "INSERT INTO `states` (`chat_id`, `partner_id`) VALUES ('$r', '$partner_id');";
        $sql->query($query);
        $query = "INSERT INTO `states` (`chat_id`, `partner_id`) VALUES ('$chat_id', '$partner_id');";
        $sql->query($query);
    }

    function has_partner_when_invite($telegram, $sql, $r)
    {
        $chat_id = $telegram->ChatID();
        $query_next_question = "select * from partner where chat_id_1 = '$r' and chat_id_2 = '$chat_id'  ";
        $sql->query($query_next_question);

        if ($sql->get_num_rows() == 0) {
            return false;
        } else {
            return true;
        }
    }

    function question($telegram, $sql, $bot_token, $r)
    {
        $chat_id = $telegram->ChatID();
        if ($r == null)
            $partner_id = $this->getPartnerIdFromState($telegram, $sql);
        else
            $partner_id = $r;

        $question = $this->getNextQuestion($telegram, $sql, $bot_token, $partner_id);

        if ($question) {
            // $rp = "partner_id :".$partner_id;
            // $this->sendMsg($telegram, $rp, $bot_token, $chat_id);

            $q = "select * from partner where id = '$partner_id' order by id desc Limit 1 ";
            $sql->query($q);
            $row = mysqli_fetch_assoc($sql->get_result());
            $step = $row['step'];
            $partner_chat_id = $row['chat_id_2'];

            if ($row['chat_id_2'] == $telegram->ChatID()) {
                $partner_chat_id = $row['chat_id_1'];
            }
            // $rp = "partner_chat_id :".$partner_chat_id;
            // $this->sendMsg($telegram, $rp, $bot_token, $chat_id);

            //1
            $this->sendMsg($telegram, $question, $bot_token, $chat_id);
            $this->keyboard($telegram, $sql, $bot_token, $chat_id);
            //2
            $this->sendMsg($telegram, $question, $bot_token, $partner_chat_id);
            $this->keyboard($telegram, $sql, $bot_token, $partner_chat_id);
            return true;
        } else
            return false;
    }

    function invite($telegram, $sql, $bot_token)
    {
        return true;
    }

    function keyboard($telegram, $sql, $bot_token, $chat_id)
    {
        $option = [
            ['من', 'او']
        ];

        $keyb = $telegram->buildKeyBoard($option);
        $content = ['chat_id' => $chat_id, 'reply_markup' => $keyb, 'text' => 'کدومتون بیشتر؟'];
        $telegram->sendMessage($content);
        return true;
    }

    function getPartnerIdFromState($telegram, $sql)
    {
        $chat_id = $telegram->ChatID();
        $query_next_question = "select * from states where chat_id = '$chat_id' order by created desc Limit 1 ";
        $sql->query($query_next_question);

        $row = mysqli_fetch_assoc($sql->get_result());
        return $row['partner_id'];
    }

    function getNextQuestion($telegram, $sql, $bot_token, $partner_id)
    {
        $step = $this->getStep($telegram, $sql, $bot_token, $partner_id);
        $row = $this->getQuestion($telegram, $sql, $bot_token, $step);
        $q = $row['q'];
        $question_id = $row['id'];
        if ($question_id > $step) {
            $this->setStep($telegram, $sql, $bot_token, $question_id, $partner_id);
            return $q;
        } else return false;
    }

    function setStep($telegram, $sql, $bot_token, $question_id, $partner_id)
    {
        $query = "UPDATE partner SET step = '$question_id' WHERE id='$partner_id'";
        $sql->query($query);
        return true;
    }

    function getStep($telegram, $sql, $bot_token, $partner_id)
    {
        $query_partner_id = "SELECT * FROM `partner` WHERE id='$partner_id'";
        $sql->query($query_partner_id);
        $row = mysqli_fetch_assoc($sql->get_result());
        $step = $row['step'];
        return $step;
    }

    function getQuestion($telegram, $sql, $bot_token, $step)
    {
        $query_next_question = "select * from questions where id = (select min(id) from questions where id > '$step')";
        $sql->query($query_next_question);
        $row = mysqli_fetch_assoc($sql->get_result());
        return $row;
    }

    function sendMsg($telegram, $message, $bot_token, $chat_id_)
    {
        $content = array('chat_id' => $chat_id_, 'text' => $message);
        $telegram->sendMessage($content);
        return true;
    }
}
