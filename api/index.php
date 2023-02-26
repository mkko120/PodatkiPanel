<?php
// This is a simple API for the web app to check if the server is healthy
header('Content-Type: application/json');
header('X-Powered-By: ZusOS v2.13.7');
$obj = new stdClass();
$obj->status = 200;
$obj->message = 'Healthy';
$obj->time = date('Y-m-d H:i:s');
echo json_encode($obj);