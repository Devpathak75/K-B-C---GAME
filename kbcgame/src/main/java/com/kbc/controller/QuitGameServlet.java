package com.kbc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/quitGame")
public class QuitGameServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer lastCorrectPrize = (Integer) session.getAttribute("lastCorrectPrize");

        int finalAmount = 0;

        // ✅ KBC LOGIC: jitna ab tak jeeta hai, wahi milega
        if (lastCorrectPrize != null) {
            finalAmount = lastCorrectPrize;
        }

        session.setAttribute("finalAmount", finalAmount);
        session.setAttribute("gameStatus", "QUIT");

        // ✅ QUIT ke liye alag JSP
        response.sendRedirect("quit.jsp");
    }
}
