<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>장르</th>
		<th>개봉일</th>
		<th>관객수</th>
		<th>삭제</th>
	</tr>
<%
Connection con = DBCon.getCon();
String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_DESC, MI_CREDAT, MI_CNT FROM MOVIE_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()) {
%>
<tr>
	<td><%=rs.getInt("MI_NUM") %></td>
	<td><a href="<%=root%>/movie2/movie-view.jsp?miNum=<%=rs.getInt("MI_NUM")%>"><%=rs.getString("MI_TITLE") %></a></td>
	<td><%=rs.getString("MI_GENRE") %></td>
	<td><%=rs.getString("MI_CREDAT") %></td>
	<td><%=rs.getString("MI_CNT") %></td>
	<td><button type="button" onclick="location.href='<%=root%>/movie2/movie-delete-ok.jsp?miNum=<%=rs.getInt("MI_NUM")%>'">삭제</button></td>
</tr>
<%
}
%>
<tr>
	<th colspan="7" align="right"><button onclick="location.href='/web/movie2/movie-insert.jsp'">등록</button></th>
</tr>
</table>
</body>
</html>