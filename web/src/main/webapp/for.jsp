<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
String[] strs = {"홍길동", "김길동", "임꺽정"};
List<String> list = new ArrayList<>();
list.add("홍길동");
list.add("김길동");
list.add("임꺽정");
for (int i = 0; i < strs.length; i++) {
	out.println(list.get(i) + "<br>");
}
%>
</body>
</html>