
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="conect.DBconnection"%>
<%-- 
    Document   : index
    Created on : 24 Nov, 2017, 7:44:46 PM
    Author     : Genius
--%>

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


        <script type="text/javascript">

            function  total_amount()
            {
                var price = document.getElementById("price").value;
                var quantity = document.getElementById("quantity").value;
                var gst = document.getElementById("gst").value;
                var discount = document.getElementById("discount").value;
                var recAmount = document.getElementById("recAmount").value;
                var tgst = (price * quantity) * (gst / 100);
                document.getElementById("res").value = (price * quantity) + tgst;
            }

            function  balence_amount()
            {
                var price = document.getElementById("price").value;
                var quantity = document.getElementById("quantity").value;
                var gst = document.getElementById("gst").value;
                var discount = document.getElementById("discount").value;
                var recAmount = document.getElementById("recAmount").value;
                var tgst = (price * quantity) * (gst / 100);

                var total_amount = (price * quantity) + tgst;
                //var final_discount = total_amount - discount;
                document.getElementById("res1").value = total_amount - discount - recAmount;
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
                                <h1 class="page-header">Buy</h1>
                            </div>
                        </div>

                        <!-- ... Your content goes here ... -->
                    <%

                        HttpSession session1 = request.getSession(true);
                        String name = (String) session1.getAttribute("username");

                        if (name != null) {
                            
                        Connection con  = DBconnection.getDBConnection();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM `byers` WHERE `balence` > 0");
                       ResultSet rs =  ps.executeQuery();
                       
                    %>

                    <div class="row">
                        
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                         <th>Product Name</th>
                                         <th>Total Amount</th>
                                          <th>Paid Amount</th>
                                          <th>Balance</th>
                                           <th>Note</th>
                                    </tr>
                                    
                                </thead>
                                <tbody>
                                    <%
                                       while (rs.next())
                                       {                                
                           
                                    %>
                                        <tr>
                                            <td><a href="/Gym/clearBuyBalence.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("buyer_name")%></a></td>
                                            <td><%=rs.getString("product_name")%></td>
                                            <td><%=rs.getFloat("total_amount")%></td>
                                            <td><%=rs.getFloat("paid")%></td>
                                             <td><%=rs.getFloat("balence")%></td>
                                              <td><%=rs.getString("note")%></td>
                                        </tr>
                                    <%  }  %>
                                </tbody>
                            </table>
                            
                       
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
