<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>KBC - Login</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url("images/kbc bg.jpg");
            background-size: cover;
            background-position: center;
        }

        /* ======= RED KBC HEADER ======= */
        .kbc-header{
            width:100%;
            padding:18px 0;
            background: linear-gradient(to right, #8b0000, #ff0000, #8b0000);
            text-align:center;
            border-bottom:3px solid gold;
            box-shadow:0 0 20px red;
        }

        .kbc-title{
            font-size:38px;
            font-weight:bold;
            color:gold;
            letter-spacing:4px;
            text-shadow:0 0 12px gold;
        }

        .kbc-fullform{
            font-size:14px;
            color:#ffeaea;
            letter-spacing:2px;
            margin-top:5px;
        }

        /* ======= UPDATED LOGIN BOX ======= */
        .container {
            width: 420px;
            margin: 85px auto;

            /* CHANGED ONLY THIS BACKGROUND */
            background: linear-gradient(135deg, #ffffff, #f8fafc);

            padding: 35px;
            border-radius: 14px;
            text-align: center;

            /* text color made professional */
            color: #0f172a;

            box-shadow: 0 6px 22px rgba(0,0,0,0.25);
            border: 2px solid #eab308;

            transition: all 0.3s ease;
        }

        .container:hover{
            box-shadow: 0 10px 30px rgba(0,0,0,0.35);
            transform: translateY(-3px);
        }

        /* Logo */
        .logo img {
            width: 120px;
            margin-bottom: 15px;
        }

        h1 {
            margin-bottom: 25px;
            color: #b91c1c;
            text-shadow: 0px 0px 6px rgba(185,28,28,0.3);
        }

        input[type=text] {
            width: 90%;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #cbd5e1;
            margin-bottom: 25px;
            outline: none;
            background-color: #ffffff;
            color: #0f172a;
        }

        input[type=text]::placeholder {
            color: #555;
        }

        input[type=submit] {
            width: 55%;
            padding: 12px;
            font-size: 16px;
            background-color: #eab308;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            color: #0f172a;
        }

        input[type=submit]:hover {
            background-color: #facc15;
        }

        .tagline {
            margin-top: 20px;
            font-size: 14px;
            color: #334155;
        }
    </style>
</head>

<body>

    <div class="kbc-header">
        <div class="kbc-title">Kaun Banega Crorepati</div>
        <div class="kbc-fullform">Knowledge Based Championship</div>
    </div>

    <div class="container">

        <div class="logo">
            <img src="images/kbc logo.png" alt="KBC Logo">
        </div>

        <h1>Kaun Banega Crorepati</h1>

        <form action="startGame" method="post">
            <input type="text" name="username" placeholder="Enter Your Name" required>
            <br>
            <input type="submit" value="Start Game">
        </form>

        <div class="tagline">
            India's Most Popular Quiz Show
        </div>

    </div>

<!-- footer.jsp -->
<div style="
    width: 100%;
    padding: 25px 0;

    background: linear-gradient(to right, #003366, #00509e);

    color: #e5e7eb;
    text-align: center;
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 18px;
    font-weight: 500;

    /* Accent border color also changed */
    border-top: 4px solid #c0c0c0;

    box-shadow: 0 -4px 15px rgba(0,0,0,0.25);
    letter-spacing: 0.5px;
">
    Developed by <strong style="font-weight:700;">Dev Deepak Pathak</strong>  
    | &copy; <%=java.time.Year.now()%>  
    <span style="margin-left:8px;">KBC Quiz Game</span>
</div>

</body>
</html>
</html>
