<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: kht
  Date: 2025. 7. 22.
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setAttribute("today", new Date());
%>

<div><fmt:formatDate value = "${today}" pattern="yyyy년 MM월 dd일 E요일"/></div>
<div><fmt:formatDate value = "${today}" pattern="a h:mm:ss"/></div>
<div><fmt:formatDate value = "${today}" pattern="HH:mm:ss.SSS"/></div>

</body>
</html>
