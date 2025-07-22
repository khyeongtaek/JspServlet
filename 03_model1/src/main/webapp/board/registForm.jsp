<%@ page import="java.util.List" %>
<%@ page import="model.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="java.util.stream.Collectors" %><%--
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
    <%
        List<BoardDTO> boards = BoardDAO.getInstance().getBoards();
        ArrayList<Integer> uidList =
                boards.stream().map(board -> board.getUser().getUid())
                        .distinct()
                        .collect(Collectors.toCollection(ArrayList::new));

        pageContext.setAttribute("uidList", uidList);
    %>
</head>
<body>

<h1>신규 게시글 등록 화면</h1>
<form action="${contextPath}/board/regist.jsp"
      method="post">
    <lable for="uid">작성자</lable>
    <select name="uid" id="uid">
        <c:forEach var="uid" items="${uidList}">
            <option>${uid}</option>
        </c:forEach>
    </select>
    <br>
    <lable for="title">제목</lable>
    <input type="text" name="title" id="title">
    <br>
    <lable for="content">내용</lable>
    <textarea name="content" id="content" rows="5" cols="30"></textarea>
    <br>
    <button type="submit">등록하기</button>
    <button type="button" onclick="list()">목록보기</button>

    <script>
        function list() {
            location.href = "${contextPath}/board/list.jsp";
        }
    </script>


</form>

</body>
</html>
