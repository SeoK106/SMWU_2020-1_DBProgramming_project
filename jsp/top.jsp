<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<% String session_id = (String) session.getAttribute("user");
String session_major = (String) session.getAttribute("major");
String log;
if (session_id == null)
	log = "<a href=login.jsp>�α���</a>";
else{ 
	log = "<a href=logout.jsp>�α׾ƿ�</a>";
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
        <td><b><a href="update.jsp">����������</b></td>
        <td><b><a href="select.jsp">����� ���� ��ȸ</b></td>
        
        <td><b><a href="bookMenu.jsp">å ���� �� ����</b></td>
        <td><b><a href="seat.jsp">�¼� ����</b></td>
    </tr>
    
</table>


</body>
</html>