<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<h3>회원가입 페이지</h3>
	<%
	String uiId = request.getParameter("uiId");
	if (uiId != null && uiId.length() != 0) {
		String uiPwd = request.getParameter("uiPwd");
		String uiName = request.getParameter("uiName");
		out.println("uiId : " + uiId + "<br>");
		out.println("uiPwd : " + uiPwd + "<br>");
		out.println("uiName : " + uiName + "<br>");
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement(); // 사용자 입력에 따라 쿼리문이 달라지는 경우를 방지해야 함
		String sql = "INSERT INTO USER_INFO(UI_ID, UI_PWD, UI_NAME)";
		sql += " values('" + uiId + "', '" + uiPwd + "', '" + uiName + "')";
		int result = stmt.executeUpdate(sql);
		if(result==1){
	%>
	<script>
		alert("<%=uiName%>님 회원가입에 성공하였습니다. 로그인을 해주세요.");
		location.href="/web/login.jsp"
	</script>
	<%
		}
	}
	%>
	<form>
		<!-- action="http://localhost/web/join.jsp" 자기자신이 생략 / method="GET"  -->
		<label for="uiId">아이디</label> <input type="text" id="uiId" name="uiId"><br>
		<label for="uiPwd">비밀번호</label> <input type="password" id="uiPwd"
			name="uiPwd"><br> <label for="uiName">이름</label> <input
			type="text" id="uiName" name="uiName"><br>
		<button>등록</button>
		<!-- type을 안쓰면 submit  -->
	</form>
</body>
</html>