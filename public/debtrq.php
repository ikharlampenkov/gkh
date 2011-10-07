<?php

//'http://87.103.208.22:17151/rostlc.cgi?command=check&account=04264308'

function doRequaest($ip, $pid) {
    $serverURL = 'http://' . $ip . ':17151/rostlc.cgi?command=check&account=' . $pid;

    $rq = curl_init($serverURL);
    curl_setopt($rq, CURLOPT_HEADER, 0);
    curl_setopt($rq, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($rq, CURLOPT_CONNECTTIMEOUT, 200);

    //echo 'start' . '<br/>';

    $result = curl_exec($rq);

    //echo 'result' . '<br/>';

    if ($result) {
        curl_close($rq);
        return $result;
    } else {
        $emessage = curl_error($rq);
        curl_close($rq);
        throw new Exception($emessage);
    }
}

if (isset($_GET['pin']) && !empty($_GET['pin']) && $_GET['pin'] > 0) {
    $pin = $_GET['pin'];

    if (isset($_GET['action'])) {
        $action = $_GET['action'];
    } else {
        $action = 'checkPin';
    }

    try {
        $result = doRequaest('87.103.208.22', $pin);

        $result = preg_replace('/(<|<\/)([0-9]*)>/', '$1date_$2>', $result);

        //echo $result;

        if ($action == 'checkPin') {
            $xmlDoc = new DOMDocument('1.0', 'uft-8');
            $xmlDoc->loadXML($result);

            $nodeList = $xmlDoc->getElementsByTagName('result');
            if ($nodeList->length == 1 && $nodeList->item(0)->nodeValue == 0) {
                echo 'true';
            } else {
                echo 'false';
            }
        } elseif ($action == 'getData') {
            $resArray = array('amount_debt' => 0, 'amount_penalty' => 0, 'amount_debt_w_penalties' => 0, 'number_months' => 0);

            $xmlDoc = new DOMDocument('1.0', 'uft-8');
            $xmlDoc->preserveWhiteSpace = false;
            $xmlDoc->loadXML($result);

            $nodeList = $xmlDoc->getElementsByTagName('result');
            if ($nodeList->length == 1 && $nodeList->item(0)->nodeValue == 0) {

                $nodeList = $xmlDoc->getElementsByTagName('debts');

                if ($nodeList->length > 0) {

                    $debts = $nodeList->item(0);

                    if ($debts->hasChildNodes()) {

                        //print_r($debts->childNodes);

                        foreach ($debts->childNodes as $debt) {
                            $resArray['number_months'] += 1;

                            $resArray['amount_debt'] += $debt->childNodes->item(0)->nodeValue;
                            $resArray['amount_penalty'] += $debt->childNodes->item(1)->nodeValue;
                        }

                        $resArray['amount_debt_w_penalties'] = $resArray['amount_debt'] + $resArray['amount_penalty'];
                    }
                }

                echo implode(';', $resArray);
                exit;
            } else {
                echo 'false';
            }
        } else {
            echo 'Error: Not valid action. Use checkPin or getData';
        }
    } catch (Exception $ex) {
        echo 'Error: ' . $ex->getMessage();
    }
} else {
    echo 'Error: PIN?';
}

?>
