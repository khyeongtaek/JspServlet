package controller.servlet;


import service.BoardService;
import service.BoardServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardService boardService = new BoardServiceImpl();
        ActionForward af = null;

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = requestURI.substring(contextPath.length());


        switch (path.substring("/board/".length())) {
            case "list":
                af = boardService.getBoards(request);
                break;
            case "detail":
            case "modifyForm":
                af = boardService.getBoardById(request);
                break;
            case "registForm":
                af = new ActionForward("/view/board/regist.jsp", false);
                break;
            case "regist":
                af = boardService.registBoard(request);
                break;
            case "remove":
                af = boardService.removeBoard(request);
                break;
            case "modify":
                af = boardService.modifyBoard(request);
                break;
            default:
                af = new ActionForward(request.getContextPath() + "/main", true);
        }

        if (af.isRedirect()) {
            response.sendRedirect(af.getView());
        } else {
            request.getRequestDispatcher(af.getView()).forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
