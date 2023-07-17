<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<%
	String miTitle = request.getParameter("miTitle");
	if (miTitle != null && miTitle.length() != 0) {
		String miGenre = request.getParameter("miGenre");
		String miDesc = request.getParameter("miDesc");
		String miCredat = request.getParameter("miCredat");
		String miCnt = request.getParameter("miCnt");
		
		Connection con = DBCon.getCon();
		
		String sql = "INSERT INTO MOVIE_INFO(MI_TITLE, MI_GENRE, MI_DESC, MI_CREDAT, MI_CNT)";
		sql += " VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, miTitle);
		ps.setString(2, miGenre);
		ps.setString(3, miDesc);
		ps.setString(4, miCredat);
		ps.setString(5, miCnt);
		int result = ps.executeUpdate();
		if (result == 1) {
			out.print("<script>");
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='" + root + "/movie/movie-list.jsp';");
			out.print("</script>");
		}
	}
	%>

	<form>
		<table border="1">
			<tr>
				<th>영화제목</th>
				<td><input type="text" id="miTitle" name="miTitle"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><select id="miGenre" name="miGenre">
						<option value="">장르</option>
						<option value="코미디">코미디</option>
						<option value="로맨스">로맨스</option>
						<option value="SF">SF</option>
						<option value="스릴러">스릴러</option>
						<option value="드라마">드라마</option>

				</select></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea id="miDesc" name="miDesc" style="resize: none"
						cols="30" rows="15"></textarea></td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td><input type="date" id="miCredat" name="miCredat"></td>
			</tr>
			<tr>
				<th>관객수</th>
				<td><input type="number" id="miCnt" name="miCnt"></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>