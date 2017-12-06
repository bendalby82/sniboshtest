<html><head><title>Faulty App</title></head>
<body>
<h1>Faulty App</h1>

<?php

function get_client_ip() {
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

$output="<p>";

$output .= "Instance address: " . getenv('CF_INSTANCE_ADDR') . "<br/>";

$output .= "Instance index: " . getenv('CF_INSTANCE_INDEX') . "<br/>";
$output .= "Instance GUID: " . getenv('CF_INSTANCE_GUID') . "<br/>";

if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	$output .= "X-Forwarded-For: " . $_SERVER['HTTP_X_FORWARDED_FOR'] . "<br/>";
} else {
	$output .= "X-Forwarded-For: NOT SET" . "<br/>";
}

$output .= "Remote address: " . $_SERVER['REMOTE_ADDR'] . ":" . $_SERVER['REMOTE_PORT'];
$output .= "</p>";
echo $output;
?>

<p><a href="?faulty=die">Die!</a></p>
<?php
if (!empty($_GET['faulty'])) {
  //shell_exec("killall -11 httpd");
  //str_repeat("a", 10000000000);//NO
  //No
  //pack("d4294967297", 2);
  //echo "<h1>You could have died</h1>";
  preg_match('/(.(?!b))*/', str_repeat("a", 10000));
}

?>
</body>
</html>