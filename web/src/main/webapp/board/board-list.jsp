<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<form>
	<input type="text" placeholder="제목" name="biTitle" id="biTitle" <%=request.getParameter("biTitle")==null?"":request.getParameter("biTitle") %>>
	<input type="text" placeholder="작성자" name="biWriter" id="biWriter" <%=request.getParameter("biWriter")==null?"":request.getParameter("biWriter") %>>
	<input type="text" placeholder="내용" name="biContent" id="biContent" <%=request.getParameter("biContent")==null?"":request.getParameter("biContent") %>>
	<button>검색</button>
	</form>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>삭제</th>
		</tr>

		<%
		Connection con = DBCon.getCon();
		String sql = "SELECT bi.*, UI.UI_NAME FROM board_info bi";
		sql += " INNER JOIN user_info UI ON BI.BI_WRITER = UI.UI_NUM WHERE 1=1 ";

		String biTitle = request.getParameter("biTitle")==null?"":request.getParameter("biTitle"); // 검색 버튼을 누르면 biTitle이 Not Null이 되고
		String biWriter = request.getParameter("biWriter")==null?"":request.getParameter("biWriter");
		String biContent = request.getParameter("biContent")==null?"":request.getParameter("biContent");
		
		int cnt = 0;
		
		if(!biTitle.isEmpty()) {
			sql += " AND BI_TITLE LIKE CONCAT('%',?,'%')"; // 쿼리문 변경, 물음표는 Not Null일 때 생김. (사용자 입력값 받기) - 바인딩을 해야함
			cnt++;
 		}
		if(!biWriter.isEmpty()) {
			sql += " AND BI_WRITER LIKE CONCAT('%',?,'%')";
			cnt++;
		} 
		if(!biContent.isEmpty()) {
			sql += " AND BI_CONTENT LIKE CONCAT('%',?,'%')";
			cnt++;
		}
		
		PreparedStatement pstmt = con.prepareStatement(sql); 
		
		if(!biContent.isEmpty()) {
			pstmt.setString(cnt--, biContent); // Not Null 일 때 물음표에 biTitle을 넣어줌, Null이면 물음표가 뭔데? 값을 모름.
					// 만족을 안하는데 첫 번째 물음표를 찾으면 오류가 나기 때문에 if문이 두 개가 됨.
		}
		if(!biWriter.isEmpty()) {
			pstmt.setString(cnt--, biWriter);
		} 
		if (!biTitle.isEmpty()){
			pstmt.setString(cnt--, biTitle);
		}
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("BI_NUM")%></td>
			<td><a href="<%=root%>/board/board-view.jsp?biNum=<%=rs.getInt("BI_NUM")%>"><%=rs.getString("BI_TITLE")%></a></td>
			<td><%=rs.getString("UI_NAME")%></td>
			<td><%=rs.getString("BI_CREDAT")%></td>
			<td><%=rs.getInt("BI_CNT")%></td>
			<td><button type="button" onclick="location.href='<%=root%>/board/board-delete-ok.jsp?biNum=<%=rs.getInt("BI_NUM")%>'">삭제</button></td>
		</tr>
		<%
		}
		%>
		
		<tr>
			<td colspan="6" align="right"><button onclick="location.href='/web/board/board-insert.jsp'">등록</button></td>
		</tr>
	</table>
</body>
</html>