<?php

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: GET, POST");

    function retrieved_data() {

        include("database.php");
    
        $sql = "SELECT * FROM cardpayment;";
        $records = [];
        $result = mysqli_query($conn, $sql);
    
        if(mysqli_num_rows($result) > 0) {
    
            while($data = mysqli_fetch_assoc($result)) {
    
                $card_trasaction_id = $data["Card_Transaction_ID"];
                $card_holder_name = $data["Card_Holder_Name"];
                $card_number = $data["Card_Number"];
                $room_type = $data["Type_of_Room"];
                $room_quantity = $data["Room_Quantity"]; 
                $room_price = $data["Room_Price"];
                $total = $data["total"];
    
                array_push($records, [
                    "card_trasaction_id" => $card_trasaction_id,
                    "card_holder_name" => $card_holder_name,
                    "card_number" => $card_number,
                    "room_type" => $room_type,
                    "room_quantity" => $room_quantity,
                    "room_price" => $room_price,
                    "total" => $total
                ]);
    
            }
    
        }
    
        echo json_encode($records);
    }

    function insert_data($card_transaction_id, $card_holder_name, $card_number, $option, $room_quantity, $room_price, $room_total) {

        include("database.php");
    
        $sql = "INSERT INTO cardpayment(Card_Holder_Name, Card_Number, Type_of_Room, Room_Quantity, Room_Price, total)
                VALUES('{$card_holder_name}', '{$card_number}', '{$option}', {$room_quantity}, {$room_price}, {$room_total});";
        
        $result = mysqli_query($conn, $sql);
    
        if($result) {
            echo json_encode(["status" => "Successfully inserted!"]);
        } else {
            echo json_encode(["status" => "Error inserted!"]);
        }
        
    }   

    if($_SERVER["REQUEST_METHOD"] == "POST") {
        $package = file_get_contents("php://input");

        $content = json_decode($package, true);

        $card_transaction_id = $content["card_transaction_id"];
        $card_holder_name = $content["card_holder_name"];
        $card_number = $content["card_number"];
        $option = $content["option"];
        $room_quantity = $content["room_quantity"];
        $room_price = $content["room_price"];
        $room_total = $content["room_total"];

        insert_data($card_transaction_id, $card_holder_name, $card_number, $option, $room_quantity, $room_price, $room_total);
    } else if($_SERVER["REQUEST_METHOD"] == "GET") {
        retrieved_data();
    }

?>