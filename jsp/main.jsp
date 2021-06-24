<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>숙명여자대학교 전자도서관</title>
</head>
<body>
	<%@include file="top.jsp"%>
	<table width="75%" align="center" height="100%">
		<tr align="center">
		<td>숙명여자대학교 전자도서관 홈페이지입니다.</td></tr>
	</table>
	
	<table width="75%" align="center" height="100%">
		<%
			if (session_id != null) {
		%>
		<tr>
			<td align="center"><%=session_id%>님 방문을 환영합니다.</td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td align="center">로그인한 후 사용하세요.</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>