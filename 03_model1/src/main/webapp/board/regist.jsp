<%@ page import="model.dto.UserDTO" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page import="dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: kht
  Date: 2025. 7. 22.
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%

    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    UserDTO user = new UserDTO();
    user.setUid(Integer.parseInt(uid));
    BoardDTO board = new BoardDTO();
    board.setUser(user);
    board.setTitle(title);
    board.setContent(content);

    int cnt = BoardDAO.getInstance().insertBoard(board);

    String msg = "게시글 등록 실패";
    String url = "registForm.jsp";
    if (cnt == 1) {
        msg = "게시글 등록 성공";
        url = "list.jsp";
    }

%>

<script>
    alert("<%=msg%>");
    location.href="${contextPath}/board/<%=url%>";
</script>