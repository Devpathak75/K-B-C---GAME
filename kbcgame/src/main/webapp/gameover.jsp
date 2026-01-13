<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Game Over</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        overflow: hidden;
        text-align: center;
        font-family: 'Roboto Mono', monospace;
        color: gold;

        /* 🔥 SAME BG IMAGE AS LOGIN */
        background-image: url("images/kbc bg.jpg");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    /* ===== RED KBC HEADER ===== */
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

    /* Dark overlay box */
    .container {
        width: 80%;
        max-width: 800px;
        margin: 101px auto;
        padding: 40px;
        background: rgba(0,0,0,0.85);
        border-radius: 15px;
        box-shadow: 0 0 30px red;
    }

    h1 {
        font-size: 4em;
        margin: 20px 0;
        color: red;
        text-shadow: 0 0 10px red, 0 0 20px orange, 0 0 30px yellow;
        animation: shake 0.5s infinite;
    }

    h2 {
        font-size: 2.5em;
        margin: 20px 0;
        text-shadow: 2px 2px 10px gold;
    }

    h3 {
        font-size: 1.8em;
        margin: 10px 0;
        color: #ccc;
    }

    /* Shake animation */
    @keyframes shake {
        0% { transform: translate(1px, 1px) rotate(0deg); }
        10% { transform: translate(-1px, -2px) rotate(-1deg); }
        20% { transform: translate(-3px, 0px) rotate(1deg); }
        30% { transform: translate(3px, 2px) rotate(0deg); }
        40% { transform: translate(1px, -1px) rotate(1deg); }
        50% { transform: translate(-1px, 2px) rotate(-1deg); }
        60% { transform: translate(-3px, 1px) rotate(0deg); }
        70% { transform: translate(3px, 1px) rotate(-1deg); }
        80% { transform: translate(-1px, -1px) rotate(1deg); }
        90% { transform: translate(1px, 2px) rotate(0deg); }
        100% { transform: translate(1px, -2px) rotate(-1deg); }
    }

    /* Smoke effect */
    .smoke {
        position: absolute;
        width: 15px;
        height: 15px;
        background: radial-gradient(circle, rgba(200,200,200,0.5), transparent);
        border-radius: 50%;
        pointer-events: none;
        animation: rise 3s linear infinite;
    }

    @keyframes rise {
        0% { transform: translateY(0) scale(0.5); opacity: 0.8; }
        100% { transform: translateY(-300px) scale(1.5); opacity: 0; }
    }
</style>
</head>

<body>

<!-- 🔥 RED KBC HEADER -->
<div class="kbc-header">
    <div class="kbc-title">Kaun Banega Crorepati</div>
    <div class="kbc-fullform">Knowledge Based Championship</div>
</div>

<div class="container">
    <h1>❌ GAME OVER</h1>
    <h2>You Won ₹ <%= session.getAttribute("finalAmount") %></h2>
    <h3>Thanks for playing KBC</h3>
</div>

<script>
    // Smoke animation
    function createSmoke() {
        let smoke = document.createElement('div');
        smoke.classList.add('smoke');
        smoke.style.left = Math.random() * window.innerWidth + 'px';
        smoke.style.top = window.innerHeight - 50 + 'px';
        smoke.style.animationDuration = (2 + Math.random() * 2) + 's';
        document.body.appendChild(smoke);
        setTimeout(() => smoke.remove(), 4000);
    }
    setInterval(createSmoke, 200);
</script>

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
