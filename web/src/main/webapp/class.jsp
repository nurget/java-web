<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/kd";
	String user = "root";
	String password = "kd1824java";
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	String sql = "SELECT * FROM CLASS_INFO";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>설명</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<%=("<tr>")%>
		<%=("<td>" + rs.getInt("CI_NUM") + "</td>")%>
		<%=("<td>" + rs.getString("CI_NAME") + "</td>")%>
		<%=("<td>" + rs.getString("CI_DESC") + "</td>")%>
		<%=("</tr>")%>
		<%
		}
		%>
		<tr>
			<td colspan="3" align="center"><button>추가</button></td>
		</tr>
	</table>
</body>
</html>