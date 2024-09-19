<?php 

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once '../core/database.php';
include_once '../class/Category.php';


$database = new Database();
$db = $database->getConnection();
$catObj = new Category($db);

$requestMethod = $_SERVER['REQUEST_METHOD'];

if ($requestMethod == 'GET' && isset($_GET['serviceId'])) {
    $serviceId = $_GET['serviceId'];
    if (isset($_GET['id'])) {
        $catId = $_GET['id'];
        $getCategoryDetails = $catObj->readById($catId);
    } else {
        $getCategoryDetails = $catObj->readAll($serviceId);
    }
    echo $getCategoryDetails;
}else{
    $data = [
        'status' => 405,
        'message' => $requestMethod. ' Method now allowed',
    ];
    header("HTTP/1.0 405 Method now allowed");
    echo json_encode($data);
}

?>