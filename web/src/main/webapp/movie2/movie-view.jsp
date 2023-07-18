<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<%
String miNum = request.getParameter("miNum");

Connection con = DBCon.getCon();
String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_DESC, MI_CREDAT, MI_CNT FROM MOVIE_INFO";
sql += " WHERE MI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, miNum);
ResultSet rs = ps.executeQuery();
if(!rs.next()) {
	%>
	<script>
		alert('이미 삭제된 게시물입니다.');
		history.back();
	</script>
	<%
	return;
}
String miTitle = rs.getString("MI_TITLE");
%>
<table border="1">
	<tr>
		<th>영화 제목</th>
		<td><%=rs.getString("MI_TITLE") %></td>
	</tr>
	<tr>
		<th>장르</th>
		<td><%=rs.getString("MI_GENRE") %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=rs.getString("MI_DESC") %></td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td><%=rs.getString("MI_CREDAT") %></td>
	</tr>
	<tr>
		<th>관객수</th>
		<td><%=rs.getString("MI_CNT") %></td>
	</tr>
	<tr>
		<th colspan="2"><button onclick="location.href='/web/movie2/movie-update.jsp?miNum=<%=miNum%>'">수정</button></th>
	</tr>
</table>
</body>
</html>