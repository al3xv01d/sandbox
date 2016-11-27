<?php


$buffer = file_get_contents('data.json');

$data = json_decode($buffer);


// json_last_error
// json_encode


var_dump($data);