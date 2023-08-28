<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Connection conn = null;
    Statement stmt = null;
    
    try{
    	conn = Util.getConnection();
    	stmt = conn.createStatement();
    	
    	String sql = 
    			"SELECT "+ 
    			"    tp.pcode, "+
    			"    tp.name, "+
    			"    TO_CHAR(SUM(tp.cost * tsl.amount), '999,999,999,999') cost "+
    			"FROM "+
    			"    tbl_shop_01 ts "+
    			"    INNER JOIN tbl_salelist_01 tsl "+
    			"    ON ts.scode = tsl.scode "+
    			"    INNER JOIN tbl_product_01 tp "+
    			"    ON tp.pcode = tsl.pcode "+
    			"GROUP BY "+
    			"    tp.pcode, tp.name ";		
    	ResultSet rs = stmt.executeQuery(sql);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<h2>상품별 판매액</h2>
<table border = 1>
<tr>	
		<td>상품코드</td>
		<td>상품명</td>
		<td>상품별 판매액</td>
</tr>
<%
	while(rs.next())
	{		
%>
<tr>
<td><%=rs.getString("pcode") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("cost") %></td>
</tr>
<%
}
	}
	catch(Exception e){
		e.printStackTrace();
	} 
%>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>



 