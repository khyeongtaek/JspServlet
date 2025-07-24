package service;

import controller.servlet.ActionForward;
import dao.BoardDao;
import dao.BoardDaoImpl;
import model.dto.BoardDTO;
import model.dto.UserDTO;

import javax.servlet.http.HttpServletRequest;

public class BoardServiceImpl implements BoardService {

    BoardDao dao = BoardDaoImpl.getInstance();

    @Override
    public ActionForward getBoards(HttpServletRequest request) {
        request.setAttribute("boards", dao.getBoards());
        return new ActionForward("/board/list.jsp", false);
    }

    @Override
    public ActionForward getBoardById(HttpServletRequest request) {
        String code = request.getParameter("code");
        ActionForward af = new ActionForward("/board/detail.jsp", false);

        try {
            if ("modify".equals(code)) {
                af.setView("/board/modify.jsp");
            }
            request.setAttribute("board",
                    dao.getBoardById(
                            Integer.parseInt(request.getParameter("bid"))
                    )
            );

        } catch (Exception e) {
            BoardDTO dto = new BoardDTO();
            UserDTO user = new UserDTO();
            user.setNickname("잘못된 접근!!!!!!!!!!!!!!!");
            dto.setUser(user);
            dto.setContent("잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n");
            dto.setTitle("잘못된 접근!!!!!!!!!!!!!!!");
            dto.setBid(0);
            request.setAttribute("board", dto);
            af = new ActionForward("/board/detail.jsp", false);
        }
        return af;
    }

    @Override
    public ActionForward registBoard(HttpServletRequest request) {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        BoardDTO board = new BoardDTO();
        board.setUser(new UserDTO());
        board.getUser().setUid(uid);
        board.setTitle(title);
        board.setContent(content);
        int cnt = dao.insertBoard(board);

        String view = null;
        if (cnt == 1) {
            view = "/board/list.do";
        } else {
            view = "/board/registForm.do";
        }
        return new ActionForward(request.getContextPath() + view, true);
    }

    @Override
    public ActionForward removeBoard(HttpServletRequest request) {
        ActionForward af = new ActionForward("/board/list.jsp", false);
        int bid = 0;

        try {
            bid = Integer.parseInt(request.getParameter("bid"));
        } catch (Exception e) {
            BoardDTO dto = new BoardDTO();
            UserDTO user = new UserDTO();
            user.setNickname("잘못된 접근!!!!!!!!!!!!!!!");
            dto.setUser(user);
            dto.setContent("잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n잘못된 접근!!!!!!!!!!!!!!!\n");
            dto.setTitle("잘못된 접근!!!!!!!!!!!!!!!");
            dto.setBid(0);
            request.setAttribute("board", dto);
            af.setView("/board/detail.jsp");
        }

        int cnt = dao.deleteBoard(bid);

        String view = null;
        if (cnt == 1) {
            view = "/board/list.do";
        } else {
            view = "/main.do";
        }
        return new ActionForward(request.getContextPath() + view, true);
    }

    @Override
    public ActionForward modifyBoard(HttpServletRequest request) {
        int bid = Integer.parseInt(request.getParameter("bid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        BoardDTO board = new BoardDTO();
        board.setBid(bid);
        board.setTitle(title);
        board.setContent(content);

        int cnt = dao.updateBoard(board);

        String view = null;
        if (cnt == 1) {
            view = "/board/detail.do?bid=" + bid + "&code=detail";
        } else {
            view = "/board/modifyForm.do?bid=" + bid + "&code=modify";
        }
        return new ActionForward(request.getContextPath() + view, true);
    }
}
