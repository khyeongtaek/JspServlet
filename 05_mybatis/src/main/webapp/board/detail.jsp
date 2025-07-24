<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.title} - 게시글 상세보기</title>
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
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .board-detail {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .board-header {
            border-bottom: 2px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .board-title {
            font-size: 2em;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .board-info {
            display: flex;
            justify-content: space-between;
            color: #666;
            font-size: 0.9em;
        }

        .board-content {
            min-height: 300px;
            line-height: 1.8;
            white-space: pre-wrap;
            margin: 20px 0;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 5px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-back {
            background-color: #6c757d;
            color: white;
        }

        .btn-modify {
            background-color: #007bff;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px auto;
            }

            .board-title {
                font-size: 1.5em;
            }

            .board-info {
                flex-direction: column;
                gap: 5px;
            }

            .button-group {
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
    <div class="board-detail">
        <div class="board-header">
            <h1 class="board-title">${board.title}</h1>
            <div class="board-info">
                <span>작성자: ${board.user.nickname}</span>
                <span>작성일: ${board.createdAt}</span>
                <c:if test="${board.modifiedAt != null}">
                    <span>수정일: ${board.modifiedAt}</span>
                </c:if>
            </div>
        </div>

        <div class="board-content">
            ${board.content}
        </div>

        <div class="button-group">
            <a href="${contextPath}/board/list.do" class="btn btn-back">목록으로</a>
            <a href="${contextPath}/board/modifyForm.do?bid=${board.bid}&code=modify" class="btn btn-modify">수정하기</a>
            <a href="javascript:void(0);"
               onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='${contextPath}/board/remove.do?bid=${board.bid}'; }"
               class="btn btn-delete">삭제하기</a>
        </div>
    </div>
</div>
</body>
</html>