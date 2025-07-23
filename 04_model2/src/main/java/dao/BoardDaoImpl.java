package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.dto.BoardDTO;
import model.dto.UserDTO;

/*
 * DAO (Data Access Object)
 *
 * 1. 데이터베이스와의 연결, 데이터 조회/삽입/수정/삭제(CRUD) 등 데이터 접근 작업을 수행하는 객체입니다.
 * 2. 비즈니스 로직과 데이터베이스 로직을 분리하여 코드 구조화, 쉬운 유지보수, 코드 재사용성 등을 얻을 수 있습니다.
 * 3. 인터페이스를 통해 DAO 객체를 생성하면 구현체를 자유롭게 변경할 수 있습니다.
 */

public class BoardDaoImpl implements BoardDao {

    //----- Singleton Pattern으로 객체 생성하기 (애플리케이션 전체에서 객체를 하나만 제공)
    // 1. private 생성자 (외부에서는 BoardDAO 객체 생성 금지)
    // 2. 내부에서 BoardDAO 객체 생성
    // 3. 생성한 BoardDAO 객체를 반환하는 메소드 제공

    private BoardDaoImpl() {

    }

    private static final BoardDao dao = new BoardDaoImpl();

    public static BoardDao getInstance() {
        return dao;
    }

    //----- 모든 메소드가 공통으로 사용할 필드
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://kwonht.synology.me:33307/db_jdbc?characterEncoding=UTF-8&serverTimezone=UTC",
                    "user", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    @Override
    public void close() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //----- 조회 (목록)
    public List<BoardDTO> getBoards() {
        List<BoardDTO> boards = new ArrayList<BoardDTO>();
        try {
            con = getConnection();
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.bid, u.uid, u.nickname, b.title, b.content, b.created_at, b.modified_at")
                    .append(" FROM tbl_board b JOIN tbl_user u")
                    .append(" ON b.uid = u.uid")
                    .append(" ORDER BY b.bid DESC")
                    .append(" LIMIT 0, 10");
            sql = sb.toString();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                //----- DB에서 가져온 결과 ResultSet
                int bid = rs.getInt(1);
                int uid = rs.getInt(2);
                String nickname = rs.getString(3);
                String title = rs.getString(4);
                String content = rs.getString(5);
                Timestamp createdAt = rs.getTimestamp(6);
                Timestamp modifiedAt = rs.getTimestamp(7);
                //----- 결과 ResultSet를 BoardDTO로 변환
                BoardDTO board = new BoardDTO();
                board.setBid(bid);
                UserDTO user = new UserDTO();
                user.setUid(uid);
                user.setNickname(nickname);
                board.setUser(user);
                board.setTitle(title);
                board.setContent(content);
                board.setCreatedAt(createdAt);
                board.setModifiedAt(modifiedAt);
                //----- 변환된 BoardDTO를 List에 저장
                boards.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return boards;
    }

    //----- 조회 (단일 항목)
    public BoardDTO getBoardById(int bid) {
        BoardDTO board = null;
        try {
            con = getConnection();
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.bid, u.uid, u.nickname, b.title, b.content, b.created_at, b.modified_at")
                    .append(" FROM tbl_board b JOIN tbl_user u")
                    .append(" ON b.uid = u.uid")
                    .append(" WHERE bid = ?");
            sql = sb.toString();
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);  // 쿼리문의 1번째 Placeholder(?)에 bid 전달하기
            rs = ps.executeQuery();
            if (rs.next()) {
                //----- DB에서 가져온 결과 ResultSet를 BoardDTO로 변환
                board = new BoardDTO();
                board.setBid(rs.getInt(1));
                UserDTO user = new UserDTO();
                user.setUid(rs.getInt(2));
                user.setNickname(rs.getString(3));
                board.setUser(user);
                board.setTitle(rs.getString(4));
                board.setContent(rs.getString(5));
                board.setCreatedAt(rs.getTimestamp(6));
                board.setModifiedAt(rs.getTimestamp(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return board;
    }

    //----- 삽입 (삽입된 행의 개수 반환)
    public int insertBoard(BoardDTO board) {
        int count = 0;
        try {
            con = getConnection();
            sql = "INSERT INTO tbl_board(uid, title, content) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, board.getUser().getUid());
            ps.setString(2, board.getTitle());
            ps.setString(3, board.getContent());
            count = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }

    //----- 삭제 (삭제된 행의 개수 반환)
    public int deleteBoard(int bid) {
        int count = 0;
        try {
            con = getConnection();
            sql = "DELETE FROM tbl_board WHERE bid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            count = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }

    @Override
    public int updateBoard(BoardDTO board) {
        int count = 0;
        try {
            con = getConnection();
            sql = "UPDATE tbl_board SET title = ?, content = ?, modified_at = CURRENT_TIMESTAMP() WHERE bid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, board.getTitle());
            ps.setString(2, board.getContent());
            ps.setInt(3, board.getBid());
            count = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }

}