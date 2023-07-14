<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="com.web.vo.HumanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>human</title>
</head>
<body>
<%
String[] names = {"김홍균", "김아영", "이명관", "이왕균", "이보성"};
Random ra = new Random();
List<HumanVO> humanList = new ArrayList<>();
Set<String> nameSet = new HashSet<>();

while(nameSet.size()<5){
	int rNum = ra.nextInt(5);
	if(nameSet.add(names[rNum])){ // boolean 형임
		HumanVO human = new HumanVO();
		human.setName(names[rNum]);
		humanList.add(human);
	}
}

// 출력
for(int i=0; i<humanList.size(); i++){
%>
	<%= humanList.get(i) %><br>
<%
}
%>
</body>
</html>