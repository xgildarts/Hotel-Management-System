<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Header: *");
header("Access-Control-Allow-Methods: GET, POST");

if($_SERVER["REQUEST_METHOD"] == "GET") {

    include("database.php");

    $sql = "SELECT * FROM check_in_customers;";
    
    $result = mysqli_query($conn, $sql);
    
    $list = [];
    
    if(mysqli_num_rows($result) > 0){
        while($data = mysqli_fetch_assoc($result)) {
            array_push(
                $list, $data["name"],
                $data["room_number"],
                $data["room_type"],
                $data["check_out_time"],
                $data["check_out_date"]
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

}

