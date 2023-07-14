<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.web.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board insert</title>
</head>
<body>
<a href="<%=root%>/board.jsp">Board</a>
<%
String biTitle = request.getParameter("biTitle");
if(biTitle!=null && biTitle.length()!=0){
	String biContent = request.getParameter("biContent");
	String biWriter = request.getParameter("biWriter");
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO BOARD_INFO(BI_TITLE, BI_CONTENT, BI_WRITER, BI_CREDAT, BI_CNT)";
	sql += " VALUES('" + biTitle + "', '" + biContent + "', '" + biWriter + "', NOW(), '" + 0 + "')";
	int result = stmt.executeUpdate(sql);
	if(result == 1){
%>
<script>
	alert("<%=biWriter%>님 게시물이 업로드 되었습니다.");
	location.href="/web/board.jsp"
</script>
<%	
	}
}
%>
<form>
	<label for="biTitle">제목</label>
	<input type="text", id="biTitle", name="biTitle"><br>
	<label for="biContent">내용</label>
	<input type="text", id="biContent", name="biContent"><br>
	<label for="biWriter">작성자</label>
	<input type="text", id="biWriter", name="biWriter"><br>
	<button>등록</button>
</form>
</body>
</html>