<%@page import="java.util.*"%>
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
	List<Integer> minMax = new ArrayList<>();
	Random r = new Random();
	%>

	<%
	while (minMax.size() < 10) {

	int rNum = r.nextInt(100) + 1;
	if (minMax.indexOf(rNum) == -1) {
		minMax.add(rNum);
	}
	}
	int min = minMax.get(0);
	int max = minMax.get(0);
	for (int i = 1; i < minMax.size(); i++) {
	if (min > minMax.get(i)) {
		min = minMax.get(i);
	}

	if (max < minMax.get(i)) {
		max = minMax.get(i);
	}
	}
	%>
	<table border="1">
		<tr>
			<th colspan="2"><%=minMax%></th>
		</tr>

		<tr>
			<th>최대값</th>
			<td><%=max%></td>
		</tr>
		<tr>
			<th>최소값</th>
			<td><%=min%></td>
		</tr>
	</table>
</body>
</html>