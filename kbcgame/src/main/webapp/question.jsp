<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("fiftyUsed")==null) session.setAttribute("fiftyUsed", false);
    if(session.getAttribute("audienceUsed")==null) session.setAttribute("audienceUsed", false);
    if(session.getAttribute("callUsed")==null) session.setAttribute("callUsed", false);

    int qNo = (int)session.getAttribute("questionNumber");
    int prize = (int)session.getAttribute("prize");
%>

<!DOCTYPE html>
<html>
<head>
<title>KBC Question</title>

<style>
body{
    margin:0;
    padding:0;
    color:white;
    font-family:Arial;
    text-align:center;
    background-image: url("images/kbc bg.jpg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

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



.box{
    width:760px;
    margin:60px auto;
    padding:10px;
    background: linear-gradient(145deg, rgba(10,10,30,0.95), rgba(0,0,0,0.88));
    border:2px solid #FFD700;
    border-radius:16px;
    box-shadow:
        0 10px 28px rgba(0,0,0,0.6),
        0 0 30px rgba(255,215,0,0.4);
    backdrop-filter: blur(4px);
    
}

.option{
    display:block;
    margin:12px auto;
    padding:14px;
    width:92%;
    border:1px solid #ffffff;
    background:#000000;
    color:#ffffff;
    font-size:17px;
    cursor:pointer;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.4);
    transition: all 0.25s ease;
}

.option:hover{
    background:#FFD700;
    color:#000000;
    border:1px solid #FFD700;
    box-shadow:0 6px 18px rgba(255,215,0,0.5);
}

.lifeline{
    margin:8px;
    padding:10px 20px;
    border:2px solid #00ffff;
    background:#050510;
    color:#00ffff;
    cursor:pointer;
    border-radius:30px;
    font-weight:bold;
    font-size:15px;
    transition: all 0.25s ease;
}

.lifeline:hover{
    background:#0f3460;
    box-shadow:0 4px 15px rgba(0,255,255,0.3);
}

.lifeline:disabled{
    opacity:0.4;
    cursor:not-allowed;
}

.timer{
    color:#00ffff;
    font-size:24px;
    font-weight:bold;
    margin-bottom:12px;
}

.poll{
    color:gold;
    margin-top:10px;
}



/* ===== PRIZE LADDER ===== */
.ladder{
    width:260px;
    padding:1px;
    background: rgba(0,0,0,0.9);
    border:2px solid gold;
    border-radius:16px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.ladder div{
    padding:8px;
    margin:4px 0;
    border-radius:8px;
    border:1px solid rgba(255,215,0,0.3);
}

.activePrize{
    background:gold;
    color:black;
    font-weight:bold;
}

.main-wrapper{
    display:flex;
    justify-content:center;
    align-items:flex-start;
    gap:30px;
    margin-top:50px;
}

.box{
    margin:0;
}



</style>

<script>
var correct = "<%=session.getAttribute("answer")%>";
var time = 60;
var timerRef;

function startTimer(){
    <% if(prize <= 500000){ %>
        timerRef = setInterval(function(){
            document.getElementById("t").innerHTML = time--;
            if(time < 0){
                location.href="gameover.jsp";
            }
        },1000);
    <% } %>
}

function stopTimer(){
    if(timerRef){
        clearInterval(timerRef);
    }
}

function fifty(){
    let removed = 0;
    ["A","B","C","D"].forEach(o=>{
        if(o !== correct && removed < 2){
            document.getElementById("opt"+o).style.display="none";
            removed++;
        }
    });
    document.getElementById("f50").disabled = true;
    document.getElementById("used50").value = "true";
}

function audience(){
    let res="";
    ["A","B","C","D"].forEach(o=>{
        if(o === correct) res += o+": 60% | ";
        else res += o+": "+(10+Math.floor(Math.random()*10))+"% | ";
    });
    document.getElementById("poll").innerHTML = res;
    document.getElementById("aud").disabled = true;
    document.getElementById("usedAud").value = "true";
}

function call(){
    alert("📞 Friend: mujhe lagta hai answer "+correct+" hi hai");
    document.getElementById("call").disabled = true;
    document.getElementById("usedCall").value = "true";
}

function markAndSubmit(ans, id, e){

    e.preventDefault();
    stopTimer();

    document.getElementById("finalAnswer").value = ans;

    var clickedBtn = document.getElementById(id);

    if(ans === correct){
        clickedBtn.style.backgroundColor = "green";
        clickedBtn.style.color = "white";
    }else{
        clickedBtn.style.backgroundColor = "red";
        clickedBtn.style.color = "white";
        document.getElementById("opt"+correct).style.backgroundColor = "green";
        document.getElementById("opt"+correct).style.color = "white";
    }

    ["A","B","C","D"].forEach(o=>{
        document.getElementById("opt"+o).disabled = true;
    });

    setTimeout(function(){
        clickedBtn.form.submit();
    }, 1200);
}


function quitGame(){
    if(confirm("Are you sure? Aap game quit karna chahte ho?")){
        window.location.href = "quitGame";
    }
}


</script>
</head>

<body onload="startTimer()">

<div class="kbc-header">
    <div class="kbc-title">Kaun Banega Crorepati</div>
    <div class="kbc-fullform">Knowledge Based Championship</div>
</div>



<!-- ===== SIDE BY SIDE START ===== -->
<div class="main-wrapper">

<div class="box">

<h3>User: <%=session.getAttribute("username")%></h3>

<% if(prize <= 500000){ %>
    <div class="timer">⏱️ <span id="t">60</span> sec</div>
<% } %>

<h2>₹ <%=prize%></h2>
<p><%=session.getAttribute("question")%></p>

<button class="lifeline" onclick="quitGame()">Quit</button>

<button id="f50" class="lifeline"
<% if((boolean)session.getAttribute("fiftyUsed")){ %> disabled <% } %>
onclick="fifty()">50-50</button>

<button id="aud" class="lifeline"
<% if((boolean)session.getAttribute("audienceUsed")){ %> disabled <% } %>
onclick="audience()">Audience</button>

<button id="call" class="lifeline"
<% if((boolean)session.getAttribute("callUsed")){ %> disabled <% } %>
onclick="call()">Call</button>

<div id="poll" class="poll"></div>

<form action="checkAnswer" method="post">
    <input type="hidden" name="used50" id="used50">
    <input type="hidden" name="usedAud" id="usedAud">
    <input type="hidden" name="usedCall" id="usedCall">
    <input type="hidden" name="answer" id="finalAnswer">

    <button id="optA" class="option"
        onclick="markAndSubmit('A','optA',event)">A. <%=session.getAttribute("a")%></button>

    <button id="optB" class="option"
        onclick="markAndSubmit('B','optB',event)">B. <%=session.getAttribute("b")%></button>

    <button id="optC" class="option"
        onclick="markAndSubmit('C','optC',event)">C. <%=session.getAttribute("c")%></button>

    <button id="optD" class="option"
        onclick="markAndSubmit('D','optD',event)">D. <%=session.getAttribute("d")%></button>
</form>

</div>

<div class="ladder">
    <div class="<%= prize==10000 ? "activePrize" : "" %>">₹ 10,000</div>
    <div class="<%= prize==20000 ? "activePrize" : "" %>">₹ 20,000</div>
    <div class="<%= prize==40000 ? "activePrize" : "" %>">₹ 40,000</div>
    <div class="<%= prize==80000 ? "activePrize" : "" %>">₹ 80,000</div>
    <div class="<%= prize==160000 ? "activePrize" : "" %>">₹ 1,60,000</div>
    <div class="<%= prize==320000 ? "activePrize" : "" %>">₹ 3,20,000</div>
    <div class="<%= prize==640000 ? "activePrize" : "" %>">₹ 6,40,000</div>
    <div class="<%= prize==1250000 ? "activePrize" : "" %>">₹ 12,50,000</div>
    <div class="<%= prize==2500000 ? "activePrize" : "" %>">₹ 25,00,000</div>
    <div class="<%= prize==5000000 ? "activePrize" : "" %>">₹ 50,00,000</div>
    <div class="<%= prize==10000000 ? "activePrize" : "" %>">₹ 1,00,00,000</div>
    <div class="<%= prize==70000000 ? "activePrize" : "" %>">₹ 7,00,00,000</div>
</div>


</div>

<!-- footer.jsp -->
<div style="
    width: 100%;
    padding: 25px 0;

    background: linear-gradient(to right, #003366, #00509e);
    margin-top:30px;
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
