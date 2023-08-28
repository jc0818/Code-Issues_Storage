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
    	
    	String sql = "select ts.saleno,ts.pcode,ts.saledate,ts.scode,tp.name,ts.amount,TO_CHAR(tp.cost * ts.amount, '999,999,999,999') cost from tbl_product_01 tp,tbl_salelist_01 ts where tp.pcode = ts.pcode ";
    	
    	ResultSet rs = stmt.executeQuery(sql);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<h2>판매현황</h2>
<table border = 1>
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
	while(rs.next())
	{		
%>
<tr>
<td><%=rs.getString("saleno") %></td>
<td><%=rs.getString("pcode") %></td>
<td><%=rs.getString("saledate").substring(0,10)%></td>
<td><%=rs.getString("scode") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("amount") %></td>
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