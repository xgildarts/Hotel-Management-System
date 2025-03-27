<?php

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: *");

    if($_SERVER["REQUEST_METHOD"] == "POST") {

        include("database.php");

        $package = file_get_contents("php://input");

        $content = json_decode($package, true);

        $ratings_score = $content["ratings_score"];

        $sql = "INSERT INTO ratings(Overall_Ratings_Score)
                VALUES('{$ratings_score}');";
        $result = mysqli_query($conn, $sql);

        if($result) {
            echo "Successfully  submitted";
        } else {
            echo "Error Submitting";
        }

    }

?>