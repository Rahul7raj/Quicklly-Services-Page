<?php 

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once '../core/database.php';
include_once '../class/Product.php';


$database = new Database();
$db = $database->getConnection();
$prodObj = new Product($db);

$requestMethod = $_SERVER['REQUEST_METHOD'];

if ($requestMethod == 'GET' && isset($_GET['catId']) && isset($_GET['serviceId'])) {
    $catId = $_GET['catId'];
    $serviceId = $_GET['serviceId'];
    if (isset($_GET['id'])) {
        $prodId = $_GET['id'];
        $getProductDetails = $prodObj->readById($prodId);
    } else {
        $getProductDetails = $prodObj->readAll($catId, $serviceId);
    }
    echo $getProductDetails;
}else{
    $data = [
        'status' => 405,
        'message' => $requestMethod. ' Method now allowed',
    ];
    header("HTTP/1.0 405 Method now allowed");
    echo json_encode($data);
}

?>