<?php

ini_set('display_errors', 1);
ini_set('error_reporting', E_ALL);

/*
  87.103.208.22 main

  212.75.219.170 backup
 *
 * http://87.103.208.22:17151/rostlc.cgi?command=check&account=04264308
 */

$srvHost = "87.103.208.22";

//Генерим HTML запрос для получения списка программ и регистрации пользователя.
$myHttp = "";
$myHttp .= "GET http://" . $srvHost . ":17151/rostlc.cgi?command=check&account=04264308 HTTP/1.0\r\n";
$myHttp .= "User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)\r\n";
$myHttp .= "Accept: */*\r\n";
$myHttp .= "Host: $srvHost\r\n";
$myHttp .= "Referer: http://$srvHost\r\n";
$myHttp .= "\r\n\r\n";

$fp = fsockopen($srvHost, 80, &$errno, &$errstr, 30);
if (!$fp) {
    die("Server $srvHost. Connection failed: $errno, $errstr");
    exit;
}

fputs($fp, $myHttp);

$contents = "";
while (!feof($fp)) {
    $contents = $contents . fgets($fp, 4096);
}
echo $contents;

fclose($fp);


?>