<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <style>
        .board-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .board-item {
            width: calc(20% - 16px); /* 한 줄에 5개를 위한 너비 설정 */
            height: 150px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            flex-shrink: 0; /* 크기 고정 */
            box-sizing: border-box;
        }
        
        .board-item:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .board-title {
            font-size: 1.1em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
            /* 긴 제목 처리 */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .board-info {
            font-size: 0.9em;
            color: #666;
        }
        
        .board-date {
            margin-top: 10px;
            font-size: 0.8em;
            color: #999;
        }
        
        .register-btn {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .register-btn:hover {
            background-color: #0056b3;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* 반응형 처리 제거 - 항상 5개씩 유지 */
        @media (max-width: 1200px) {
            .board-container {
                padding: 10px;
            }
            .board-item {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<h1>게시글 목록</h1>

<div style="text-align: center;">
    <a href="${contextPath}/board/registForm.do" class="register-btn">게시글 등록하기</a>
</div>

<div class="board-container">
    <c:if test="${empty boards}">
        <div>첫 게시글의 주인공이 되어 보세요.</div>
    </c:if>
    <c:if test="${not empty boards}">
        <c:forEach var="board" items="${boards}">
            <div class="board-item" onclick="location.href='${contextPath}/board/detail.do?bid=${board.bid}'">
                <div class="board-title">${board.title}</div>
                <div class="board-info">
                    작성자: ${board.user.nickname}
                    <br>
                    글번호: ${board.bid}
                </div>
                <div class="board-date">${board.createdAt}</div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
</html>