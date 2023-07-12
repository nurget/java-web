<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String str = "1";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
		for (int i = 1; i < 10; i++) {
		%>
		<tr>
			<td><%=i%>단</td>
			<%
			for (int j = 1; j < 10; j++) {
			%>
			<td><%=i%> X <%=j%> = <%=i * j%></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
	<%
	out.print(str);
	String s2 = "2";
	out.print(str);
	%>
</body>
</html>