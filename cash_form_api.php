<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: POST, GET");

function insert_data($cashier, $transactionNumber, $customerName, $roomType, $roomQuantity, $roomPrice, $total, $amount, $changes) {

    include("database.php");

    $sql = "INSERT INTO cash_payment(cashier, customer_name, room_type, room_quantity, room_price, total, amount, changes)
            VALUES('{$cashier}', '{$customerName}', '{$roomType}', {$roomQuantity}, {$roomPrice}, {$total}, {$amount}, {$changes});";
    
    $result = mysqli_query($conn, $sql);

    if($result) {
        echo json_encode(["status" => "Successfully inserted!"]);
    } else {
        echo json_encode(["status" => "Error inserted!"]);
    }
    
}   

function retrieved_data() {

    include("database.php");

    $sql = "SELECT * FROM cash_payment;";
    $records = [];
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0) {

        while($data = mysqli_fetch_assoc($result)) {

            $cashier = $data["Cashier"];
            $transaction_number = $data["Transaction_Number"];
            $customer_name = $data["Customer_Name"];
            $room_type = $data["Room_Type"];
            $room_quantity = $data["Room_Quantity"]; 
            $room_price = $data["Room_Price"];
            $total = $data["total"];
            $amount = $data["Amount"];
            $changes = $data["Changes"];

            array_push($records, [
                "cashier" => $cashier,
                "transaction_number" => $transaction_number,
                "customer_name" => $customer_name,
                "room_type" => $room_type,
                "room_quantity" => $room_quantity,
                "room_price" => $room_price,
                "total" => $total,
                "amount" => $amount,
                "changes" => $changes,
            ]);

        }

    }

    echo json_encode($records);
}

if($_SERVER["REQUEST_METHOD"] == "POST") {

    $package = file_get_contents("php://input");

    $content = json_decode($package, true);

    $cashier = $content["cashier"];
    $transactionNumber = $content["transactionNumber"];
    $customerName = $content["customerName"];
    $roomType = $content["option"];
    $roomQuantity = $content["roomQuantity"];
    $roomPrice = $content["roomPrice"];
    $total = $content["total"];
    $amount = $content["amount"];
    $changes = $content["changes"];

    insert_data($cashier, $transactionNumber, $customerName, $roomType, $roomQuantity, $roomPrice, $total, $amount, $changes);

} else if($_SERVER["REQUEST_METHOD"] == "GET") {
    retrieved_data();
}


?>