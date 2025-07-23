<%@ page import="dao.BoardDAO" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page import="model.dto.UserDTO" %>
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
    BoardDTO board = new BoardDTO();

    try {
        bid = Integer.parseInt(request.getParameter("bid"));
        board = BoardDAO.getInstance().getBoardById(bid);
        pageContext.setAttribute("board", board);
    } catch (Exception e) {
        UserDTO user = new UserDTO();
        user.setNickname("잘못된페이지!!!!!!!!!!!!");

        board.setUser(user);
        board.setTitle("잘못된페이지!!!!!!!!!!!!");
        board.setContent("잘못된페이지!!!!!!!!!!!!잘못된페이지!!!!!!!!!!!!잘못된페이지!!!!!!!!!!!!잘못된페이지!!!!!!!!!!!!잘못된페이지!!!!!!!!!!!!");

        pageContext.setAttribute("board", board);
    }


%>

<h1>${board.title}</h1>
<div>작성자번호: ${board.user.uid}</div>
<div>작성자닉네임: ${board.user.nickname}</div>
<div>최초작성일시: ${board.createdAt}</div>
<div>최종수정일시: ${board.modifiedAt}</div>

<hr>

<pre>${board.content}</pre>

<hr>

<button onclick="list()">목록보기</button>
<c:if test="${board.bid ne 0}">
    <button onclick="deleteBoard()">삭제하기</button>
</c:if>

<script type="text/javascript">
    function list() {
        location.href = "${contextPath}/board/list.jsp";
    }

    function deleteBoard() {
        if (confirm("현재 게시글을 삭제할까요?"))
            location.href = "${contextPath}/board/remove.jsp?bid=${board.bid}";
    }
</script>

</body>
</html>