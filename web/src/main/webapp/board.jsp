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
out.println("내가 나오면 에러는 없는 거야!");
Statement stmt = con.createStatement();
String sql = "SELECT * FROM BOARD_INFO";
ResultSet rs = stmt.executeQuery(sql); // rs는 메타데이터와 로우(실제)데이터를 가지고 있음
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성내용</th>
		<th>작성자</th>
		<th>작성시간</th>
		<th>조회수</th>
	</tr>
<%
while(rs.next()) {
%>
	<%=out.println("<tr>")%>
	<%=("<td>" + rs.getInt("BI_NUM") + "</td>")%>
	<%=("<td>" + rs.getString("BI_TITLE") + "</td>")%>
	<%=("<td>" + rs.getString("BI_CONTENT") + "</td>")%>
	<%=("<td>" + rs.getString("BI_WRITER") + "</td>")%>
	<%=("<td>" + rs.getString("BI_CREDAT") + "</td>")%>
	<%=("<td>" + rs.getString("BI_CNT") + "</td>")%>
	<%=("</tr>")%>
<%
}
%>
<tr>
	<td colspan="6" align="center"><button>등록</button></td>
</tr>
</table>
   
   
    
                      n   nnn   
</body>
</html>