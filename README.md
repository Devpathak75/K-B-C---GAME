📌 Project Overview
🎮 Kon Banega Crorepati (KBC) – Java Web Application

This project is a web-based Kon Banega Crorepati (KBC) game developed using Java, JSP, Servlets, and MySQL.
The application simulates the real KBC quiz game with lifelines, timer, prize ladder, and multiple game outcomes.

It is deployed on Apache Tomcat 9 and supports access on desktop as well as mobile devices through local network IP.

🛠️ Technologies Used

Backend: Java, JSP, Servlets

Frontend: HTML, CSS, JavaScript

Database: MySQL (MySQL Workbench)

Server: Apache Tomcat 9

IDE: Eclipse

Build Tool: Maven (pom.xml)

📂 Project Structure
src/main/java
 └── com.kbc.controller
 
     ├── StartGameServlet.java
     
     ├── CheckAnswerServlet.java
     
     ├── QuitGameServlet.java


src/main/webapp

 ├── login.jsp
 
 ├── question.jsp
 
 ├── gameover.jsp
 
 ├── win.jsp
 
 ├── quit.jsp
 
 ├── image/
 
 ├── WEB-INF/
 
 │    └── web.xml
 
 └── pom.xml
 

🎯 Game Features

🔐 Login System

❓ Dynamic Questions fetched from MySQL database

⏱️ Timer enabled for questions up to ₹3,00,000

🏆 Prize Ladder System


🧠 Lifelines (one-time use each):

1. 50-50

2. Audience Poll

3. Call a Friend


🎨 Hover effects on login and option buttons

❌ Wrong answer → Game Over page

🚪 Quit option → Quit page

🥇 Winning ₹7 Crore → Win page

📊 More than 10,000 questions stored safely in database

🔁 Random questions for every new user


💰 Prize Ladder
Question	Amount
1	₹10,000
2	₹20,000
3	₹40,000
4	₹80,000
5	₹1,60,000
6	₹3,20,000
7	₹6,40,000
8	₹12,50,000
9	₹25,00,000
10	₹50,00,000
11	₹1 Crore
12	₹7 Crore

🌐 Deployment & Access

Server: Apache Tomcat 9

Localhost: http://localhost:8089

Mobile Access:

Connect mobile to laptop hotspot

Use Laptop IPv4 address

Example: http://<IPv4_Address>:8089


📌 Future Enhancements

User score history

Admin panel for question management

Sound effects and animations

Online cloud deployment

👨‍💻 Developed By Dev Pathak
📌 Java Web Application Developer


