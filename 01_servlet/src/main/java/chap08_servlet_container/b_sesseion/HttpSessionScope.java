package chap08_servlet_container.b_sesseion;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/HttpSessionScope")
public class HttpSessionScope extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        session.setMaxInactiveInterval(60 * 30);

        session.setAttribute("data2", true);

        boolean data2 = (boolean) session.getAttribute("data2");
        System.out.println("data2: " + data2);

        session.invalidate();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
