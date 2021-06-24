<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@include file="top.jsp"%>

<%
	session_id=(String)session.getAttribute("user");

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	//String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	//String user = "db1416688";
	//String user = "db1713926";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1610049";

	String passwd = "oracle";
	Statement stmt=null;
	String mySQL = null;
	String sql=null;
	ResultSet rs = null;
	
	String[] seat=request.getParameterValues("seat");
	
	if(seat==null){
		%>
        <script>   
           alert("좌석을 선택해주세요.");
           location.href="seat.jsp";
        </script>
		<%
	}else{
		try{		
				myConn = DriverManager.getConnection(dburl, user, passwd);
				stmt=myConn.createStatement();
				for(int i=0;i<seat.length;i++){	
					sql="update seats set seat_id='" + seat[i] +"',res_id='"+session_id+"',res_date=SYSDATE where seat_id='" + seat[i] + "'";
					rs=stmt.executeQuery(sql);
					if(rs!=null){
						%>
						<script>   
								alert("<%=seat[i]%>예약되었습니다.");
								location.href="select.jsp";
						</script>
						<%
					}
				}
	
			stmt.close();
			myConn.close();
			
		}catch(SQLException e){
		    out.println(e);
		    e.printStackTrace();
		}
	}

%>
</body>
</html>