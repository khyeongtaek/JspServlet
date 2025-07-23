<%@ page import="model.dto.UserDTO" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%

    request.setCharacterEncoding("UTF-8");
    int bid;

    try {
        bid = Integer.parseInt(request.getParameter("bid"));
    } catch (Exception e) {
        bid = 0;
    }
    int count = BoardDAO.getInstance().deleteBoard(bid);

    String msg = "게시글 삭제 실패";
    String url = "list.jsp";
    if (count == 1) {
        msg = "게시글 삭제 성공";
    }
%>

<script>
    alert("<%=msg%>");
    location.href = "<%=url%>";
</script>

</body>
</html>