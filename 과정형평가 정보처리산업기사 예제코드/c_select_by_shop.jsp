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
		"    ts.scode, "+
		"    ts.sname, "+
		"    TO_CHAR(SUM(tp.cost * tsl.amount), '999,999,999,999') cost "+
		"FROM "+
		"    tbl_shop_01 ts "+
		"    INNER JOIN tbl_salelist_01 tsl "+
		"    ON ts.scode = tsl.scode "+
		"    INNER JOIN tbl_product_01 tp "+
		"    ON tp.pcode = tsl.pcode "+
		"GROUP BY "+
		"    ts.scode, ts.sname "+
		"ORDER BY "+   
		"    1 ";		
	
	ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
<h3>매장별 판매액</h3>
<table border="1">
	<tr>
		<td>매장코드</td>
		<td>매장명</td>
		<td>매장별 판매액</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("scode") %></td>
		<td><%=rs.getString("sname") %></td>
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