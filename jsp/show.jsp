<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>   
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.text.DateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역 조회</title>
</head>
<table width="70%" align="center" id="p_seat_table" style="font-size: 1.2em; ">
<tr style="background-color: #4682B4; color:white;">
				<th style="padding-top: 1%; padding-bottom: 1%;">예약내역</th>
	</tr>
</table> 
<body>
<%@include file="top.jsp"%>

<%
	session_id = (String) session.getAttribute("user");

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	//String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	//String user = "db1416688";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1610049";

	//String user = "db1713926";
	String passwd = "oracle";	
	String sql=null;
	String mysql=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	try{
		myConn = DriverManager.getConnection(dburl, user, passwd);
		sql="select * from seats where res_id="+session_id;
		
		ps=myConn.prepareStatement(sql);
		rs=ps.executeQuery();
		
		if (session_id == null) {   		 
%> 
<script>  
	 alert("로그인 후 사용하세요.");  
	 location.href="login.jsp";   
</script> 
<% } else{ 

		int count_seats=0;
		
		while(rs.next()){
%> 			count_seats++;
			seat = rs.getString("seat_id"); 
 			date_seat = rs.getString("res_date"); 
 			date_seat = seatFormat.format(seatFormat.parse(date_seat)); 
			
			<tr> 
 					<th scope="row">예약 좌석</th> 
 					<td><%="seat"%> </td><p> 
 				</tr> 
 				<tr> 
 					<th scope="row">예약 시각</th> 
 					<td><%="date_seat"%> </td><p> 
 				</tr> 
			<a href="seat.jsp">뒤로가기</a>
<% 
			}
		if(count_seats==0){
%>
			<script> 
				alert("예약 정보가 없습니다."); 
				location.href="seat.jsp";  
			</script>
<% 
		}
		ps.close();
		myConn.close();
}
	}catch(SQLException e){
	    out.println(e);
	    e.printStackTrace();
	}
%>
</body>
</html>