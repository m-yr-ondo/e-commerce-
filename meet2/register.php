<?php
require 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    $username = $input['username'] ?? null;
    $email = $input['email'] ?? null;
    $password = $input['password'] ?? null;
    $confirmPassword = $input['confirm_password'] ?? null;

    // Basic Validation
    if (empty($username) || empty($email) || empty($password) || empty($confirmPassword)) {
        send_json_response(["status" => "error", "message" => "All fields are required"]);
    }
    if ($password !== $confirmPassword) {
        send_json_response(["status" => "error", "message" => "Passwords do not match"]);
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
         send_json_response(["status" => "error", "message" => "Invalid email format"]);
    }

    // Check if email already exists
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->close();
        send_json_response(["status" => "error", "message" => "Email already registered"]);
    }
    $stmt->close();

    // Hash the password
    $password_hash = password_hash($password, PASSWORD_BCRYPT);

    // Insert new user
    $stmt = $conn->prepare("INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $username, $email, $password_hash);

    if ($stmt->execute()) {
        send_json_response(["status" => "success", "message" => "Registration successful"]);
    } else {
        send_json_response(["status" => "error", "message" => "Registration failed: " . $stmt->error]);
    }
    $stmt->close();

} else {
    send_json_response(["status" => "error", "message" => "Invalid request method"]);
}
?>