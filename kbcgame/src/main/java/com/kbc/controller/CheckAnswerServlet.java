package com.kbc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkAnswer")
public class CheckAnswerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // ---------------- LIFELINE FLAGS ----------------
        if ("true".equals(request.getParameter("used50")))
            session.setAttribute("fiftyUsed", true);
        if ("true".equals(request.getParameter("usedAud")))
            session.setAttribute("audienceUsed", true);
        if ("true".equals(request.getParameter("usedCall")))
            session.setAttribute("callUsed", true);
        // ------------------------------------------------

        String userAnswer = request.getParameter("answer");
        String correctAnswer = (String) session.getAttribute("answer");

        int questionNumber = (int) session.getAttribute("questionNumber");
        int currentPrize = (int) session.getAttribute("prize");

        // ---------------- SAFETY LEVEL TRACK ----------------
        if (currentPrize == 10000) {
            session.setAttribute("lastSafePrize", 10000);
        }
        if (currentPrize == 320000) {
            session.setAttribute("lastSafePrize", 320000);
        }
        // ---------------------------------------------------

        // ---------------- ANSWER CHECK ----------------
        if (userAnswer != null && userAnswer.equals(correctAnswer)) {

            session.setAttribute("lastCorrectPrize", currentPrize);

            // ---------------- WIN CONDITION ----------------
            if (currentPrize >= 70000000) {
                session.setAttribute("finalAmount", currentPrize);
                response.sendRedirect("win.jsp");
                return;
            }

            // ---------------- NEXT QUESTION ----------------
            questionNumber++;
            session.setAttribute("questionNumber", questionNumber);

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/kbc_game",
                        "root",
                        "devpathak"
                );

                PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM questions WHERE q_id=?");
                ps.setInt(1, questionNumber);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    session.setAttribute("question", rs.getString("question"));
                    session.setAttribute("a", rs.getString("option_a"));
                    session.setAttribute("b", rs.getString("option_b"));
                    session.setAttribute("c", rs.getString("option_c"));
                    session.setAttribute("d", rs.getString("option_d"));
                    session.setAttribute("answer", rs.getString("correct_option"));
                    session.setAttribute("prize", rs.getInt("prize_amount"));

                    response.sendRedirect("question.jsp");

                } else {
                    // agar question khatam ho gaye
                    session.setAttribute("finalAmount", currentPrize);
                    response.sendRedirect("win.jsp");
                }

                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            // ---------------- WRONG ANSWER ----------------
            Integer safePrize = (Integer) session.getAttribute("lastSafePrize");

            int finalAmount = 0;

            if (safePrize != null) {
                finalAmount = safePrize;   // 10k ya 3.2L
            } else {
                finalAmount = 0;           // koi safety cross nahi
            }

            session.setAttribute("finalAmount", finalAmount);
            response.sendRedirect("gameover.jsp");
        }
    }
}
