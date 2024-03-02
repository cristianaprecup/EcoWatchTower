<?php include_once "connection.php"?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Record</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://wallpapercave.com/wp/wp10531700.png') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        #form {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form {
            width: 35%;
            background: rgba(100, 204, 113, 0.5);
            padding: 20px;
            border-radius: 10px;
        }

        .label-container {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        label {
            color: #fff;
            font-size: 18px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .button {
            padding: 10px;
            font-size: 16px;
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #145a32;
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

<div id="form">
    <form action="" method="post">
        <div class="label-container">
            <?php
            global $connection;
            $table = $_GET['table'];
            $sql = "DESCRIBE $table";
            $result = mysqli_query($connection, $sql);
            while ($row = mysqli_fetch_row($result)) {
                echo "<label for='$row[0]'>$row[0]</label>";
                echo "<input type='text' name='$row[0]' id='$row[0]'/><br><br>";
            }
            ?>
            <input class="button" type="submit" value="Add" name="submitBtn">
        </div>
    </form>
    <?php
    if(isset($_POST['submitBtn'])) {

        $table = $_GET['table'];
        $sql = "DESCRIBE $table";
        $result = mysqli_query($connection, $sql);
        while ($row = mysqli_fetch_row($result)) {
            if($_POST[$row[0]] == "") {
                echo "<h3>Please fill all fields</h3>";
                return;
            }
        }

        $values = array_values($_POST);
        $sql = "INSERT INTO $table VALUES(";
        for ($i = 0; $i < count($_POST) - 1; $i++) {
            $sql .= "'".$values[$i]."',";
        }
        $sql = rtrim($sql, ",") . ")";
        try {
            $result = mysqli_query($connection, $sql);
            if($result) {
                echo "<h3>Record added successfully. <a href='read.php?table=$table'>View records</a></h3>";
            } else {
                echo "<h3>Record not added</h3>";
            }
        } catch (Exception $e) {
            echo "<h3>Error creating record: " . $e->getMessage() . "</h3>";
            return;
        }

    }
    ?>
</div>
</body>

</html>
