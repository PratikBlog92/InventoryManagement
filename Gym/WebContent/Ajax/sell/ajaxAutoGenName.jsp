
<%@page import="java.sql.*"%>
<%@page import="conect.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<title>Insert title here</title>
</head>
<body>
<%
String str = request.getParameter("name");
	
if(str != null && (!str.equals("")))
	{
		Connection conn = 	DBconnection.getDBConnection();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM `custmer_registration` WHERE `name` LIKE '%"+str+"%'");
		System.out.print(ps);
		ResultSet rs = 	ps.executeQuery();
		
		while(rs.next())
		{
			out.print("<li class='list-group-item'>"+rs.getString("name")+"</li>");
		}
	}
%>
<!--  onclick='getValueByer()' id='mylocationChild' -->
</body>
</html>