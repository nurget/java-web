<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<Map<String,String>> list = new ArrayList<>(); // Map을 원소로 갖는 리스트 생성

// 학생 정보를 담은 Map 객체 생성 및 추가
Map<String,String> map = new HashMap<>();
map.put("name", "김세희");
map.put("point", "80");
map.put("addrs", "서울");
list.add(map);

map = new HashMap<>();
map.put("name", "김용준");
map.put("point", "77");
map.put("addrs", "부산");
list.add(map);

map = new HashMap<>();
map.put("name", "이원준");
map.put("point", "99");
map.put("addrs", "대전");
list.add(map);

map = new HashMap<>();
map.put("name", "이원기");
map.put("point", "66");
map.put("addrs", "대구");
list.add(map);

map = new HashMap<>();
map.put("name", "이보성");
map.put("point", "55");
map.put("addrs", "경기");
list.add(map);

map = new HashMap<>();
map.put("name", "이왕균");
map.put("point", "54");
map.put("addrs", "광주");
list.add(map);

String minName = ""; // 최저 점수를 가진 학생 이름
String maxName = ""; // 최고 점수를 가진 학생 이름
String minAddr = ""; // 최저 점수를 가진 학생 주소
String maxAddr = ""; // 최고 점수를 가진 학생 주소

int min = Integer.parseInt(list.get(0).get("point")); // 최저 점수 초기화
int max = Integer.parseInt(list.get(0).get("point")); // 최고 점수 초기화

// 리스트를 순회하면서 최저 점수와 최고 점수를 가진 학생 정보를 찾음
for (int i = 1; i < list.size(); i++) {
	int num = Integer.parseInt(list.get(i).get("point"));
	
	// 현재 학생의 점수가 최저 점수보다 작으면 최저 점수 및 관련 정보 업데이트
	if (min > num) {
		min = num;
		minName = list.get(i).get("name");
		minAddr = list.get(i).get("addrs");
	}
	
	// 현재 학생의 점수가 최고 점수보다 크면 최고 점수 및 관련 정보 업데이트
	if (max < num) {
		max = num;
		maxName = list.get(i).get("name");
		maxAddr = list.get(i).get("addrs");
	}
}
%>

<table border="1">
	<tr>
		<th>최고점</th>
		<td><%=maxName %>, <%=max %>, <%=maxAddr %></td>
	</tr>
	<tr>
		<th>최저점</th>
		<td><%=minName %>, <%=min %>, <%=minAddr %></td>
	</tr>
</table>
</body>
</html>
