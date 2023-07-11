<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
String str = "안녕 난 Java String 변수야";
out.println(str);
int num = 1;
if (num == 2) {
	out.println(str);
} else {
	out.println("아하");
}
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>1</td>
		<td>첫번째 게시물</td>
		<td>윌리엄</td>
		<td>10</td>
	</tr>
		<tr>
		<td>2</td>
		<td>두번째 게시물</td>
		<td>벤틀리</td>
		<td>20</td>
	</tr>
		<tr>
		<td>3</td>
		<td>세번째 게시물</td>
		<td>샘</td>
		<td>30</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><button>등록</button></td>
	</tr>
</table>
</body>
</html>