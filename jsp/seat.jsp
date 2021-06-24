<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
 <%@page import="java.sql.*" %>
<%
 	List<String> list=new ArrayList<>();

%>
<html>
<head>
<meta charset="EUC-KR">
<title>좌석 예약 시스템</title>
<link rel='stylesheet' href='./dbDesign.css' />
		<style type="text/css">
		#in_b, #in_b:visited {
			width: 80pt;
			font-size: 17pt;
			color: blue;	
		}
	</style>
</head>
<script>
	function show(url){
		document.location.href = url;
	}
</script>
<body>
<%@include file="top.jsp"%>
<%
	if(session_id==null){
%>
<script>
	alert("로그인이 필요한 서비스입니다.");
	location.href="login.jsp";
</script>
<%
	}else{
		Connection myConn=null;
		Statement stmt=null;
		ResultSet myResultSet=null;
		Statement stmt2=null;
		ResultSet myResultSet2=null;
		String dbdriver="oracle.jdbc.driver.OracleDriver";
		//String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
		//String user="db1713926";
		String dburl="jdbc:oracle:thin:@localhost:1521:xe";
		String user="db1610049";
		String passwd="oracle";
			
		try{
			Class.forName(dbdriver);
			myConn=DriverManager.getConnection(dburl,user,passwd);
		}catch(SQLException ex){
			System.out.println("SQLException: "+ex.getMessage());
		}
		
		stmt=myConn.createStatement();
		stmt2=myConn.createStatement();
		
		String mySQL="select * from seats where res_id='"+session_id+"'";
		myResultSet=stmt.executeQuery(mySQL);
		
		String sql = "select seat_id from seats where res_id is not null and res_date is not null";
		myResultSet2=stmt2.executeQuery(sql);
	
		while (myResultSet2.next()){
			list.add(myResultSet2.getString("seat_id"));			
		}
		if(myResultSet!=null){
			while(myResultSet.next()){
				String Id=myResultSet.getString("res_id");
				String sId=myResultSet.getString("seat_id");
				
%>
<script>
		alert("<%=Id%>가 이미 좌석 <%=sId%>를 예약하고 있습니다.\n한자리만 예약할 수 있습니다.");
		location.href="select.jsp";	
</script>
<%
			}
		}
	}
%>	
<br>
<table width="70%" align="center" id="p_seat_table" style="font-size: 1.2em; ">
<tr style="background-color: #4682B4; color:white;">
				<th style="padding-top: 1%; padding-bottom: 1%;">좌석번호</th>
	</tr>
</table>
	<form action="seat_verify.jsp">
		<td align="center"></td>
		<div style="padding-right:20px;font-size: 9pt;">
		<h2 style="text-align:center">
		
<%		if(list.contains("S1_A1")){ %>
			<input type="radio" name="seat" value="<%="S1_A1"%>" disabled>S1_A1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_A1"%>">S1_A1
<%} %>
<%		if(list.contains("S1_A2")){ %>
			<input type="radio" name="seat" value="<%="S1_A2"%>" disabled>S1_A2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_A2"%>">S1_A2
<%} %>
<%		if(list.contains("S1_A3")){ %>
			<input type="radio" name="seat" value="<%="S1_A3"%>" disabled>S1_A3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_A3"%>">S1_A3
<%} %>
<%		if(list.contains("S1_A4")){ %>
			<input type="radio" name="seat" value="<%="S1_A4"%>" disabled>S1_A4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_A4"%>">S1_A4
<%} %>
<%		if(list.contains("S1_A5")){ %>
			<input type="radio" name="seat" value="<%="S1_A5"%>" disabled>S1_A5
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_A5"%>">S1_A5
<%} %>
<br/>
<%		if(list.contains("S1_B1")){ %>
			<input type="radio" name="seat" value="<%="S1_B1"%>" disabled>S1_B1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_B1"%>">S1_B1
<%} %>
<%		if(list.contains("S1_B2")){ %>
			<input type="radio" name="seat" value="<%="S1_B2"%>" disabled>S1_B2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_B2"%>">S1_B2
<%} %>
<%		if(list.contains("S1_B3")){ %>
			<input type="radio" name="seat" value="<%="S1_B3"%>" disabled>S1_B3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_B3"%>">S1_B3
<%} %>
<%		if(list.contains("S1_B4")){ %>
			<input type="radio" name="seat" value="<%="S1_B4"%>" disabled>S1_B4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_B4"%>">S1_B4
<%} %>
<%		if(list.contains("S1_B5")){ %>
			<input type="radio" name="seat" value="<%="S1_B5"%>" disabled>S1_B5
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_B5"%>">S1_B5
<%} %>
<br/>
<%		if(list.contains("S1_C1")){ %>
			<input type="radio" name="seat" value="<%="S1_C1"%>" disabled>S1_C1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_C1"%>">S1_C1
<%} %>
<%		if(list.contains("S1_C2")){ %>
			<input type="radio" name="seat" value="<%="S1_C2"%>" disabled>S1_C2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_C2"%>">S1_C2
<%} %>
<%		if(list.contains("S1_C3")){ %>
			<input type="radio" name="seat" value="<%="S1_C3"%>" disabled>S1_C3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_C3"%>">S1_C3
<%} %>
<%		if(list.contains("S1_C4")){ %>
			<input type="radio" name="seat" value="<%="S1_C4"%>" disabled>S1_C4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_C4"%>">S1_C4
<%} %>
<%		if(list.contains("S1_C5")){ %>
			<input type="radio" name="seat" value="<%="S1_C5"%>" disabled>S1_C5
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_C5"%>">S1_C5
<%} %>
<br/>
<%		if(list.contains("S1_D1")){ %>
			<input type="radio" name="seat" value="<%="S1_D1"%>" disabled>S1_D1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_D1"%>">S1_D1
<%} %>
<%		if(list.contains("S1_D2")){ %>
			<input type="radio" name="seat" value="<%="S1_D2"%>" disabled>S1_D2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_D2"%>">S1_D2
<%} %>
<%		if(list.contains("S1_D3")){ %>
			<input type="radio" name="seat" value="<%="S1_D3"%>" disabled>S1_D3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_D3"%>">S1_D3
<%} %>
<%		if(list.contains("S1_D4")){ %>
			<input type="radio" name="seat" value="<%="S1_D4"%>" disabled>S1_D4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_D4"%>">S1_D4
<%} %>
<%		if(list.contains("S1_D5")){ %>
			<input type="radio" name="seat" value="<%="S1_D5"%>" disabled>S1_D5
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S1_D5"%>">S1_D5
<%} %>
<br/>
<%		if(list.contains("S6_A1")){ %>
			<input type="radio" name="seat" value="<%="S6_A1"%>" disabled>S6_A1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_A1"%>">S6_A1
<%} %>
<%		if(list.contains("S6_A2")){ %>
			<input type="radio" name="seat" value="<%="S6_A2"%>" disabled>S6_A2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_A2"%>">S6_A2
<%} %>
<%		if(list.contains("S6_A3")){ %>
			<input type="radio" name="seat" value="<%="S6_A3"%>" disabled>S6_A3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_A3"%>">S6_A3
<%} %>
<%		if(list.contains("S6_A4")){ %>
			<input type="radio" name="seat" value="<%="S6_A4"%>" disabled>S6_A4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_A4"%>">S6_A4
<%} %>	
<br/>	
<%		if(list.contains("S6_B1")){ %>
			<input type="radio" name="seat" value="<%="S6_B1"%>" disabled>S6_B1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_B1"%>">S6_B1
<%} %>
<%		if(list.contains("S6_B2")){ %>
			<input type="radio" name="seat" value="<%="S6_B2"%>" disabled>S6_B2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_B2"%>">S6_B2
<%} %>
<%		if(list.contains("S6_B3")){ %>
			<input type="radio" name="seat" value="<%="S6_B3"%>" disabled>S6_B3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_B3"%>">S6_B3
<%} %>
<%		if(list.contains("S6_B4")){ %>
			<input type="radio" name="seat" value="<%="S6_B4"%>" disabled>S6_B4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_B4"%>">S6_B4
<%} %>
<br/>
<%		if(list.contains("S6_C1")){ %>
			<input type="radio" name="seat" value="<%="S6_C1"%>" disabled>S6_C1
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_C1"%>">S6_C1
<%} %>
<%		if(list.contains("S6_C2")){ %>
			<input type="radio" name="seat" value="<%="S6_C2"%>" disabled>S6_C2
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_C2"%>">S6_C2
<%} %>
<%		if(list.contains("S6_C3")){ %>
			<input type="radio" name="seat" value="<%="S6_C3"%>" disabled>S6_C3
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_C3"%>">S6_C3
<%} %>
<%		if(list.contains("S6_C4")){ %>
			<input type="radio" name="seat" value="<%="S6_C4"%>" disabled>S6_C4
<%} 	else { %>
			<input type="radio" name="seat" value="<%="S6_C4"%>">S6_C4
<%} %>
		<br/>
		<br/>
		<input type="submit" value="좌석 예약"/>
		</form>
</h2>
</div>		
</body>
</html>