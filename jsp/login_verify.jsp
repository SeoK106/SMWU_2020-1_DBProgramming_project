<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");

Connection con=null;
String driver = "oracle.jdbc.driver.OracleDriver";
//String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//String user = "db1713926";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "db1610049";
String passwd = "oracle";  

String msg="";
String major="";

try{
	Class.forName(driver);
	con=DriverManager.getConnection(url,user,passwd);
}catch(SQLException ex){
	System.out.println("SQLException: "+ex.getMessage());
}

CallableStatement cstmt=con.prepareCall("{call login_verify_func(?,?,?,?)}");
cstmt.setString(1,userID);
cstmt.setString(2,userPassword);
cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
try{
	cstmt.execute();
	major=cstmt.getString(3);
	msg=cstmt.getString(4);
}catch(SQLException ex){
	System.out.println("SQLException: "+ex.getMessage());
}finally{
	if(cstmt!=null)
		try{
			con.commit();cstmt.close();con.close();
		}catch(SQLException ex){}
}

if (!(major.equals("major"))){
	session.setAttribute("user", userID);
	session.setAttribute("major", major);
	System.out.println(session.getAttribute("major"));
%>
<script>
	alert("<%=msg%>");
	location.href ="main.jsp" ; 
</script>
<%} else { 
%>	
<script>
	alert("<%=msg%>");
	location.href = "login.jsp"; 
</script>
<%
}
con.close();
%>
