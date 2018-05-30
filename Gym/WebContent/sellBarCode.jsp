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
		document.getElementById("res1").value = total_amount - discount
				- recAmount;
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

				<!-- ... Your content goes here ... -->

				<%
					HttpSession session1 = request.getSession(true);
					String name = (String) session1.getAttribute("username");

					if (name != null) {
						String barcode = request.getParameter("barcode");
				%>
				
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">


						<form method="get" action="/Gym/SellingBill.jsp">
							<label><b>Buyer Name:</b></label>
							<!-- <input type="text" name="name" class="form-control" placeholder="Enter Name"><br> -->
							<select class="form-control" name="name">
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

							</select> <label><b>Product Name:</b></label>
							<input type="text" name="pname" class="form-control" placeholder="Enter Products Details" value="<%= barcode%>">
							<!-- <input type="text" name="pname" class="form-control" placeholder="Enter Products Details"><br> -->
							<%-- <select class="form-control" name="pname">
								<%
									Connection con1 = DBconnection.getDBConnection();
											PreparedStatement ps1 = con1.prepareStatement("SELECT `product_name` FROM `product_registration`");
											ResultSet rs1 = ps1.executeQuery();

											while (rs1.next()) {
								%>
								<option value="<%=rs1.getString("product_name")%>"><%=rs1.getString("product_name")%></option>
								<%
									}
								%>
							</select> --%>
							
							<label><b>Price (Per Product):</b></label> 
							<input type="number"	name="price" class="form-control" placeholder="Enter Price"	id="price" required><br> <label><b>
							
							Quantity:</b></label>
							<input type="number" name="quantity" class="form-control" placeholder="Enter Quantity" id="quantity" required><br>
							
							<label><b>GST (%):</b></label> 
							<input type="number" name="gst" class="form-control" placeholder="Enter GST" id="gst" onblur="total_amount()" required><br> 
							
							<label><b>Total Amount:</b></label>
							<input type="number" name="amount" class="form-control" placeholder="Enter Amount" disabled id="res" required><br>
							
							<label><b>Discount :</b></label> 
							<input type="number" name="discount" class="form-control" placeholder="Enter Discount" id="discount" required><br>
							
							<label><b>Recived Amount:</b></label>
							<input type="number" name="PaidAmount" class="form-control" placeholder="Recived Ammount" id="recAmount" onblur="balence_amount()" required><br> 
							
							<label><b>Balence Amount:</b></label> 
							<input type="number" name="BalenceAmount" class="form-control" placeholder="Balence Ammount" disabled id="res1" required><br> 
							
							<label><b>Note:</b></label>
							<textarea name="note" style="height: 100px" class="form-control"></textarea><br> 
							
							<input type="submit" value="Submit" class="btn btn-success" id="myBtn">
						</form>

						<%-- <!-- CSS for dialog box --> --%>
						<%-- <!-- END-OF CSS for dialog box --> --%>


					</div>
					<div class="col-sm-4"></div>
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
