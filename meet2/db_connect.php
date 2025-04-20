<?php
header("Content-Type: application/json"); // Ensure JSON output
header("Access-Control-Allow-Origin: *"); // Allow requests from any origin (for development)
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Handle OPTIONS request (pre-flight request)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

$servername = "localhost";
$username = "root"; // Default XAMPP username
$password = ""; // Default XAMPP password
$dbname = "meet2";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]);
    exit(); // Terminate script if connection fails
}
// Set character set to UTF-8
$conn->set_charset("utf8");

// Function to send JSON response
function send_json_response($data) {
    global $conn; // Access the global connection object if needed
    if ($conn) {
        $conn->close(); // Close connection before sending response
    }
    echo json_encode($data);
    exit();
}
?>