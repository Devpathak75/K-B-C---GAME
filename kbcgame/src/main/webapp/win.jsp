<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Congratulations!</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        overflow: hidden;
        font-family: 'Roboto Mono', monospace;
        color: gold;
        text-align: center;

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

    /* Dark center box */
    .container {
        width: 80%;
        max-width: 900px;
        margin: 100px auto;
        padding: 50px;
        background: rgba(0,0,0,0.85);
        border-radius: 20px;
        box-shadow: 0 0 40px gold;
    }

    h1 {
        font-size: 4em;
        margin-top: 20px;
        color: #FFD700;
        text-shadow: 0 0 10px #FFD700, 0 0 20px #FFA500, 0 0 30px #FF4500;
        animation: glow 1s ease-in-out infinite alternate;
    }

    h2 {
        font-size: 3em;
        margin: 20px 0;
        color: #fff;
        text-shadow: 2px 2px 10px gold;
    }

    h3 {
        font-size: 1.5em;
        color: #ccc;
        margin-bottom: 20px;
    }

    /* Glow animation */
    @keyframes glow {
        from { text-shadow: 0 0 10px #FFD700, 0 0 20px #FFA500, 0 0 30px #FF4500; }
        to { text-shadow: 0 0 20px #FFD700, 0 0 30px #FFA500, 0 0 40px #FF4500; }
    }

    /* Confetti */
    .confetti {
        position: absolute;
        width: 10px;
        height: 10px;
        background-color: #FFD700;
        opacity: 0.8;
        pointer-events: none;
        animation: fall linear infinite;
    }

    @keyframes fall {
        0% { transform: translateY(-10px) rotate(0deg); opacity:1; }
        100% { transform: translateY(100vh) rotate(360deg); opacity:0; }
    }
</style>
</head>

<body>

<!-- 🔥 RED KBC HEADER -->
<div class="kbc-header">
    <div class="kbc-title">KBC</div>
    <div class="kbc-fullform">Knowledge Based Championship</div>
</div>

<div class="container">
    <h1>🎉 CONGRATULATIONS 🎉</h1>
    <h2>You Won ₹7,00,00,000</h2>
    <h3>🔥🔥 You are a KBC Champion! 🔥🔥</h3>
</div>

<script>
    // Confetti animation
    function createConfetti() {
        const confetti = document.createElement('div');
        confetti.classList.add('confetti');
        confetti.style.left = Math.random() * window.innerWidth + 'px';
        confetti.style.backgroundColor = `hsl(${Math.random()*360}, 100%, 50%)`;
        confetti.style.width = 5 + Math.random()*10 + 'px';
        confetti.style.height = 5 + Math.random()*10 + 'px';
        confetti.style.animationDuration = (3 + Math.random()*2) + 's';
        document.body.appendChild(confetti);
        setTimeout(() => confetti.remove(), 5000);
    }

    setInterval(createConfetti, 100);
</script>
<!-- footer.jsp -->
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
