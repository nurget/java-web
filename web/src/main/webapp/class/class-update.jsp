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
<title>클래스 상세화면</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<%
	String ciNum = request.getParameter("ciNum");

	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "SELECT CI_NUM, CI_NAME, CI_DESC FRON CI_INFO";
	sql += " WHERE CI_NUM=" + ciNum;
	ResultSet rs = stmt.executeQuery(sql);
	if (!rs.next()) {
	%>
	<script>
		alert('이미 삭제된 클래스입니다.');
		history.back();
	</script>
	<%
	return;
	}
	String ciName = rs.getString("CI_NAME");
	%>
	<form action="<%=root%>/class/class-update-ok.jsp">
		<input type="hidden" name="ciNum" value="<%=ciNum%>">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" id="ciName" name="ciName"
					value="<%=rs.getString("CI_NAME")%>"></td>
			</tr>
			<tr>
				<td><input type="text" id="ciDesc" name="ciDesc" value="<%=rs.getString("CI_DESC") %>"> %></td>
			</tr>
			<tr>
				<th colspan="2"><button onclick="location.href='<%=root%>/class/class-insert.jsp?ciNum=<%=ciNum%>'">수정</button></th>
			</tr>
		</table>
	</form>
</body>
</html>