
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
               
                var BalenceAmount = document.getElementById("BalenceAmount").value;
                 var PaidBalenceAmount = document.getElementById("PaidBalenceAmount").value;
                 
                document.getElementById("result").value = BalenceAmount - PaidBalenceAmount;
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
                                <h1 class="page-header">Update Balance</h1>
                            </div>
                        </div>

                        <!-- ... Your content goes here ... -->
                    <%

                        HttpSession session1 = request.getSession(true);
                        String name = (String) session1.getAttribute("username");

                        if (name != null) {
                        String Sid = request.getParameter("id");
                        int id=0;
                        if(Sid != null)
                        {
                            id = Integer.parseInt(Sid);
                        }
                        
                           
                        Connection con  =  DBconnection.getDBConnection();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM `byers` WHERE id=?");
                        ps.setInt(1, id);
                       ResultSet rs = ps.executeQuery();
                       String balName=null;
                       int balTotal=0,balRECamount=0,balAmount=0;
                       while (rs.next()) {                               
                               balName = rs.getString("buyer_name");
                               balTotal = rs.getInt("total_amount");
                               balRECamount = rs.getInt("paid");
                               balAmount = rs.getInt("balence");
                           }
                    %>

                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <form method="post" action="">
                                 <label><b>Buyer Name:</b></label>
                                 <input type="text" name="name" class="form-control" placeholder="Enter Name" disabled value="<%=balName%>"><br>
                                
                                <label><b>Total Amount:</b></label>
                                <input type="text" name="amount" class="form-control" placeholder="Enter Amount" disabled value="<%=balTotal%>"><br>
                               
                                <label><b>Recived Amount:</b></label>
                                <input type="number" name="PaidAmount" class="form-control" placeholder="Enter Paid Ammount" disabled value="<%=balRECamount%>"><br>
                                
                                <label><b>Balence Amount:</b></label>
                                <input type="number" name="BalenceAmount" class="form-control" placeholder="Enter Balence Ammount" disabled value="<%=balAmount%>" id="BalenceAmount"><br>
                                
                                <label><b>Balence Paid :</b></label>
                                <input type="number" name="PaidBalenceAmount" class="form-control" placeholder="Enter Balence Ammount" id="PaidBalenceAmount" onblur="balence_amount();"><br>
                               
                                <label><b>Balence Remain :</b></label>
                                <input type="number" name="BalenceAmount" class="form-control" placeholder="Remaining Ammount" disabled id="result"><br>
                                <input type="submit" value="Update" class="btn btn-primary">
                            </form>
                            
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <%
                        int paid = 0;
                        if(request.getParameter("PaidBalenceAmount") != null)
                        {
                             paid = Integer.parseInt(request.getParameter("PaidBalenceAmount"));
                        }
                           
                        Connection co =DBconnection.getDBConnection();
                        PreparedStatement pst = co.prepareStatement("UPDATE `byers` SET `paid`=?, `balence`=?  WHERE `id`= ?");
                        pst.setInt(1,paid + balRECamount );
                         pst.setInt(2,balAmount-paid);
                          pst.setInt(3,id );
                          pst.executeUpdate();
                       
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
