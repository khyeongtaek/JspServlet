package dao;

import lombok.Data;
import model.dto.BoardDTO;
import model.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
public class BoardDAO {

    private BoardDAO() {
    }

    private static BoardDAO instance;

    public static BoardDAO getInstance() {
        if (instance == null) instance = new BoardDAO();
        return instance;
    }

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    public List<BoardDTO> getBoards() {
        List<BoardDTO> list = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            sql = "SELECT bid, uid, title, content, created_at, modified_at FROM tbl_board order by created_at desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int bid = rs.getInt(1);
                int uid = rs.getInt(2);
                String title = rs.getString(3);
                String content = rs.getString(4);
                Timestamp createdAt = rs.getTimestamp(5);
                Timestamp modifiedAt = rs.getTimestamp(6);

                BoardDTO dto = new BoardDTO();
                dto.setBid(bid);
                UserDTO userDTO = new UserDTO();
                userDTO.setUid(uid);
                dto.setUser(userDTO);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setCreatedAt(createdAt);
                dto.setModifiedAt(modifiedAt);
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtils.close(con, ps, rs);
        }

        return list;
    }

    public BoardDTO getBoardById(int bid) {
        BoardDTO dto = null;

        try {
            con = DBUtils.getConnection();
            sql = "SELECT bid, uid, title, content, created_at, modified_at FROM tbl_board WHERE bid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            rs = ps.executeQuery();
            if (rs.next()) {
                int uid = rs.getInt(2);
                String title = rs.getString(3);
                String content = rs.getString(4);
                Timestamp createdAt = rs.getTimestamp(5);
                Timestamp modifiedAt = rs.getTimestamp(6);

                dto = new BoardDTO();
                dto.setBid(bid);
                UserDTO userDTO = new UserDTO();
                userDTO.setUid(uid);
                dto.setUser(userDTO);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setCreatedAt(createdAt);
                dto.setModifiedAt(modifiedAt);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtils.close(con, ps, rs);
        }
        return dto;
    }


    public int insertBoard(BoardDTO dto) {
        int cnt = 0;

        try {
            con = DBUtils.getConnection();
            sql = "INSERT INTO tbl_board(uid, title, content) VALUES(?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, dto.getUser().getUid());
            ps.setString(2, dto.getTitle());
            ps.setString(3, dto.getContent());
            cnt = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtils.close(con, ps, rs);
        }
        return cnt;
    }

    public int deleteBoardById(int bid) {
        int cnt = 0;

        try {
            con = DBUtils.getConnection();
            sql = "DELETE FROM tbl_board WHERE bid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            cnt = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBUtils.close(con, ps, rs);
        }
        return cnt;
    }


}
