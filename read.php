<?php include_once "connection.php"?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View Records</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://wallpapercave.com/wp/wp10531700.png') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        table {
            width: 60%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background: rgba(100, 204, 113, 0.5);
            color: #fff;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: #229954;
            background: rgba(0, 150, 100, 0.5);
        }

        h3 {
            color: #fff;
            margin-top: 20px;
        }

        a {
            color: #2ecc71;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div>
    <?php
    global $connection;
    $table = $_GET['table'];
    $sql = "SELECT * FROM $table";
    $result = mysqli_query($connection, $sql);
    echo "<table border='1'>";
    echo "<tr>";
    while ($row = mysqli_fetch_field($result)) {
        echo "<th>" . $row->name . "</th>";
    }
    echo "</tr>";
    while ($row = mysqli_fetch_row($result)) {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
    ?>
    <h3><a href="index.php">Go to homepage</a></h3>
</div>

</body>

</html>
