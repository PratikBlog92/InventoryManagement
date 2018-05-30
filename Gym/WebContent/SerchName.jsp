<%-- 
    Document   : sell
    Created on : 24 Nov, 2017, 7:58:47 PM
    Author     : Genius
--%>

<%@page import="conect.DBconnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Startmin - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="wrapper">

    <!-- Navigation -->
    
    <jsp:include page="temp.jsp"></jsp:include>
    
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Buyers List</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            <% 
            
            try { 
				
				Connection connection = DBconnection.getDBConnection();
				System.out.println("Connection Eastablished\n");
				PreparedStatement ps = connection.prepareStatement("SELECT * FROM `byers`");
				
				ResultSet rs = ps.executeQuery();
				
            %>
				<table class="table" style="margin-top: 40px;">
						<thead>
							<tr>
								<th>ID</th>
								<th>Seller Name</th>
								<th> Product Name</th>
								<th> Price</th>
								<th> Quantity </th>
								<th> Total Amount</th>
								<th>Recived Amount</th>
								<th> Balence</th>
							 </tr>
						</thead>
				
				<%
				while(rs.next())
				{
					%>
						<tbody>
							<tr>
								<td><%= rs.getString("id") %></td>
								<td><%= rs.getString("buyer_name") %></td>
								<td><%= rs.getString("product_name") %></td>
								<td><%= rs.getFloat("price") %></td>
								<td><%= rs.getInt("quantity") %></td>
								<td><%= rs.getFloat("total_amount") %></td>
								<td><%= rs.getFloat("paid") %></td>
								<td><%= rs.getFloat("balence") %></td>
							</tr>
						</tbody>
					<%
				}
				%>
				</table>
				<%
			}catch(Exception e){
				e.printStackTrace();
			}
		
               %>             
            <!-- ... Your content goes here ... -->
        </div>
    </div>

</div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/startmin.js"></script>

</body>
</html>
