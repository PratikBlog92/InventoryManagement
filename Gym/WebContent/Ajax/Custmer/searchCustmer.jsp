<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conect.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<%
		String name = request.getParameter("ok");
		
		Connection conn = DBconnection.getDBConnection();
		PreparedStatement pst = conn.prepareStatement("SELECT * FROM `custmer_registration` WHERE `name` LIKE '%"+name+"%' ");
		
		/* pst.setString(1, name); */
		System.out.print(pst);
		ResultSet rs =	pst.executeQuery();
		
		out.print("<table><tr><th>Name</th><th>Phone</th><th>Email</th></tr>");
		while(rs.next())
		{
			out.print("<tr>");
			out.print("<td>"+ rs.getString("name") +"</td>");
			out.print("</tr>");
		}
%>

</head>
<body>

</body>
</html>