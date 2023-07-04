package DBPKG;

import java.sql  .Connection;
import java.sql.DriverManager;

public class Util {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521/xe",
				"system",
				"1234");
		return conn;
	}
	
	public static String getParamNN(String param) {
		if(param == null)
			return "";
		return param;
	}
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header><h2>매장별 커피 판매관리 ver 1.0</h2></header>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <footer>
  <h3>Copyright @ 2023 All right reserved Semyong Computer High School</h3>
  </footer>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<nav>
	<table>
		<tr>
			<td><a href="c_insert.jsp">판매등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="c_select.jsp">판매현황</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="c_select_by_shop.jsp">매장별판매액</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="c_select_by_product.jsp">상품별판매액</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a href="index.jsp" class="nav_home_a">홈으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</table>
</nav>

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
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String task = request.getParameter("task");
	String saleno  = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");

	
	Connection conn = null;
	Statement stmt = null;
	String callback = "";
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "";
		
		switch(task) {
		case "insert":
			sql = "INSERT INTO tbl_salelist_01 VALUES("+ saleno +", "
				+"'"+pcode+"', " + 
				"TO_DATE('"+saledate+"', 'YYYY-MM-DD'), '" + scode + "' ,"+amount+")";
			stmt.executeUpdate(sql);
			%>
			<jsp:include page="index.jsp"></jsp:include>
			<%
//			callback = "index.jsp?section=insert";
			break;
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
//	response.sendRedirect(callback);
%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
//String callback = "";
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT MAX(saleno) + 1 saleno FROM tbl_salelist_01";	
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String saleno = Util.getParamNN(rs.getString("saleno"));
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
<h3>판매등록</h3>
<form name="form1" action="action.jsp" method="post">
	<input type="hidden" name="task" value="insert">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="text" name="saleno" value="<%=saleno%>"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode" value=""></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="saledate" value=""></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode" value=""></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount" value=""></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등 록" onclick="">
				<input type="reset" value="다시쓰기" onclick="">
			</td>
		</tr>
	</table>
</form>
</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
	</head>
	</html>
<%
} catch(Exception e) {
	e.printStackTrace();
}
%>
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

<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
//String callback = "";
try {
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
		"    tp.pcode, tp.name "+
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
<h3>상품별 판매액</h3>
<table border="1">
	<tr>
		<td>상품코드</td>
		<td>상품명</td>
		<td>상품별 판매액</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("pcode") %></td>
		<td><%=rs.getString("name") %></td>
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



@charset "UTF-8";
html, body {
	width: 100%;
	height: 100vh;
	margin : 0;
	padding :0;
}

header {
	width: 100%;
	padding: 15px;
	text-align: center;
	background: #999;
}

nav {
	width: 100%;
	padding: 15px;
	background: #777;
}

nav > ul  {
	padding: 0;
	margin: 0;
	width: 100%;
}

nav > ul > li {
	display: inline-block;
	width: 125px;
}

nav > ul > li > a {
	text-decoration: none;
	color: #000;
}

.nav_home_a {
	text-decoration: underline;
}

section {
	width: 100%;
	height: auto;
	min-height: 500px;
	text-align: center;
	padding: 15px;
}

table {
    margin: 0 auto;
}

footer {
	width: 100%;
	padding: 15px;
	background: #444;
	text-align:center;
}

footer > h3 {
	color: #fff;
}

