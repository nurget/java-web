<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
		List<Integer> lotto = new ArrayList<>();
		Random r = new Random();
		for (int i = 1; i < 7; i++) {
			lotto.add(r.nextInt(45) + 1);
		}
		%>

		<%
			for (int i = 0; i < lotto.size(); i++) {
		%>
		<% 
			
		%>
			<%
			}
		%>

	</table>
</body>
</html>