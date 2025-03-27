<?php

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: *");

    function insert_data($room_number, $room_status) {
        include("database.php");
        $sql = "UPDATE rooms
                SET status = '{$room_status}'
                WHERE id = {$room_number}
                ;";
        $result = mysqli_query($conn, $sql);

        if($result) {
            echo "Successfully set room status!";
        } else {
            echo "Error!";
        }
    }

    function retrieved_data($room_number) {

        include("database.php");

        $sql = "SELECT status FROM rooms
                WHERE id = {$room_number};";

        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) > 0) {
            $data = mysqli_fetch_assoc($result);
            echo json_encode([$data["status"]]);
        }

    }

    if($_SERVER["REQUEST_METHOD"] == "POST") {

        $package = file_get_contents("php://input");
        $content = json_decode($package, true);
        
        if($content["request"] == "insert") {

            insert_data($content["room_number"], $content["room_status"]);

        } else if($content["request"] == "get") {

            retrieved_data($content["room_number"]);

        }

    } else if($_SERVER["REQUEST_METHOD"] == "GET") {

        

    }


?>