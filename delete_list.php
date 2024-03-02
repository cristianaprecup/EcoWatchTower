<?php include_once "connection.php"?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delete table</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://wallpapercave.com/wp/wp10531700.png') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 0.8px;
            background: rgba(30, 250, 133, 0.1);
            padding: 20px;
            border-radius: 15px;
            display: inline-block;
        }

        .table-container {
            width: 60%;
            margin: 20px auto;
            overflow: auto;
            max-height: 600px;
            border-radius: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background: rgba(100, 204, 113, 0.5);
            color: #fff;
        }

        th, td {
            padding: 20px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background-color: #229954;
            background: rgba(0, 150, 100, 0.5);
        }

        a {
            text-decoration: none;
            color: #ecf0f1;
            transition: color 0.3s, background-color 0.3s;
            font-weight: bold;
            display: block;
            padding: 15px;
            border-radius: 10px;
            background-color: #2ecc71;
            margin: 10px;
            text-transform: uppercase;
            background: rgba(0, 150, 100, 0.5);
        }

        a:hover {
            color: #145a32;
            background-color: #a9dfbf;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        * {
            scrollbar-width: thin;
            scrollbar-color: #888 #f1f1f1;
        }
    </style>
</head>

<body>

<h2>Choose a table to delete records</h2>

<div class="table-container">
    <table>
        <tr>
            <th>Tables</th>
        </tr>
        <?php
        $sql = "SHOW TABLES";
        global $connection;
        $result = mysqli_query($connection, $sql);
        while ($row = mysqli_fetch_row($result)) {
            echo "<tr><td><a href='delete.php?table=$row[0]'>" . $row[0] . "</a></td></tr>";
        }
        ?>
    </table>
</div>

</body>

</html>
