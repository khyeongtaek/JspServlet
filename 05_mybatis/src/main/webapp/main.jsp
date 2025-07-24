<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f5f5f5;
            color: #333;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2.5em;
        }

        .welcome-box {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            font-size: 1.2em;
            color: #495057;
        }

        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: all 0.3s ease;
            text-decoration: none;
            color: white;
            display: inline-block;
        }

        .btn-login {
            background-color: #007bff;
        }

        .btn-logout {
            background-color: #dc3545;
        }

        .btn-boards {
            background-color: #28a745;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .nav-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>게시판 서비스</h1>

    <c:if test="${empty sessionScope.user}">
        <div class="welcome-box">
            로그인하여 서비스를 이용해보세요.
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.user}">
        <div class="welcome-box">
            <strong>${sessionScope.user.nickname}</strong>님 환영합니다!
        </div>
    </c:if>

    <div class="nav-buttons">
        <c:if test="${empty sessionScope.user}">
            <a href="${contextPath}/user/loginForm" class="btn btn-login">로그인</a>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <a href="${contextPath}/user/logout" class="btn btn-logout">로그아웃</a>
            <a href="${contextPath}/board/list" class="btn btn-boards">게시판으로 이동</a>
        </c:if>

    </div>
</div>
</body>
</html>