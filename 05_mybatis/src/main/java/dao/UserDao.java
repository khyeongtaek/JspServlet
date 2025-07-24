package dao;

import model.dto.UserDTO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class UserDao {
    private SqlSessionFactory factory;
    private UserDao() {
        try {
            InputStream in = Resources.getResourceAsStream("mybatis/mybatis-config.xml");
            factory = new SqlSessionFactoryBuilder().build(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    private static final UserDao dao = new UserDao();
    public static UserDao getInstance() {
        return dao;
    }

    public UserDTO getUser(UserDTO dto) {
        SqlSession ss = factory.openSession();
        UserDTO userDto = ss.selectOne("mybatis.userMapper.getUser", dto);
        ss.close();
        return userDto;
    }
}
