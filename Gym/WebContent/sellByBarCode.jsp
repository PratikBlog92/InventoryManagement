<%-- 
    Document   : sell
    Created on : 24 Nov, 2017, 7:58:47 PM
    Author     : Genius
--%>


<%@page import="model_barcode.BarcodeModel"%>
<%@page import="java.util.*"%>
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
                var BarcodefinalCost = document.getElementById("BarcodefinalCost").value;
                var BarcodeDiscountCost = document.getElementById("BarcodeDiscountCost").value;
                var BarcodeRecivedCost = document.getElementById("BarcodeRecivedCost").value;
                var BarcodeBaleneCost = document.getElementById("BarcodeBaleneCost").value;
               var price = BarcodefinalCost - BarcodeDiscountCost;
               var balence = price - BarcodeRecivedCost;

                //var total_amount = (price * quantity) + tgst;
                //var final_discount = total_amount - discount;
                document.getElementById("BarcodeBaleneCost").value = price - BarcodeRecivedCost;
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
                                <h1 class="page-header">Sell</h1>
                            </div>
                        </div>
															
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<center>
									<form action="/Gym/getBarcodeDetails" method="post" class="form-inline">
									
									<%
										if(session.getAttribute("name_by_barcode") != null)
										{
									%>		
											<label><b>Buyer Name:</b></label>							
											<input type="text" name="name" value="<%=session.getAttribute("name_by_barcode")%>" class="form-control" disabled>
									<%
									}else if(session.getAttribute("name_by_barcode") == null){
											%>
											<label><b>Buyer Name:</b></label>
											<select class="form-control" name="name" id="name">
												<%
													Connection con = DBconnection.getDBConnection();
														PreparedStatement ps = con.prepareStatement("SELECT name FROM `custmer_registration` ");
														ResultSet rs = ps.executeQuery();
				
														while (rs.next()) {
												%>
												<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
												<%
													}
												%>
											</select> 
											<%
										}
									%>
										<input type="text" required placeholder="Enter Barcode" name="barcode" class="form-control" autofocus>
										<input type="submit" value="Search" class="btn btn-success">
									</form>
									<hr>
								</center>
							</div>
							<div class="col-md-3"></div>
						</div>
							
							<form action="/Gym/printByBarcode.jsp">
								
								<table class="table">
		                           <tr>
		                           		<!-- <th>ID</th> -->
		                           		<th>Product Name</th>
		                           		<th>GST</th>
		                           		<th>Cost</th>
		                           		<th>Quantity</th>
		                           		<th>Brand</th>
		                           		<th>Total Cost</th>
		                           </tr>	
		                           <%	
		                           	
		                           if(session.getAttribute("al") != null)
		                           {
		                        	   /* Take data from session */
		                        	   ArrayList alist = new ArrayList();
		                        	   alist = (ArrayList)	session.getAttribute("al");  
		                        	   
		                        	   /* Setting same arraylist value in session */
		                        	   session.setAttribute("al", alist);
		                        	   
	
		                        		/* take same data convert it into arraylist and print it */
		                        		float finalTotalCst=0;
		                        	   for(int i=0;i < alist.size();i++)
		                        		{
			                        		BarcodeModel bmc =(BarcodeModel) alist.get(i);
			                        		float GST =  (bmc.getCost() * bmc.getQuantity())*(bmc.getGst()/100);
			                        		float total_c = (bmc.getCost()*bmc.getQuantity()) + GST;
			                        		finalTotalCst = finalTotalCst + total_c;
			                        		%>
			                        		<tr>
				                           		<%-- <td><%=bmc.getId()%></td> --%>
				                           		<td><%=bmc.getProduct_name()%></td>
				                           		<td><%=bmc.getGst()%></td>
				                           		<td><%=bmc.getCost()%></td>
				                           		<td><%=bmc.getQuantity()%></td>
				                           		<td><%=bmc.getBrand()%></td>
				                           		<th><i><%=total_c%></i></th>
		                         			</tr>			
		                         			<%
		                        		}	  
		                        	   %>
		                        	   <tr style="color: aqua;">
		                        	   		<th>Total Amount</th>
		                        	   		<th><input type="text" value="<%=finalTotalCst%>" name="BarcodefinalCost" id="BarcodefinalCost"></th>
		                        	   </tr>
		                        	   <tr style="color: aqua;">
		                        	   		<th>Discount Amount</th>
		                        	   		<th><input type="text" name="BarcodeDiscountCost" id="BarcodeDiscountCost"></th>
		                        	   </tr>
		                        	   <tr style="color: aqua;">
		                        	   		<th>Recived Amount</th>
		                        	   		<th><input type="text" name="BarcodeRecivedCost" id="BarcodeRecivedCost" onblur="balence_amount();"></th>
		                        	   </tr>
		                        	   <tr style="color: aqua;">
		                        	   		<th>Balance Amount</th>
		                        	   		<th><input type="text" name="BarcodeBaleneCost" id="BarcodeBaleneCost"></th>
		                        	   </tr>
		                        	   <%
		                        	}
		                           
		                           %>
		                          
	                            </table>
	                            <input type="submit" value="Submit" class="btn btn-primary">
							</form>           
		                          <!-- ... Your content goes here ... -->
                   </div>
			</div>
        </div>
        
       <!-- Check weather barcode sell is complit or not -->
			<%
				if(request.getAttribute("TransationDone") != null)
				{
				%>
				<script>
					alert("Sell Done Successfully...");
				</script>
				<%	
				}
			%>
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
