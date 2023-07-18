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
<title>영화 수정</title>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<%
String miNum = request.getParameter("miNum");
if(miNum!=null && !miNum.isEmpty()){
	
	Connection con = DBCon.getCon();
	String sql = "SELECT MI_NUM, MI_TITLE,MI_DESC, MI_GENRE, DATE_FORMAT(MI_CREDAT, '%Y-%m-%d') MI_CREDAT, MI_CNT FROM MOVIE_INFO WHERE MI_NUM=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, miNum);
	ResultSet rs = ps.executeQuery();
	if(!rs.next()){
		out.print("<script>");
		out.print("alert('이미 삭제된 영화입니다.');");
		out.print("location.href='" + root + "/movie/movie-list.jsp';");
		out.print("</script>");
		return;
	}
%>
<form action="<%=root%>/movie/movie-update-ok.jsp">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" id="miTitle" name="miTitle" value="<%=rs.getString("MI_TITLE")%>"></td>
		</tr>
		<tr>
			<th>영화내용</th>
			<td><textarea id="miDesc" name="miDesc"><%=rs.getString("MI_DESC")%></textarea></td>
		</tr>
		<tr>
			<th>장르</th>
			<td>
				<select id="miGenre" name="miGenre" >
					<option value="">장르</option>
					<option value="코미디" <%=rs.getString("MI_GENRE").equals("코미디")?"selected":""%>>코미디</option>
					<option value="로맨스" <%=rs.getString("MI_GENRE").equals("로맨스")? "selected":"" %>>로맨스</option>
					<option value="SF" <%=rs.getString("MI_GENRE").equals("SF")? "selected":""%>>S/F</option>
					<option value="스릴러" <%=rs.getString("MI_GENRE").equals("스릴러")?"selected":""%>>스릴러</option>
					<option value="드라마" <%=rs.getString("MI_GENRE").equals("드라마")?"selected":""%>>드라마</option>
				</select>
			</td>
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
			<th colspan="2"><button>수정</button></th>
		</tr>
	</table>
</form>
<%
}
%>
</body>
</html>