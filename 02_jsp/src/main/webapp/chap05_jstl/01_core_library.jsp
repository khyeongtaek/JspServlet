<%@ page import="chap05_jstl.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: kht
  Date: 2025. 7. 22.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:set var="name" value="aaa" scope="page"/>
<c:set var="name" value="aaa" scope="request"/>
<c:set var="name" value="aaa" scope="session"/>
<c:set var="name" value="aaa" scope="application"/>


<select>
    <c:forEach var="x" begin="1" end="13" step="1">
        <option>${x}월</option>
    </c:forEach>
</select>

<%
    request.setAttribute("names", new String[]{"김말순", "최미자", "남궁연"});
%>
<c:forEach var="item" items="${names}" varStatus="i">
    <div>${item}은 ${i.index}에 있음, ${i.count}번째임</div>

</c:forEach>

<%
    List<Product> productList = new ArrayList<>();
    Product product = new Product();
    product.setModel("리모콘");
    product.setPrice(10000);
    productList.add(product);
    product = new Product();
    product.setModel("콘모리");
    product.setPrice(20000);
    productList.add(product);
    request.setAttribute("products", productList);

%>

<table border="1">
    <thead>
    <tr>
        <th>인덱스</th>
        <th>모델</th>
        <th>가격</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty products}">
        <c:forEach var="product" items="${products}" varStatus="vs">
            <tr>
                <td>${vs.index}</td>
                <td>${product.model}</td>
                <td>${product.price}</td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty products}">
        <tr>
            <td colspan="3">제품이 없습니다.</td>
        </tr>
    </c:if>
    </tbody>
</table>


</body>
</html>
