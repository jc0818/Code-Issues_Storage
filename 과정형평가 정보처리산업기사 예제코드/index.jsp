<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>매장별 커피 판매관리 ver 1.0</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section><h4>매장별 커피 판매관리 프로그램</h4>
<pre style="text-align: left;">
매장별 커피 판매를 관리하기 위한 프로그램이다.

1.상품테이블, 매장테이블, 판매테이블을 추가한다.
2.판매등록, 판매현황, 매장별판매액, 상품별판매액 페이지를 작성한다.
3.올바르게 구현되었는지 확인한다.
</pre></section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>