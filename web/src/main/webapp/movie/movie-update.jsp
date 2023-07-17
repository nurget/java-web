<%@page import="java.sql.ResultSet"%>
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
<title>영화 업데이트</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<%
	String miNum = request.getParameter("miNum");

	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT MI_NUM, MI_TITLE, MI_GENRE, MI_DESC, DATE_FORMAT(MI_CREDAT, '%Y-%m-%d') MI_CNT FROM MOVIE_INFO";
	sql += " WHERE MI_NUM=" + miNum;
	ResultSet rs = stmt.executeQuery(sql);
	if (!rs.next()) {
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
	<form action="<%=root%>/movie/movie-update-ok.jsp">
		<input type="hidden" name="miNum" value="<%=miNum%>">
		<table border="1">
			<tr>
				<th>영화제목</th>
				<td><input type="text" id="miTitle" name="miTitle"
					value="<%=rs.getString("MI_TITLE")%>"></td>
			</tr>
			<tr>
				<th>장르</th>
				<td><select id="miGenre" name="miGenre">
						<option value="">장르</option>
						<option value="코미디" <%=rs.getString("MI_GENRE").equals("코미디")?"selected":""%>>코미디</option>
						<option value="로맨스" <%=rs.getString("MI_GENRE").equals("로맨스")?"selected":"" %>>로맨스</option>
						<option value="SF" <%=rs.getString("MI_GENRE").equals("SF")?"selected":"" %>>SF</option>
						<option value="스릴러" <%=rs.getString("MI_GENRE").equals("스릴러")?"selected":""%>>스릴러</option>
						<option value="드라마" <%=rs.getString("MI_GENRE").equals("드라마")?"selected":" " %>>드라마</option>

				</select></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea id="miDesc" name="miDesc" style="resize: none"
						cols="30" rows="15"><%=rs.getString("MI_DESC")%></textarea></td>
			</tr>
		<tr>
			<th>개봉일</th>
			<td><input type="date" id="miCredat" name="miCredat" value="<%=rs.getString("MI_CREDAT")%>"></td>
		</tr>
			<tr>
				<th>관객수</th>
				<td><input type="number" id="miCnt" name="miCnt" value="<%=rs.getString("MI_CNT")%>"></td>
			</tr>
			<tr>
				<th colspan="2"><button
						onclick="location.href='<%=root%>/movie/movie-insert.jsp?miNum=<%=miNum%>'">수정</button></th>
			</tr>
		</table>

	</form>

</body>
</html>