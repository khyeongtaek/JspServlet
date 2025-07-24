package controller.servlet;


import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserServiceImpl();
        ActionForward af = null;

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = requestURI.substring(contextPath.length());


        switch (path.substring("/user/".length())) {
            case "loginForm":
                af = new ActionForward("/view/user/login.jsp", false);
                break;
            case "login":
                af = userService.login(request);
                break;
            case "logout":
                af = userService.logout(request);
                break;
            default:
                af = new ActionForward(request.getContextPath() + "/main", true);
                break;
        }


        if (af.isRedirect()) {
            response.sendRedirect(af.getView());
        } else {
            request.getRequestDispatcher(af.getView()).forward(request, response);
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
