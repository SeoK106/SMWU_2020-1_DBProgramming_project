<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>

<style type="text/css">
	* {
		font-family: ppi;
	}
</style>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>도서관 사용자 정보 조회 </title>
	<link rel='stylesheet' href='./dbDesign.css' />	
</head>
<body>
<%@ include file="top.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection myConn = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";	
	String user = "db1610049";
	//String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	//String user = "db1713926";
	String pw = "oracle";
	
	Connection con = DriverManager.getConnection(dburl, user, pw);
	
	String b_id ;
	String title = null;
	String author = null;
	String publisher = null;
	String date_book = null;
	
	String seat = null;
	String date_seat = null;
	
	SimpleDateFormat bookFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat seatFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	Date book_reserv_date;
	Date book_return_date;
	Date seat_reserv_date;
	Date seat_return_date;
	Calendar cal_return = Calendar.getInstance();
	Calendar cal_reserv = Calendar.getInstance();

	String query_reserv_books ;
	String query_check_out_books ;
	String query_seats = "select * from seats where res_id="+session_id;
	Statement stmt_reserv_books = con.createStatement();
	Statement stmt_check_out_books = con.createStatement();
	Statement stmt_seats = con.createStatement();
	ResultSet rs_reserv_books ;
	ResultSet rs_check_out_books;
	ResultSet rs_seats = stmt_seats.executeQuery(query_seats);
	
	int count = 0;
	int count_ck = 0;
	if (session_id == null) { 
		
	%>
		<script> 
			alert("로그인 후 사용하세요."); 
			location.href="login.jsp";  
		</script>
	<% } else {
	%>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 도서 예약 내역 </b></td><p>
			</tr>
			<th align="center"></th>
			<th align="center">제목</th>
			<th align="center">저자</th>
			<th align="center">출판사</th>
			
			
			<%
				query_reserv_books = "select * from books" + 
							" where b_id in (select b_id from reserve where s_id = '"+ session_id + "')" ;
					
				rs_reserv_books = stmt_reserv_books.executeQuery(query_reserv_books);
					
				while (rs_reserv_books.next()) {
					b_id = rs_reserv_books.getString("b_id");
					title = rs_reserv_books.getString("title");
					author = rs_reserv_books.getString("author");
					publisher = rs_reserv_books.getString("publisher");
				
					count++;
					
				%>
					<tr>
						<td align="center"><%=count%> </td>
						<td align="center"><%=title%> </td>
						<td align="center"><%=author%></td>
						<td align="center"><%=publisher%></td>
						<td align="center"><b><a href="resDelete.jsp?b_id=<%=b_id%>">예약 취소</b></td>
					</tr>
				<%
					
				}
				if (count == 0){
			%>
			<tr>
				<td align="center">예약 내역이 없습니다.</td><p>
			</tr>
			<%} else { %>
			<tr>
				<td align="center">총 <%=count%>권 예약하셨습니다.</td><p>
			</tr>
			<% } %>
		</table>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 도서 대출 내역 </b></td><p>
			</tr>
			<th align="center"></th>
			<th align="center">제목</th>
			<th align="center">저자</th>
			<th align="center">출판사</th>
			<th align="center">대출 일자</th>
			<th align="center">반납 기한</th>
			<th> </th>
				<%
				query_check_out_books = "select * from books, checkout "+
						"where books.b_id=checkout.b_id and " + 
						"checkout.s_id='" + session_id + "'";		
				System.out.println(query_check_out_books);
				rs_check_out_books = stmt_check_out_books.executeQuery(query_check_out_books);
							
				while (rs_check_out_books.next()) {
					count_ck++;
					
					b_id = rs_check_out_books.getString("b_id");
					title = rs_check_out_books.getString("title");
					author = rs_check_out_books.getString("author");
					publisher = rs_check_out_books.getString("publisher");
					date_book = rs_check_out_books.getString("ck_date");
					date_book = date_book.split(" ")[0];
					
					book_reserv_date = bookFormat.parse(date_book);
					cal_reserv.setTime(book_reserv_date);
					cal_reserv.add(Calendar.HOUR, 9);

					
					book_return_date = bookFormat.parse(date_book);
					cal_return.setTime(book_return_date);
					//cal_return.add(Calendar.HOUR, 9);
					cal_return.add(Calendar.DATE, 14);
					%>
						<tr>
							<td align="center"><%=count_ck%> </td>
							<td align="center"><%=title%> </td>
							<td align="center"><%=author%></td>
							<td align="center"><%=publisher%></td>
							<%-- <td align="center"><%=bookFormat.format(cal_reserv.getTime()) %></td> --%>
							<td align="center"><%=date_book%></td>
							<td align="center"><%=bookFormat.format(cal_return.getTime()) %></td>
							<td><b><a href="returnBook.jsp?b_id=<%=b_id%>">반납</b></td>
						</tr>
					<%
				}
				if (count_ck == 0){
			%>
			<tr>
				<td align="center">대출 내역이 없습니다.</td><p>
			</tr>
			<%} else { %>
			<tr>
				<td align="center">총 <%=count_ck%>권 대출하셨습니다.</td><p>
			</tr>
			<% 			
			} 						
			%>
		</table>
		<table class="type02" width="75%" align="center">
			<tr>
				<td><b><%=session_id%>님 좌석 예약 내역 </b></td><p>
			</tr>
			<%
				int count_seats = 0;
				while (rs_seats.next()) {
					count_seats++;
					
					seat = rs_seats.getString("seat_id");
					date_seat = rs_seats.getString("res_date");
					
					seat_reserv_date = seatFormat.parse(date_seat);
					cal_reserv.setTime(seat_reserv_date);
					cal_reserv.add(Calendar.HOUR, 9);
					
					seat_return_date = seatFormat.parse(date_seat);
					cal_return.setTime(seat_return_date);
					//cal_return.add(Calendar.HOUR, 9);
					cal_return.add(Calendar.HOUR, 6);

			%>
				<tr>
					<th scope="row">이용 중인 좌석</th>
					<td><%=seat%> </td><p>
					<td><b><a href="resDelete_seat.jsp?s_id=<%=seat%>">이용 종료</b></td>
				</tr>
				<tr>
					<th scope="row">좌석 이용 시작 시각</th>
<%-- 					<td><%=seatFormat.format(cal_reserv.getTime())%> </td><p>--%>
					<td><%=date_seat%> </td><p>
 				</tr>
				<tr>
					<th scope="row">좌석 이용 만료 시각</th>
					<td><%=seatFormat.format(cal_return.getTime()) %></td>
				</tr>
			<%
				}
				if (count_seats == 0){
					%>
					<tr>
						<td align="center">예약하신 좌석이 없습니다.</td><p>
					</tr>
					<%
				}
			%>
			
		</table>

	<%
	}%>
</body>
</html>