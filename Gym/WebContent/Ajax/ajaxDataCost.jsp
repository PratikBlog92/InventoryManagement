<%@page import="conect.DBconnection"%>
<%@page import="java.sql.*"%>
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

response.setContentType("text/xml");
String sn=request.getParameter("ok");
//int i=Integer.parseInt(sn);



	try {

		Connection con =DBconnection.getDBConnection();
		Statement st=con.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT * FROM `product_registration` WHERE `product_name`='"+sn+"'");
		
		if(rs.next())
		{
			out.println("<emp>");
			out.println("<empno>"+rs.getFloat("cost")+"</empno>");
			out.println("<gst>"+rs.getFloat("gst")+"</gst>");
			out.print("<quantity>"+rs.getInt("quantity")+"</quantity>");//quantity
			out.println("</emp>");
			System.out.print(rs.getFloat("cost"));
		}

		rs.close();
		st.close();
		con.close();

	}catch (Exception e) {
		e.printStackTrace();
	} 
%>
</body>
</html>