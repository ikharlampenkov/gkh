<?php

ini_set('display_errors', 1);
ini_set('error_reporting', E_ALL);

/*
87.103.208.22 main

212.75.219.170 backup
 */

$serverURL = 'http://87.103.208.22:17151/rostlc.cgi?command=check&account=04264308';

$rq = curl_init($serverURL);
curl_setopt($rq, CURLOPT_HEADER, 0);
curl_setopt($rq, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($rq, CURLOPT_CONNECTTIMEOUT, 200);

echo 'start' . '<br/>';

$result = curl_exec($rq);


echo 'result' . '<br/>';

if ($result) {
    echo 'true' . '<br/>';
} else {
    echo curl_error($rq) . '<br/>';
    echo 'false' . '<br/>';
}

curl_close($rq);

print_r($result);

?>
