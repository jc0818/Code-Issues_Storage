<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = null;// 대가리 터져도 중요 
	Statement stmt = null;// 대가리 터져도 중요 
	//Util 오타 조심 제발 
	try{
		conn = Util.getConnection();// 대가리 터져도 중요 
		stmt = conn.createStatement();// 대가리 터져도 중요 
		String sql = "select * from member_tbl";// DB연결 못하면 때려 치라
		
		ResultSet rs = stmt.executeQuery(sql);// 대가리 터져도 중요 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
	<table border = 1>
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>반</td>
			<td>번호</td>
			<td>성별</td>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr>
			<td><%= rs.getString("id")%></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("id").substring(0,1)%></td>
			<td><%= rs.getString("id").substring(1,3)%></td>
			<td><%= rs.getString("id").substring(3)%></td>
			<td><%= rs.getString("gender")%></td>
		</tr>
		<%
		//substring = 문자열 자르기
			}
		
	} catch(Exception e)
	{
		e.printStackTrace();
	}
		%>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>