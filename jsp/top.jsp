<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<% String session_id = (String) session.getAttribute("user");
String session_major = (String) session.getAttribute("major");
String log;
if (session_id == null)
	log = "<a href=login.jsp>로그인</a>";
else{ 
	log = "<a href=logout.jsp>로그아웃</a>";
	System.out.println("id:"+session_id+"/ major:"+session_major);
} 
%>
<p style="text-align: center;">
<a href=main.jsp><img src="sym01_l.gif"  height="100"></a>
<a href=main.jsp><img src="log01_l_01.gif" height="80"></a>
</p>


<table class="type04" align = 'center'>
    <tr>
        <td><b><%=log%></b></td>
        <td><b><a href="update.jsp">마이페이지</b></td>
        <td><b><a href="select.jsp">사용자 정보 조회</b></td>
        
        <td><b><a href="bookMenu.jsp">책 대출 및 예약</b></td>
        <td><b><a href="seat.jsp">좌석 예약</b></td>
    </tr>
    
</table>


</body>
</html>