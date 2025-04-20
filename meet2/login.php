<?php
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
     $input = json_decode(file_get_contents('php://input'), true);

     $email = $input['email'] ?? null;
     $password = $input['password'] ?? null;

     if (empty($email) || empty($password)) {
         send_json_response(["status" => "error", "message" => "Email and password are required"]);
     }

     // Fetch user by email
     $stmt = $conn->prepare("SELECT id, username, email, password_hash, phone, address FROM users WHERE email = ?");
     $stmt->bind_param("s", $email);
     $stmt->execute();
     $result = $stmt->get_result();

     if ($result->num_rows === 1) {
         $user = $result->fetch_assoc();

         // Verify password
         if (password_verify($password, $user['password_hash'])) {
             // Don't send password hash back to client
             unset($user['password_hash']);
             send_json_response(["status" => "success", "message" => "Login successful", "user" => $user]);
         } else {
             send_json_response(["status" => "error", "message" => "Invalid email or password"]);
         }
     } else {
         send_json_response(["status" => "error", "message" => "Invalid email or password"]);
     }
     $stmt->close();

} else {
     send_json_response(["status" => "error", "message" => "Invalid request method"]);
}
?>