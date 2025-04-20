<?php
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $sql = "SELECT id, name, description, price, image_url, category FROM products ORDER BY created_at DESC";
    $result = $conn->query($sql);

    $products = [];
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            // Convert price to float/double if needed by Flutter, though string is often fine
            $row['price'] = (float)$row['price'];
            $products[] = $row;
        }
        send_json_response(["status" => "success", "products" => $products]);
    } else {
        send_json_response(["status" => "success", "products" => []]); // Send empty array if no products
    }
} else {
     send_json_response(["status" => "error", "message" => "Invalid request method"]);
}
?>