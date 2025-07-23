<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
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
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2em;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #007bff;
            outline: none;
        }

        textarea {
            min-height: 300px;
            resize: vertical;
        }

        .author-info {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            flex: 1;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
            flex: 1;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시글 수정</h1>
        
        <form action="${contextPath}/board/modify.do" method="post">
            <input type="hidden" name="bid" value="${board.bid}">
            <input type="hidden" name="uid" value="${board.user.uid}">
            
            <div class="author-info">
                <label>작성자</label>
                <div>${board.user.nickname}</div>
            </div>
            
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" value="${board.title}" required>
            </div>
            
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" required>${board.content}</textarea>
            </div>
            
            <div class="button-group">
                <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
                <button type="submit" class="btn btn-primary">수정완료</button>
            </div>
        </form>
    </div>
</body>
</html>