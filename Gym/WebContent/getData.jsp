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

<!-- CSS for dialog box -->
<style>
</style>

<script type="text/javascript">
	function total_amount() {
		var price = document.getElementById("price").value;
		var quantity = document.getElementById("quantity").value;
		var gst = document.getElementById("gst").value;
		var discount = document.getElementById("discount").value;
		var recAmount = document.getElementById("recAmount").value;
		var tgst = (price * quantity) * (gst / 100);
		document.getElementById("res").value = (price * quantity) + tgst;
	}

	function balence_amount() {
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
						<h1 class="page-header">Bill</h1>
					</div>
				</div>

				<!-- ... Your content goes here ... -->

				<%
					HttpSession session1 = request.getSession(true);
					String name = (String) session1.getAttribute("username");

					if (name != null) {
						String barcode = request.getParameter("barcode");
				%>
				
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
					   <%
								String pname[] = request.getParameterValues("pname");
								String Uname[] = request.getParameterValues("name");
								String price[] = request.getParameterValues("price");
								String quantity[] = request.getParameterValues("quantity");
								String gst[] = request.getParameterValues("gst");
								String amount[] = request.getParameterValues("amount");
								String AvalableQty[] = request.getParameterValues("AvalableQty");
							
								
								
								 session1.setAttribute("pname", pname);
								 session1.setAttribute("price", price);
								 session1.setAttribute("quantity", quantity);
								 session1.setAttribute("gst", gst);
								 session1.setAttribute("amount", amount);
								 session1.setAttribute("Uname", Uname);
								 session1.setAttribute("AvalableQty", AvalableQty);
								 
								 
								float[] FinalAmount = new float[amount.length];
								
								for(int i=0;i<FinalAmount.length;i++) {
									FinalAmount[i]=Float.parseFloat(amount[i]);
								}
								
								float total=0;
								
								for(float c : FinalAmount) {
									total+=c;
									//System.out.println("Array Parceing : "+c);
								}
								//	out.print(total_amount);
								
								int len = pname.length;
								
						%>
						<form action="/Gym/sell">
						<table class="table">
							<%
							for(int i=0;i<len;i++)
							{
								
								out.print("<tr><td>"+pname[i]+"</td><td>"+Uname[i]+"</td><td>"+price[i]+"</td><td>"+quantity[i]+"</td><td>"+gst[i]+"</td><td>"+amount[i]+"</td></tr>");
							}
							
							%>
						</table>
						
						 <table>
							<tr>
								<th>Total Amount </th>
								<td><input type="text" value="<%= total%>" name="totalAmount"></td>
							</tr>
							
							<tr>
								<th>Discount Amount :</th>
								<td><input type="text" name="discountAmount"></td>
							</tr>
							
							<tr>
								<th>Recived Amount :</th>
								<td><input type="text" name="recivedAmount"></td>
							</tr>
							
							<tr>
								<th>Balence Amount :</th>
								<td><input type="text" name="balenceAmount"></td>
							</tr>
						</table> 
						<input type="submit" value="Submit" class="btn btn-primary">
						<!-- <a href="/Gym/print_bill_update.jsp" class="btn btn-primary">Print Bill</a> -->
						</form>
					</div>
					<div class="col-sm-1"></div>
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
