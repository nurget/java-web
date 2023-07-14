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
<title>로그인</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<%
	String uiId = request.getParameter("uiId");
	if (uiId != null && uiId.length() != 0) {
		String uiPwd = request.getParameter("uiPwd");
		String uiName = request.getParameter("uiName");
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO USER_INFO(UI_ID, UI_PWD, UI_NAME)";
		sql += "VALUES('" + uiId + "','" + uiPwd + "','" + uiName + "')";
		int result = stmt.executeUpdate(sql);
		if (result == 1) {
	%>
	<script>
		alert("<%= uiName%>님 회원가입에 성공하셨습니다. 로그인을 해주세요!");
		location.href("/web/login.jsp")
	</script>
	<%
	}
	}
	%>

	<form>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="uiId" name="uiId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="uiPwd" name="uiPwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="uiName" name="uiName"></td>
			</tr>
			<tr>
				<th colspan="2"><button>회원가입</button></th>
			</tr>

		</table>
	</form>
</body>
</html>