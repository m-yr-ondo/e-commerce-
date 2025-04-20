<?php
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    $user_id = $input['user_id'] ?? null;
    $product_id = $input['product_id'] ?? null;
    // In a real cart, you'd receive an array of items
    // For simplicity, we take one product

    if (empty($user_id) || empty($product_id)) {
         send_json_response(["status" => "error", "message" => "User ID and Product ID are required"]);
    }

    // Fetch product details (name and current price) to store in the order
    $stmt = $conn->prepare("SELECT name, price FROM products WHERE id = ?");
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $product = $result->fetch_assoc();
        $product_name = $product['name'];
        $price_at_order = $product['price'];

        // Insert the order
        $stmt_order = $conn->prepare("INSERT INTO orders (user_id, product_id, product_name, price_at_order, quantity) VALUES (?, ?, ?, ?, 1)"); // Assuming quantity 1
        $stmt_order->bind_param("iisd", $user_id, $product_id, $product_name, $price_at_order);

        if ($stmt_order->execute()) {
            $order_id = $conn->insert_id; // Get the ID of the order just created
            send_json_response([
                "status" => "success",
                "message" => "Order placed successfully",
                "order_id" => $order_id,
                "product_name" => $product_name,
                "price_paid" => $price_at_order
            ]);
        } else {
            send_json_response(["status" => "error", "message" => "Failed to place order: " . $stmt_order->error]);
        }
        $stmt_order->close();

    } else {
         send_json_response(["status" => "error", "message" => "Product not found"]);
    }
    $stmt->close();

} else {
    send_json_response(["status" => "error", "message" => "Invalid request method"]);
}
?>