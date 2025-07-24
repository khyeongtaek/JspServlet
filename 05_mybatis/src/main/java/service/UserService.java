package service;

import controller.servlet.ActionForward;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    ActionForward login(HttpServletRequest request);
    ActionForward logout(HttpServletRequest request);

}
