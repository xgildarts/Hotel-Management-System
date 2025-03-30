<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE");

if($_SERVER["REQUEST_METHOD"] == "GET") {

    include("database.php");

    $sql = "SELECT * FROM check_in_customers;";
    
    $result = mysqli_query($conn, $sql);
    
    $list = [];
    
    if(mysqli_num_rows($result) > 0){
        while($data = mysqli_fetch_assoc($result)) {
            array_push(
                $list, [
                    $data["name"],
                    $data["room_number"],
                    $data["room_type"],
                    $data["check_out_time"],
                    $data["check_out_date"]
                ]
            );
        }   
    }
    
    echo json_encode($list);

} else if($_SERVER["REQUEST_METHOD"] == "POST") {

    include("database.php");

    $package = file_get_contents("php://input");

    $contents = json_decode($package, true);

    $sql = "INSERT INTO check_in_customers(name, room_number, room_type, check_out_time, check_out_date)
            VALUES(?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
                      "sisss", 
                      $contents["name"],
                      $contents["roomNumber"],
                      $contents["option"],
                      $contents["checkOutTime"],
                      $contents["checkOutDate"]
                    );
    
    if($stmt->execute()) {
        echo json_encode("Successfully inserted!");
    } else {
        echo json_encode("Error inserted!");
    }

} else if($_SERVER["REQUEST_METHOD"] == "DELETE") {

    include("database.php");
    
    $package = file_get_contents("php://input");

    $contents = json_decode($package, true);

    $sql = "SELECT * FROM check_in_customers";

    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0) {
        foreach($contents["room_expired"] as $value) {

            $pst = $conn->prepare("DELETE FROM check_in_customers WHERE room_number = ?");
            $pst->bind_param("i", $value);
    
            if($pst->execute()) {
                echo json_encode(["Successfully removed!"]);
            } else {
                echo json_encode(["Unsuccessfully removed!"]);
            }
    
        }
    } else {
        echo json_encode(["No content yet in database!"]);
    }


}

