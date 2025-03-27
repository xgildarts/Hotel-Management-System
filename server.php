<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: POST, GET");

function insert_to_database($cid, $name, $cno, $typeOfRoom, $roomNumber, $checkInDate, $checkInTime, $checkOutDate, $checkOutTime) {

    include("database.php");

    if (empty(trim($cid))) {
        
        echo json_encode(array("status" => "error!"));

        return;

    }

    $sql = "INSERT INTO hotel_form_table (customer_id, name, contact_number, type_of_room, room_number, check_in_date, check_in_time, check_out_date, check_out_time) 
        VALUES ('{$cid}', '{$name}', '{$cno}', '{$typeOfRoom}', ".(int)$roomNumber.", '{$checkInDate}', '{$checkInTime}', '{$checkOutDate}', '{$checkOutTime}');";

    $result = mysqli_query($conn, $sql);

    if($result ) {
        echo json_encode(array("status" => "successfully inserted!"));
    } else {
        echo json_encode(array("status" => "Error inserted!"));
    }


}


function retrieved_data() {

    $records = array();

    include("database.php");
    $sql = "SELECT * FROM hotel_form_table";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0) {

        while($data = mysqli_fetch_assoc($result)) {

            $transaction_id  = $data["transaction_id"];
            $customer_id  = $data["customer_id"];
            $name  = $data["name"];
            $contact_number  = $data["contact_number"];
            $type_of_room  = $data["type_of_room"];
            $check_in_date  = $data["check_in_date"];
            $check_in_time  = $data["check_in_time"];
            $check_out_date  = $data["check_out_date"];
            $check_out_time  = $data["check_out_time"];

            array_push($records, array(

                "transaction_id" => $transaction_id,
                "customer_id" => $customer_id,
                "name" => $name,
                "contact_number" => $contact_number,
                "type_of_room" => $type_of_room,
                "check_in_date" => $check_in_date,
                "check_in_time" => $check_in_time,
                "check_out_date" => $check_out_date,
                "check_out_time" => $check_out_time

            ));

        }
    }

    echo json_encode($records);

}

if($_SERVER["REQUEST_METHOD"] == "POST") {

    
    $package = file_get_contents("php://input");
    
    $data = json_decode($package, true);
    
    $cid = $data['cid'];
    $name = $data['name'];
    $cno = $data['cno'];
    $typeOfRoom = $data["option"];
    $roomNumber = $data["roomNumber"];
    $checkInDate = $data['checkInDate'];
    $checkInTime = $data['checkInTime'];
    $checkOutDate = $data['checkOutDate'];
    $checkOutTime = $data['checkOutTime'];
    
    
    // echo $cid ."<br>". $name ."<br>". $cno ."<br>". $typeOfRoom ."<br>". $checkInDate ."<br>". $checkInTime ."<br>". $checkOutDate ."<br>". $checkOutTime;
    
    insert_to_database($cid, $name, $cno, $typeOfRoom, $roomNumber, $checkInDate, $checkInTime, $checkOutDate, $checkOutTime);
} else if($_SERVER["REQUEST_METHOD"] == "GET") {
    $records = retrieved_data();
}

?>
