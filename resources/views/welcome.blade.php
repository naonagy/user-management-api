<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        button {
            background-color: #6200ea;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #3700b3;
        }
    </style>
</head>
<body>
    <h1>Welcome to Our App</h1>
    <p>We are glad to have you here!</p>
    <button onclick="window.location.href='/open-index'">Sign in</button>
</body>
</html>
