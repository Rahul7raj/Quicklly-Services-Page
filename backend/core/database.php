<?php

class Database 
{
    private $serverName = "localhost";
    private $userName = "root";
    private $password = "";
    private $database = "quicklly";

    public $con = null;

    public function getConnection() 
    {
        try {
            $this->con = new mysqli($this->serverName, $this->userName, $this->password, $this->database);
            if($this->con->connect_error)
            {
                throw new Exception("Could not coneect to database");
            }
        }
        catch(Exception $e) {
            throw new Exception($e->getMessage());
        }
        return $this->con;
    }
}
?>