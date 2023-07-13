<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
List<Map<String,String>> list = new ArrayList<>(); // Map을 원소로 갖는 리스트 생성

// 학생 정보를 담은 Map 객체 생성 및 추가
Map<String,String> map = new HashMap<>();
map.put("name","김세희");
map.put("point","80");
map.put("addr","서울");
list.add(map);

map = new HashMap<>();
map.put("name","김용준");
map.put("point","77");
map.put("addr","부산");
list.add(map);

map = new HashMap<>();
map.put("name","이원준");
map.put("point","99");
map.put("addr","대전");
list.add(map);

map = new HashMap<>();
map.put("name","이원기");
map.put("point","66");
map.put("addr","대구");
list.add(map);

map = new HashMap<>();
map.put("name","이보성");
map.put("point","55");
map.put("addr","경기");
list.add(map);

map = new HashMap<>();
map.put("name","이왕균");
map.put("point","54");
map.put("addr","광주");
list.add(map);

Map<String,String> minMap = list.get(0); // 최저 점수를 가진 학생 정보를 담을 Map 초기화
Map<String,String> maxMap = list.get(0); // 최고 점수를 가진 학생 정보를 담을 Map 초기화

// 리스트를 순회하면서 최저 점수와 최고 점수를 가진 학생 정보를 찾음
for(int i=1;i<list.size();i++){
	Map<String,String> tmpMap = list.get(i);
	
	// 현재 학생의 점수가 최저 점수보다 작으면 최저 점수를 가진 학생 정보 업데이트
	if(Integer.parseInt(minMap.get("point")) > Integer.parseInt(tmpMap.get("point"))){
		minMap = tmpMap;
	}
	
	// 현재 학생의 점수가 최고 점수보다 크면 최고 점수를 가진 학생 정보 업데이트
	if(Integer.parseInt(maxMap.get("point")) < Integer.parseInt(tmpMap.get("point"))){
		maxMap = tmpMap;
	}
}
%>
<table border="1">
	<tr> 
		<th>최고점</th>
		<td><%=maxMap.get("name")%>, <%=maxMap.get("point")%>, <%=maxMap.get("addr")%></td>
	</tr>
	<tr>
		<th>최저점</th>
		<td><%=minMap.get("name")%>, <%=minMap.get("point")%>, <%=minMap.get("addr")%></td>
	</tr>
</table>
</body>
</html>
