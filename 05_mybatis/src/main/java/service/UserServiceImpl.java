package service;

import controller.servlet.ActionForward;
import dao.UserDao;
import model.dto.UserDTO;

import javax.servlet.http.HttpServletRequest;

public class UserServiceImpl implements UserService {
    private final UserDao dao = UserDao.getInstance();

    @Override
    public ActionForward login(HttpServletRequest request) {
        ActionForward af;
        String contextPath = request.getContextPath();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDTO dto = new UserDTO();
        dto.setEmail(email);
        dto.setPassword(password);

        dto = dao.getUser(dto);

        if (dto == null) {
            request.setAttribute("errMsg", "아이디나 비밀번호를 확인하세요.");
            af = new ActionForward("/view/user/login.jsp", false);
        } else {
            request.getSession().setAttribute("user", dto);
            af = new ActionForward(contextPath + "/main", true);
        }

        return af;
    }

    @Override
    public ActionForward logout(HttpServletRequest request) {
        request.getSession().invalidate();
        ActionForward af = new ActionForward(request.getContextPath()+ "/main", true);
        return af;
    }
}
