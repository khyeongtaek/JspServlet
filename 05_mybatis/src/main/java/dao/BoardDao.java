package dao;

import model.dto.BoardDTO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class BoardDao {
    private SqlSessionFactory factory;
    private BoardDao() {
        try {
            InputStream in = Resources.getResourceAsStream("mybatis/mybatis-config.xml");
            factory = new SqlSessionFactoryBuilder().build(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    private static final BoardDao dao = new BoardDao();
    public static BoardDao getInstance() {
        return dao;
    }

    public int deleteBoard(int bid) {
        return 0;
    }

    public int insertBoard(BoardDTO board) {
        return 0;
    }

    public int updateBoard(BoardDTO board) {
        return 0;
    }

    public Object getBoards() {
        return null;
    }

    public Object getBoardById(int bid) {
                return null;

    }
}
