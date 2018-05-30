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
        <style>
            th{
                text-align: center;
            }
        </style>
       

		<script>
			function loadXMLDoc() {
				var xmlhttp;
				var keys = document.dummy.custName.value
				var urls = "/Gym/Ajax/Custmer/searchCustmer.jsp?ok=" + keys
				if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4) {
						var some = xmlhttp.responseXML.documentElement;
						document.dummy.price.value = some;
						}
				}
				xmlhttp.open("GET", urls, true);
				xmlhttp.send();
			}
		</script>

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
                                <h1 class="page-header">Customer Search</h1>
                            </div>
                        </div>

                        <!-- ... Your content goes here ... -->

                    <%
                        HttpSession session1 = request.getSession(true);
                        String name = (String) session1.getAttribute("username");

                        if (name != null) {
                       
                    %>

                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                           
                            <form class="form-inline" action="" method="post" name="dummy">
                                <input type="text" name="custName" class="form-control" placeholder="Enter Customer Name" onkeyup="loadXMLDoc();">
                                <input type="submit" value="Search" class="btn btn-success">
                                <a href="/Gym/custmer_registration.jsp" class="btn btn-success" style="float:right;">Register Customer</a>
                            </form>
                            <hr>
                           
                             <% 
                                     String custName  = request.getParameter("custName");
                                     String NewCustName = "%"+custName+"%";
                                     if(custName != null)
                                         {
                                             
                                         
                                            Connection connection = DBconnection.getDBConnection();
                                             PreparedStatement ps = connection.prepareStatement("SELECT * FROM `custmer_registration` WHERE `name` LIKE ? ");
                                             ps.setString(1, NewCustName);
                                            ResultSet rs =  ps.executeQuery();
                                          //  System.out.println("Custmer Search Qwery ********: ******" + ps);
                                        
                                    
                             %>
                             <table class="table text-center">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                 <% 
                                        while (rs.next())
                                        {
                              %>
                                                <tr>
                                                    <td><%=rs.getString("name")%></td>
                                                    <td><%=rs.getString("phone")%></td>
                                                    <td><%=rs.getString("email")%></td>
                                                </tr>
                                         <% } 
                                     
                                }%>  
                                </tbody>
                            </table>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>

                    <%
                        } else {
                            response.sendRedirect("/Gym/login.jsp");
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
