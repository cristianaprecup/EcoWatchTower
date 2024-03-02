<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Interfata CRUD</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f2f2f2;
            background-image: url('https://www.camposanto.com/external/wallpapers/Launch_Green/FWG_3440x1440.jpg');
            background-size: cover;
            background-position: center;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.75);
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            max-width: 600px;
            text-align: center;
        }

        h1 {
            color: #333;
            text-shadow: 2px 2px 4px rgba(0, 255, 0, 0.3);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            background-color: rgba(0, 255, 0, 0.1);
        }

        th,
        td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: darkgreen;
            transition: transform 0.3s;
            border-radius: 10px;
        }

        th {
            background-color: #2ecc71;
            color: #fff;
        }

        tr:hover {
            background-color: rgba(144, 238, 144, 0.7);
        }

        td:hover {
            transform: scale(1.05);
        }

        a {
            text-decoration: none;
            color: #2ecc71;
            transition: color 0.3s, background-color 0.3s;
            font-weight: bold;
            display: block;
            padding: 10px;
            border-radius: 5px;
            background-color: #ecf0f1;
        }

        a:hover {
            color: #1a5276;
            background-color: #d5e8f2;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Eco Watch Tower</h1>

        <table>
            <tr>
                <th>Action</th>
            </tr>
            <tr>
                <td><a href="create.php">Create Record</a></td>
            </tr>
            <tr>
                <td><a href="view.php">Read Records</a></td>
            </tr>
            <tr>
                <td><a href="update_list.php">Update Record</a></td>
            </tr>
            <tr>
                <td><a href="delete_list.php">Delete Record</a></td>
            </tr>
            <tr>
                <td><a href="execute.php">Execute query</a></td>
            </tr>
        </table>
    </div>

</body>

</html>
