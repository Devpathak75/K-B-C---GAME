<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Congratulations</title>
    <style>
        body{
            margin:0;
            padding:0;
            font-family:Arial, sans-serif;
            text-align:center;
            background-image: url("images/kbc bg.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color:white;
        }

        /* ===== HEADER ===== */
        .kbc-header{
            width:100%;
            padding:18px 0;
            background: linear-gradient(to right, #8b0000, #ff0000, #8b0000);
            text-align:center;
            border-bottom:3px solid gold;
            box-shadow:0 0 20px red;
        }

        .kbc-title{
            font-size:34px;
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

        /* ===== MAIN BOX ===== */
        .box{
            width:600px;
            margin:80px auto;
            padding:35px;
            background: linear-gradient(145deg, rgba(10,10,30,0.95), rgba(0,0,0,0.88));
            border:2px solid #FFD700;
            border-radius:16px;
            box-shadow:
                0 10px 28px rgba(0,0,0,0.6),
                0 0 30px rgba(255,215,0,0.4);
        }

        h1{
            font-size:50px;
            color:gold;
            text-shadow:0 0 20px #ff0;
        }
        h2{
            font-size:32px;
            margin-top:20px;
        }
        p{
            font-size:20px;
            margin-top:10px;
            color:#fff;
        }

        .btn{
            margin-top:30px;
            padding:12px 25px;
            font-size:20px;
            background: #00ffff;
            color:#000;
            border:none;
            border-radius:15px;
            cursor:pointer;
            transition: all 0.3s ease;
        }
        .btn:hover{
            background:#0f3460;
            color:#00ffff;
        }

        /* ===== FOOTER ===== */
        .footer{
            width: 100%;
            padding: 25px 0;
            background: linear-gradient(to right, #003366, #00509e);
            color: #e5e7eb;
            text-align: center;
            font-family: 'Segoe UI', Arial, sans-serif;
            font-size: 18px;
            font-weight: 500;
            border-top: 4px solid #c0c0c0;
            box-shadow: 0 -4px 15px rgba(0,0,0,0.25);
            letter-spacing: 0.5px;
            position: fixed;
            bottom: 0;
            left: 0;
        }

    </style>
</head>
<body>

<!-- ===== HEADER ===== -->
<div class="kbc-header">
    <div class="kbc-title">Kaun Banega Crorepati</div>
    <div class="kbc-fullform">Knowledge Based Championship</div>
</div>

<!-- ===== MAIN BOX ===== -->
<div class="box">
    <h1>🎉 Congratulations! 🎉</h1>
    <h2>Aapne ₹ <%=session.getAttribute("finalAmount")%> jeeta hai</h2>
    <p>Aapne game quit kar diya hai apni marzi se</p>

   <form action="login.jsp">
    <button type="submit" class="btn">Start New Game</button>
</form>
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
