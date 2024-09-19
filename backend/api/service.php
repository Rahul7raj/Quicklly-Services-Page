<?php 

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once '../core/database.php';
include_once '../class/Service.php';


$database = new Database();
$db = $database->getConnection();
$serviceObj = new Service($db);

$requestMethod = $_SERVER['REQUEST_METHOD'];

if ($requestMethod == 'GET') {
    if (isset($_GET['id'])) {
        $serviceId = $_GET['id'];
        $getServiceDetails = $serviceObj->readById($serviceId);
    } else {
        $getServiceDetails = $serviceObj->readAll();
    }
    echo $getServiceDetails;
}else{
    $data = [
        'status' => 405,
        'message' => $requestMethod. ' Method now allowed',
    ];
    header("HTTP/1.0 405 Method now allowed");
    echo json_encode($data);
}

?>