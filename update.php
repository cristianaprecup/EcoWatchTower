<?php include_once "connection.php"?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Record</title>
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

        select, input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #145a32;
        }
    </style>
</head>

<body>

<div>
    <h3>Table current values</h3>
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
            $i = 0;
            foreach ($row as $value) {
                echo "<td> <input type='text' value='$value'";
                if ($i == 0) {
                    echo " disabled";
                }
                $i++;
                echo "></td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    ?>

    <h3>Update field</h3>
    <?php
        $sql = "SELECT * FROM $table";
        $result = mysqli_query($connection, $sql);
        echo "<form action='' method='post'>";
        echo "<select name='field'>";
        while ($row = mysqli_fetch_field($result)) {
            echo "<option value='$row->name'>$row->name</option>";
        }
        echo "</select> <br>";
        echo "<label for='value'>New value</label>";
        echo "<input type='text' name='value' value=''>";
        echo "<input type='hidden' name='table' value='$table'>";

        echo "<h3> Where </h3>";
        $sql = "SELECT * FROM $table";
        $result = mysqli_query($connection, $sql);
        echo "<select name='where'>";
        while ($row = mysqli_fetch_field($result)) {
            echo "<option value='$row->name'>$row->name</option>";
        }
        echo "</select> <br>";
        echo "<label for='where_value'>Where value</label>";
        echo "<input type='text' name='where_value' value=''>";

        echo "<br><br><input type='submit' value='Update'>";
        echo "</form>";

        if (isset($_POST['field'])) {
            $field = $_POST['field'];
            $value = $_POST['value'];
            $where = $_POST['where'];
            $where_value = $_POST['where_value'];
            $sql = "UPDATE $table SET $field='$value' WHERE $where='$where_value'";
            try {
                $result = mysqli_query($connection, $sql);
                if ($result) {
                    header("Location: read.php?table=$table");
                } else {
                    throw new Exception("Error updating record: " . mysqli_error($connection));
                }
            } catch (Exception $e) {
                echo "<h3>Error updating record: " . $e->getMessage() . "</h3>";
            }
        }
    ?>

    <h3><a href="index.php">Go to homepage</a></h3>
</div>

</body>

</html>
