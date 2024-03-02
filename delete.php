<?php include_once "connection.php"?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delete Record</title>
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

        form {
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 60%;
            background: rgba(100, 204, 113, 0.5);
            padding: 20px;
            border-radius: 10px;
        }

        select, input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
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
    $values = [];
    $reference = "";
    while ($row = mysqli_fetch_field($result)) {
        echo "<th>" . $row->name . "</th>";
        if ($reference == "") {
            $reference = $row->name;
        }
    }
    echo "</tr>";
    while ($row = mysqli_fetch_row($result)) {
        echo "<tr>";
        $i = 0;
        foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
            if ($i == 0) {
                $values[] = $value;
            }
            $i++;
        }
        echo "</tr>";
    }
    echo "</table>";
    ?>
    <h3>Select ID of the record you want to delete</h3>
    <?php
    echo "<form action='' method='post'> <select name='where'>";
    foreach ($values as $value) {
        echo "<option value='$value'>$value</option>";
    }
    echo "</select> <br>";
    echo "<input type='submit' value='Delete'>";
    echo "</form>";

    if (isset($_POST['where'])) {
        $where = $_POST['where'];
        $sql = "DELETE FROM $table WHERE $reference=$where";
        try {
            $result = mysqli_query($connection, $sql);
            if ($result) {
                header("Location: read.php?table=$table");
            } else {
                echo "Error deleting record: " . mysqli_error($connection);
            }
        } catch (Exception $e) {
            echo "Error deleting record: " . $e->getMessage();
        }
    }

    ?>

    <h3><a href="index.php">Go to homepage</a></h3>
</div>

</body>

</html>
