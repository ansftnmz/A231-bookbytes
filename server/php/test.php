<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .receipt {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .thank-you {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            color: #4CAF50;
        }

        .details {
            margin-top: 30px;
        }

        .details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .details table, .details th, .details td {
            border: 1px solid #ddd;
        }

        .details th, .details td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>

    <div class="receipt">
        <div class="header">
            <h2>Payment Receipt</h2>
        </div>

        <div class="thank-you">
            <p>Thank you for your payment!</p>
        </div>

        <div class="details">
            <table>
                <tr>
                    <th>Transaction ID:</th>
                    <td>123456789</td>
                </tr>
                <tr>
                    <th>Date:</th>
                    <td>January 30, 2024</td>
                </tr>
                <tr>
                    <th>Amount:</th>
                    <td>RM$amount</td>
                </tr>
                <tr>
                    <th>Payment status: </th>
                    <td>$paidstatus</td>
                </tr>
                <tr>
                    <th>Receipt Number:</th>
                    <td>987654321</td>
                </tr>
            </table>
        </div>
    </div>

</body>
</html>
