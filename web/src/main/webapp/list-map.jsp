<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<String> names = new ArrayList<>(); // 이름을 담을 리스트 생성
names.add("김세희");
names.add("김용준");
names.add("이원준");
names.add("이원기");
names.add("이보성");
names.add("이왕균");

List<Integer> points = new ArrayList<>(); // 점수를 담을 리스트 생성
points.add(80);
points.add(77);
points.add(99);
points.add(66);
points.add(55);
points.add(44);

List<String> addrs = new ArrayList<>(); // 주소를 담을 리스트 생성
addrs.add("서울");
addrs.add("부산");
addrs.add("대전");
addrs.add("대구");
addrs.add("경기");
addrs.add("광주");

int hPoint = points.get(0); // 최고점 초기화
int lPoint = points.get(0); // 최하점 초기화

int hIdx = 0; // 최고점을 가진 학생의 인덱스
int lIdx = 0; // 최하점을 가진 학생의 인덱스

// 최고점과 최하점을 가진 학생을 찾음
for (int i = 1; i < points.size(); i++) {
	if (hPoint < points.get(i)) {
		hPoint = points.get(i); // 최고점
		hIdx = i; // 최고점을 가진 학생의 인덱스
	}
	
	if (lPoint > points.get(i)) {
		lPoint = points.get(i); // 최하점
		lIdx = i; // 최하점을 가진 학생의 인덱스
	}
}
%>
<table border="1">
	<tr>
		<th>최고점</th>
		<td><%=names.get(hIdx)%>, <%=hPoint%>, <%=addrs.get(hIdx)%></td>
	</tr>
	<tr>
		<th>최하점</th>
		<td><%=names.get(lIdx)%>, <%=lPoint%>, <%=addrs.get(lIdx)%></td>
	</tr>
</table>
</body>
</html>
