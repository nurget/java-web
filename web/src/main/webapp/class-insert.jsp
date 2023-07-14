<%@page import="java.sql.Statement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>class insert</title>
</head>
<body>
<%
String ciName = request.getParameter("ciName");
if(ciName!=null && ciName.length()!=0){
	String ciDesc = request.getParameter("ciDesc");
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO CLASS_INFO(CI_NAME, CI_DESC)";
	sql += " VALUES('" + ciName + "', '" + ciDesc + "')";
	int result = stmt.executeUpdate(sql);
	if(result == 1){
%>
<script>
	alert("<%=ciName%>님 정보가 등록되었습니다.");
	location.href="/web/class.jsp"
</script>
<%
	}
}
%>
<form>
	<label for="ciName">이름</label>
	<input type="text", id="ciName", name="ciName"><br>
	<label for="ciDesc">설명</label>
	<input type="text", id="ciDesc", name="ciDesc"><br>
	<button>등록</button>
</form>
</body>
</html>