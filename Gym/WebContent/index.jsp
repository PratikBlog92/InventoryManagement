<%-- 
    Document   : index
    Created on : 24 Nov, 2017, 7:44:46 PM
    Author     : Genius
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conect.DBconnection"%>
<%@page import="java.sql.Connection"%>
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
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                    <h1 class="page-header">Dashboard</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            
            <div style="border: 1px solid #c9e2b3;
                        border-radius: 20px;
                        background-color: #adadad; 
                         "> <h2 style="text-align: center;"> Sell Memo </h2> </div>
        <%
            
            HttpSession session1 = request.getSession(true);
            String name = (String)session1.getAttribute("username");

            if(name != null)
            {
              try{
                
                  String dateFrom = request.getParameter("from");
                  String dateTo = request.getParameter("to");
                  String amount="",balenc="",rceivedAmount="";
                  if(dateTo != null)
                  {
                      Connection connection = DBconnection.getDBConnection();
               
                        String sql="SELECT SUM(`total_amount`),SUM(`recived_amount`),SUM(`balence`) FROM `seller` WHERE date>=? AND date<=?";

                        PreparedStatement preparedStatement = connection.prepareStatement(sql);
                        //PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
                        preparedStatement.setString(1, dateFrom);
                        preparedStatement.setString(2, dateTo);

                        ResultSet rs = preparedStatement.executeQuery();
                       // ResultSet rs1 = preparedStatement1.executeQuery();
						 while (rs.next()) {
                                amount = rs.getString(1);
                                balenc = rs.getString(3);
                                rceivedAmount  = rs.getString(2);
                            } 
                  }
                  else
                  {
                      LocalDate todayDate = LocalDate.now();
                       LocalDate day20 = todayDate.minusDays(4);
                       String from =  todayDate.toString();
                       String to =  day20.toString();
                      
                        Connection connection = DBconnection.getDBConnection();
               
                        String sql="SELECT SUM(`total_amount`),SUM(`recived_amount`),SUM(`balence`) FROM `seller` WHERE date>=? AND date<=?";

                        PreparedStatement preparedStatement = connection.prepareStatement(sql);
                         preparedStatement.setString(1, to);
                        preparedStatement.setString(2, from);
                        
                        ResultSet rs = preparedStatement.executeQuery();
                       //System.err.println("DAte qwery : "+preparedStatement);

                        while (rs.next()) {
                                amount = rs.getString(1);
                                balenc = rs.getString(3);
                                rceivedAmount  = rs.getString(2);

                            } 
                        if(amount==null)
                        {
                          amount = "0";  
                        }
                        
                        if(balenc==null)
                        {
                        	balenc = "0";  
                        }
                        
                        if(rceivedAmount==null)
                        {
                        	rceivedAmount = "0";  
                        }

                  }
            
        %>
        
        <form class="form-inline" style="margin-top: 30px;" align="center">
            <b>From :</b> <input type="date" name="from" class="form-control" required>
            <b>To : </b><input type="date" name="to" class="form-control" required>
            <input type="submit" value="Go" class="btn btn-primary">
        </form>
        
                                     <div class="row"style="margin-top: 50px;" align="center">
                                        <div class="col-md-4 jumbotron" style="text-align: center;border: 1px solid black;">
                                            <i class="fa fa-inr" style="font-size:48px;"></i><br>
                                            <h5>Total Selling Amount</h5>
                                            <span><%= amount %></span>
                                        </div>
                                        
                                      <div class="col-md-3 jumbotron" style="text-align: center;border: 1px solid black;margin-right: 5px;margin-left: 5px;">
                                            <i class="fa fa-money" style="font-size:48px;"></i><br>
                                            <h5>Total Received  Amount</h5>
                                            <span><%= rceivedAmount %></span>
                                        </div>
                                        
                                        <div class="col-md-4 jumbotron" style="text-align: center;border: 1px solid black;">
                                            <i class="fa fa-credit-card" style="font-size:48px;"></i><br>
                                            <h5>Total Balanced Amount</h5>
                                            <span><%= balenc %></span>
                                        </div>
                                    </div> 
       <%
                 }catch(Exception e)
                {
                    e.printStackTrace();
                }
                   
            }else{
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
