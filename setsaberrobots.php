<?php

if (isset ( $_REQUEST ['botname'] )) 
	$botname = $_REQUEST ['botname'];
	
//https://asdfsadf.ir/bball/bots/set.php?token=asdfasfd&botname=botProfile
	
if (isset ( $_REQUEST ['token'] ))	
if ( $_REQUEST ['token'] == 'asdfasfd' ){
	
    $url='';
    
    if ($botname=='botHamsaran')
        $bottoken='1180039785:dfgsdfgasdfasdfasdfasdfasdfsdfg';
        
        
    
    $url = "https://api.telegram.org/bot".$bottoken."/setWebhook";
    
    
    $ch = curl_init($url);
    $post_data = Array(
    	"url" => "https://asdfsadf.ir/bball/bots/".$botname.".php",
    	"certificate" => "/home/asdfasdf/ssl/certs/asdfsadf_ir_b3adsfasdf3_basdfasdf_1asdfasdfasdfasdf_asdfasdfasdfasdfasdf.crt"
    	
    	
    	//asdfsadf_ir_b3453_bf8cf_15452345345_1asdfasdfasdfasdfasdfafs.crt"
    	
    	//
    );
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
    $result = curl_exec($ch);
    echo $result;

}

//https://asdfsadf.ir/folder/bots/letstart.php?token=asdfasfdsdfsdf&botname=botHamsaran

?>