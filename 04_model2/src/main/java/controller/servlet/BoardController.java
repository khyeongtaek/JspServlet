package controller.servlet;


import service.BoardService;
import service.BoardServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardService boardService = new BoardServiceImpl();
        ActionForward af = null;
        String servletPath = request.getServletPath();

        request.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "text/html; charset=UTF-8");


        switch (servletPath) {
            case "/main.do":
                af = new ActionForward("/main.jsp", false);
                break;
            case "/board/list.do":
                af = boardService.getBoards(request);
                break;
            case "/board/detail.do":
                af = boardService.getBoardById(request);
                break;
            case "/board/registForm.do":
                af = new ActionForward("/board/regist.jsp", false);
                break;
            case "/board/regist.do":
                af = boardService.registBoard(request);
                break;
            case "/board/remove.do":
                af = boardService.removeBoard(request);
                break;
            case "/board/modifyForm.do":
                af = new ActionForward("/board/modify.jsp", false);
                break;
            case "/board/modify.do":
                af = new ActionForward("/board/detail.jsp", true);
                break;
            default:
                af = new ActionForward(request.getContextPath()+"/main.jsp", true);
        }

        if(af.isRedirect()) {
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
