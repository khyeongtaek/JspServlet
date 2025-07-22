<%@ page import="chap04_el.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: kht
  Date: 2025. 7. 22.
  Time: 오전 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    pageContext.setAttribute("name","aaa");
    request.setAttribute("name","bbb");
    session.setAttribute("name","ccc");
    application.setAttribute("name","ddd");
%>
<div>${name}</div>
<div>${requestScope.name}</div>
<div>${sessionScope.name}</div>
<div>${applicationScope.name}</div>

<%
    Product product = new Product();
    product.setModel("리모콘");
    product.setPrice(10000);
    request.setAttribute("product",product);

%>
<div>${product}</div>
<div>${product.model}</div>
<div>${product.price}</div>
<div>${product["model"]}</div>
<div>${product["price"]}</div>

<hr>
<%
    Map<String, Object> map = new HashMap<>();
    map.put("model", "텀블러");
    map.put("price", 15000);
    request.setAttribute("map", map);
%>
<div>${map.model}</div>
<div>${map.price}</div>
<div>${map["model"]}</div>
<div>${map["price"]}</div>

<hr>
<%
    List<Product> productList = new ArrayList<>();
    product.setModel("테슬라");
    product.setPrice(100000);
    productList.add(product);
    request.setAttribute("productList",productList);
%>

<div>${productList[0].model}</div>
<div>${productList[0].price}</div>
<div>${productList[0]["model"]}</div>
<div>${productList[0]["price"]}</div>

<hr>
<%
    request.setAttribute("a", 5);
    request.setAttribute("b", 2);
%>

<div>a + b = ${a + b}</div>
<div>a - b = ${a - b}</div>
<div>a * b = ${a * b}</div>
<div>a / b = ${a / b}</div>
<div>a / b = ${a div b}</div>
<div>a % b = ${a % b}</div>
<div>a % b = ${a mod b}</div>

<hr>

<div>a > b : ${a > b}, ${a gt b}</div>
<div>a >= b : ${a >= b}, ${a ge b}</div>
<div>a < b : ${a < b}, ${a lt b}</div>
<div>a <= b : ${a <= b}, ${a le b}</div>
<div>a == b : ${a == b}, ${a eq b}</div>
<div>a != b : ${a != b}, ${a ne b}</div>

<hr>

<div>a == 5 && b == 5 : ${a == 5 && b == 5}, ${a eq 5 and b eq 5}</div>
<div>a == 5 || b == 5 : ${a == 5 || b == 5}, ${a eq 5 or b eq 5}</div>
<div>!(a == 5) : ${!(a == 5)}, ${not(a eq 5)}</div>

<hr>

<div>${a > 0 ? "양수" : "음수"}</div>

<hr>

<div>a와 b 문자열 연결 : ${a+=b}</div>

<hr>

<%
    request.setAttribute("list", new ArrayList<>());
%>

<div>List가 비어있는가? ${empty list}</div>
<div>List가 비어있지 않는가? ${not empty list}</div>

<hr>

<a href="${pageContext.request.contextPath}/RequestDataHandle">요청</a>

</body>
</html>
