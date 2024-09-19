<?php

class Product 
{
    private $con;

    protected $table = "products";

    public function __construct($db)
    {
        $this->con = $db;
    }

    public function readAll($catId, $serviceId)
    {
        if($catId == 0)
        {
            $query = "select * from {$this->table} where category_id IN(Select id from categories where service_id={$serviceId})";
        }
        else
            $query = "select * from {$this->table} where category_id={$catId}";

        $result = $this->con->query($query);

        if($result)
        {
            if($result->num_rows > 0) 
            {
                $rows = $result->fetch_all(MYSQLI_ASSOC);

                $data = [
                    'status' => 200,
                    'message' => 'Products fetched successfully',
                    'data' => $rows
                ];
                header("HTTP/1.0 200 OK");
            }
            else {
                $data = [
                    'status' => 400,
                    'message' => 'No records found.'
                ];
                header('HTTP/1.0 400 No records found');
            }
        }
        else {
            $data = [
                'status' => 500,
                'me3ssage' => "Internal server error."
            ];
            header('HTTP/1.0 500 Internal Server error');
        }
        return json_encode($data);
    }

    public function readById($id)
    {
        $query = "select * from {$this->table} where id = {$id}";

        $result = $this->con->query($query);

        if($result)
        {
            if($result->num_rows > 0) 
            {
                $rows = $result->fetch_all(MYSQLI_ASSOC);

                $data = [
                    'status' => 200,
                    'message' => 'Product fetched successfully',
                    'data' => $rows
                ];
                header("HTTP/1.0 200 OK");
            }
            else {
                $data = [
                    'status' => 400,
                    'message' => 'No records found.'
                ];
                header('HTTP/1.0 400 No records found');
            }
        }
        else {
            $data = [
                'status' => 500,
                'me3ssage' => "Internal server error."
            ];
            header('HTTP/1.0 500 Internal Server error');
        }
        return json_encode($data);
    }
}
?>