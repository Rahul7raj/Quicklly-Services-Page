<?php

class Service 
{
    private $con;

    protected $table = "services";

    public function __construct($db)
    {
        $this->con = $db;
    }

    public function readAll()
    {
        $query = "select * from {$this->table}";

        $result = $this->con->query($query);

        if($result)
        {
            if($result->num_rows > 0) 
            {
                $rows = $result->fetch_all(MYSQLI_ASSOC);

                $data = [
                    'status' => 200,
                    'message' => 'Services fetched successfully',
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
                    'message' => 'Service fetched successfully',
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