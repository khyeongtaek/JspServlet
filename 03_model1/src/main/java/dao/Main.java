package dao;

import model.dto.BoardDTO;
import model.dto.UserDTO;

public class Main {
    public static void main(String[] args) {
        BoardDAO boardDAO = BoardDAO.getInstance();

        System.out.println(boardDAO.getBoards());
        System.out.println(boardDAO.getBoardById(1));
    }
}
