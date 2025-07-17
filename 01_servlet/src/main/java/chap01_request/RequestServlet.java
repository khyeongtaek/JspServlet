package chap01_request;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;

@WebServlet({"*.do"})
public class RequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getContextPath();
        String requestURI = request.getRequestURI();
        String servletPath = request.getServletPath();
        String remoteAddr = request.getRemoteAddr();
        String remoteHost = request.getRemoteHost();
        String remotePort = String.valueOf(request.getRemotePort());
        String remoteUser = request.getRemoteUser();

        System.out.println( "contextPath: " + contextPath);
        System.out.println( "requestURI: " + requestURI);
        System.out.println( "servletPath: " + servletPath);
        System.out.println( "remoteAddr: " + remoteAddr);
        System.out.println( "remoteHost: " + remoteHost);
        System.out.println( "remotePort: " + remotePort);
        System.out.println( "remoteUser: " + remoteUser);


        String p1 = request.getParameter("p1")+10;
        String p2 = request.getParameter("p2");
        String p3 = request.getParameter("p3");
        String p4 = Optional.ofNullable(request.getParameter("p4")).orElse("디폴트");

        System.out.println( "p1: " + p1);
        System.out.println( "p2: " + p2);
        System.out.println( "p3: " + p3);
        System.out.println( "p4: " + p4);



        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }


}
