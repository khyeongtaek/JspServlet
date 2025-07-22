<%@ page import="java.util.List" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
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
<html>
<head>
    <title>Title</title>
</head>

<%
    List<BoardDTO> boards = BoardDAO.getInstance().getBoards();
    pageContext.setAttribute("boards", boards);
%>

<body>
<h1>Board 목록 보기</h1>
<a href="${contextPath}/board/registForm.jsp">게시글등록하러가기</a>
<table border="1">
    <thead>
    <tr>
        <th>게시글번호</th>
        <th>작성자번호</th>
        <th>제목</th>
        <th>작성일시</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty boards}">
        <tr>
            <td colspan="4">첫 게시글의 주인공이 되어 보세요.</td>
        </tr>
    </c:if>
    <c:if test="${not empty boards}">
        <c:forEach items="${boards}" var="board">
            <tr>
                <td>${board.bid}</td>
                <td>${board.user.uid}</td>
                <td>${board.title}</td>
                <td>${board.createdAt}</td>
            </tr>
        </c:forEach>
    </c:if>

    </tbody>
</table>
</body>
</html>
