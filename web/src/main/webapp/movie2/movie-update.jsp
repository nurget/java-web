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
	<%
	String miNum = request.getParameter("miNum");
	if (miNum != null && miNum.isEmpty()) {

		Connection con = DBCon.getCon();
		String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_DESC DATE_FORMAT(MI_CREDAT, '%Y-%m-%d') MI_CREDAT MI_CNT FROM MOVIE_INFO WHERE MI_NUM=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, miNum);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {
	%>
	<script>
		alert("이미 삭제된 영화입니다.");
		location.href = "/web/movie2/movie-list.jsp";
	</script>
	<%
	}
	return;
	%>
	<form action="<%=root%>/movie2/movie-update-ok.jsp">
		<table border="1">
			<tr>
				<th>영화 제목</th>
				<td><input type="text" id="miTitle" name="miTitle"
					value="<%=rs.getString("MI_TITLE")%>"></td>
			</tr>
		</table>
	</form>
	<%
	}
	%>
</body>
</html>