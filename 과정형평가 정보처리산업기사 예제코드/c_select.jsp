<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

String opt = Util.getParamNN(request.getParameter("opt"));
String value = Util.getParamNN(request.getParameter("value"));

Connection conn = null;
Statement stmt = null;
//String callback = "";
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = 
			"SELECT "+
		    "tsl.saleno, "+
		    "tp.pcode, "+
		    "TO_CHAR(tsl.saledate, 'YYYY-MM-DD') saledate, "+
		    "ts.scode, "+
		    "tp.name, "+
		    "tsl.amount, "+
		    "TO_CHAR(tsl.amount * tp.cost, '999,999,999,999') cost "+
		"FROM "+
		    "tbl_product_01 tp "+
		    "INNER JOIN tbl_salelist_01 tsl "+
		    "ON tp.pcode = tsl.pcode "+
		    "INNER JOIN tbl_shop_01 ts "+
		    "ON ts.scode= tsl.scode ";
	
	ResultSet rs = stmt.executeQuery(sql);
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
<h3>판매현황</h3>
<table border="1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("saleno") %></td>
		<td><%=rs.getString("pcode") %></td>
		<td><%=rs.getString("saledate") %></td>
		<td><%=rs.getString("scode") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getInt("amount") %></td>
		<td><%=rs.getString("cost") %></td>
	</tr>	
<%
	}

} catch(Exception e) {
	e.printStackTrace();
}
%>
</table>
</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
	</head>
	</html>
	