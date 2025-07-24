package service;

import controller.servlet.ActionForward;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
    ActionForward getBoards(HttpServletRequest request);
    ActionForward getBoardById(HttpServletRequest request);
    ActionForward registBoard(HttpServletRequest request);
    ActionForward removeBoard(HttpServletRequest request);
    ActionForward modifyBoard(HttpServletRequest request);


}
