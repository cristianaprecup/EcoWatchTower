<?php include_once('connection.php'); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Execute Query</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://wallpapercave.com/wp/wp10531700.png') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        form {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            color: #fff;
            font-size: 18px;
            margin-bottom: 10px;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
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
    </style>
</head>

<body>
    <form action="" method="post">
        <label for="query">Enter the query</label>
        <input type="text" name="query">
        <input type="submit" value="Execute" name="submit">
    </form>

    <?php
    if (isset($_POST['submit'])) {
        $query = $_POST['query'];
        $result = mysqli_query($connection, $query);
        try {
            if ($result) {
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
            } else {
                echo "Error executing the query. Please check and try again.";
            }
        } catch (Exception $e) {
            echo "Error executing the query: " . $e->getMessage() . ". Check it and run again.";
        }
    }
    ?>
</body>

</html>
