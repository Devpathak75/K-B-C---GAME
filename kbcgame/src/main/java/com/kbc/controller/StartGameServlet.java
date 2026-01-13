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

@WebServlet("/startGame")
public class StartGameServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        HttpSession session = request.getSession();

        // 🔥🔥🔥 VERY IMPORTANT RESET 🔥🔥🔥
        session.invalidate();                 // purana session destroy
        session = request.getSession(true);   // naya session create

        session.setAttribute("username", username);
        session.setAttribute("questionNumber", 1);

        // ✅ LIFELINES RESET
        session.setAttribute("fiftyUsed", false);
        session.setAttribute("audienceUsed", false);
        session.setAttribute("callUsed", false);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/kbc_game",
                    "root",
                    "devpathak"
            );

            String sql = "SELECT * FROM questions WHERE q_id = 1";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("qid", rs.getInt("q_id"));
                session.setAttribute("question", rs.getString("question"));
                session.setAttribute("a", rs.getString("option_a"));
                session.setAttribute("b", rs.getString("option_b"));
                session.setAttribute("c", rs.getString("option_c"));
                session.setAttribute("d", rs.getString("option_d"));
                session.setAttribute("answer", rs.getString("correct_option"));
                session.setAttribute("prize", rs.getInt("prize_amount"));
            }

            con.close();
            response.sendRedirect("question.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
