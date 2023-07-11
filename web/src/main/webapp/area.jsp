<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 디렉티브  -->
    <%@ %> <!-- 지시자 -->
    <%! %> <!-- 선언부, 메서드 들어감 -->
    <% 
    
    %> <!-- 스트립트릿 메서드 사용 불가, <% %> 자체가 메서드 안에 있음. 메서드 안에 메서드 Xxx -->
    <%="" %> <!-- 표현식 -->
    
    <%
    String str1 = "hello";
    String str2 = "hello";
    out.print(str1 == str2);
    out.print(str1);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>