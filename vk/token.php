<?php


$params = [
    'client_id' => '5656028',
    'redirect_uri' => 'https://oauth.vk.com/blank.html',
    'response_type' => 'token',
    'scope' => 'friends, audio, groups, offline',
];

$url = 'https://oauth.vk.com/authorize?'.http_build_query($params);

var_dump($url);