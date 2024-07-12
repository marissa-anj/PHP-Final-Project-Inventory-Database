<?php

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cp476";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialize $result to prevent crashing after updating
$result = null;

// Handling form submissions for query, update, and delete
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['query'])) {
        // Query functionality
        $search = $_POST['search'];
        // Searches product name to find it, gives product information
        $stmt = $conn->prepare("SELECT pt.ProductID, pt.ProductName, pt.Quantity, pt.Price, pt.Status, st.SupplierName
                                FROM `producttable` pt
                                JOIN `suppliertable` st ON pt.SupplierID = st.SupplierID
                                WHERE pt.ProductName LIKE ?");
        $search_param = "%" . $search . "%";
        $stmt->bind_param("s", $search_param);
        $stmt->execute();
        $result = $stmt->get_result();
    } elseif (isset($_POST['update'])) {
        // Update functionality
        $productID = $_POST['productID'];
        $oldPrice = $_POST['oldPrice'];  // Used to remember old price when updating row in database
        $quantity = $_POST['quantity'];
        $newPrice = $_POST['price'];
        $status = $_POST['status'];

        // Finds the product row and updates quantity, price, and/or status
        $stmt = $conn->prepare("UPDATE `producttable` SET Quantity = ?, Price = ?, Status = ? WHERE ProductID = ? AND Price = ?");
        if ($stmt) {
            $stmt->bind_param("idsid", $quantity, $newPrice, $status, $productID, $oldPrice);
            $stmt->execute();
            $stmt->close();
        } else {
            echo "<div>Prepare failed: " . $conn->error . "</div>";
        }
       
        header("Location: dashboard.php");
        exit;
    } elseif (isset($_POST['delete'])) {
        // Delete functionality 
        $productID = $_POST['productID'];
        $price = $_POST['oldPrice'];  // In case the user hasn't updated the price
        // Finds product from productID and current price and deletes it
        $stmt = $conn->prepare("DELETE FROM `producttable` WHERE ProductID = ? AND Price = ?");
        $stmt->bind_param("id", $productID, $price);
        $stmt->execute();
        header("Location: dashboard.php");
        exit;
    }
} else {
    // Display of all products
    $stmt = $conn->prepare("SELECT pt.ProductID, pt.ProductName, pt.Quantity, pt.Price, pt.Status, st.SupplierName
                            FROM `producttable` pt
                            JOIN `suppliertable` st ON pt.SupplierID = st.SupplierID");
    $stmt->execute();
    $result = $stmt->get_result();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Dashboard</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Inventory Dashboard</h1>

    <!-- Query Form -->
    <form method="post" action="">
        <input type="text" name="search" placeholder="Search product name">
        <button type="submit" name="query">Search</button>
    </form>

    <?php
    if ($result && $result->num_rows > 0) {
        echo "<table>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Supplier Name</th>
                    <th>Actions</th>
                </tr>";

        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <form method='post' action=''>
                        <td>" . $row["ProductID"] . "</td>
                        <td>" . $row["ProductName"] . "</td>
                        <td><input type='number' name='quantity' value='" . $row["Quantity"] . "'></td>
                        <td><input type='text' name='price' value='" . $row["Price"] . "'></td>
                        <td><input type='text' name='status' value='" . $row["Status"] . "'></td>
                        <td>" . $row["SupplierName"] . "</td>
                        <td>
                            <input type='hidden' name='productID' value='" . $row["ProductID"] . "'>
                            <input type='hidden' name='oldPrice' value='" . $row["Price"] . "'>
                            <button type='submit' name='update'>Update</button>
                            <button type='submit' name='delete'>Delete</button>
                        </td>
                    </form>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
    ?>
</body>
</html>