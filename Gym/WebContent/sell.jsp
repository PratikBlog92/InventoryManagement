<!-- sell.jsp -> getData ->sell.java ->printBillUPDATEs  -->
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
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="description" content=""/>
<meta name="author" content=""/>

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
	function total_amount() {
		var price = document.getElementById("price").value;
		var quantity = document.getElementById("quantity").value;
		var gst = document.getElementById("gst").value;
		var tgst = (price * quantity) * (gst / 100);
		document.getElementById("res").value = (price * quantity) + tgst;
	}

	function addToCart()
	{
		var name = document.getElementById("name").value;
		var pname = document.getElementById("pname").value;
		var price = document.getElementById("price").value;
		var quantity = document.getElementById("quantity").value;
		var gst = document.getElementById("gst").value;
		var totalAmount = document.getElementById("res").value;
		var AvalableQty =	document.getElementById("qty").innerHTML;
	 
		/* if(name == "")
			{
				alert("Please Enter Name");
				return false;
			}else if(quantity < AvalableQty)
			{
				alert("You enter more quantits than available ..!");
				return false;
			}else{ */
					var table = document.getElementsByTagName("TABLE")[0];
					var newRow = table.insertRow(1);
					var cel1 = newRow.insertCell(0);
					var cel2 = newRow.insertCell(1);
					var cel3 = newRow.insertCell(2);
					var cel4 = newRow.insertCell(3);
					var cel5 = newRow.insertCell(4);
					var cel6 = newRow.insertCell(5);
					var cel7 = newRow.insertCell(6);
					cel1.innerHTML = '<input type="text" placeholder="Enter Name" name="name" style="border:none;text-align:center;" value="'+name+'">';
					cel2.innerHTML = '<input type="text" placeholder="Enter Name" name="pname" style="border:none;text-align:center;" value="'+pname+'">';
					cel3.innerHTML = '<input type="text" placeholder="Enter Name" name="price" style="border:none;text-align:center;" value="'+price+'">';
					cel4.innerHTML = '<input type="text" placeholder="Enter Name" name="quantity" style="border:none;text-align:center;" value="'+quantity+'">';
					cel5.innerHTML = '<input type="text" placeholder="Enter Name" name="gst" style="border:none;text-align:center;" value="'+gst+'">';
					cel6.innerHTML = '<input type="text" placeholder="Enter Name" name="amount" style="border:none;text-align:center;" value="'+totalAmount+'">';
					cel7.innerHTML = '<input type="hidden" name="AvalableQty" style="border:none;text-align:center;" value="'+AvalableQty+'">';
				/* } */			
	}

 	function  AddAllData() {
 		var val =document.getElementById("amount").value;
		console.log(val);
 	}
	
	function loadXMLDoc()
	{
		var xmlhttp;
		var keys=document.dummy.pname.value;
		var urls="/Gym/Ajax/ajaxDataCost.jsp?ok="+keys;
			if (window.XMLHttpRequest)
			{// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
			}
			else
			{// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4)
			{
				var some=xmlhttp.responseXML.documentElement;
				document.dummy.price.value = some.getElementsByTagName("empno")[0].childNodes[0].nodeValue;
				document.dummy.gst.value = some.getElementsByTagName("gst")[0].childNodes[0].nodeValue;//quantity
				document.getElementById("qty").innerHTML =  some.getElementsByTagName("quantity")[0].childNodes[0].nodeValue;
			}
		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
	}
	
	
	 function autoGenName()
	{ 
		var request=new XMLHttpRequest();  
		var name=document.dummy.name.value;  
		var url="/Gym/Ajax/sell/ajaxAutoGenName.jsp?name="+name;  
		  
		try{  
				request.onreadystatechange=function()
				{  
					if(request.readyState==4)
					{  
						var val=request.responseText;  
						document.getElementById('mylocation').innerHTML=val;  
					}  
				}//end of function  
			request.open("GET",url,true);  
			request.send();  
			}catch(e)
			{
				alert("Unable to connect to server");
			}   
	}   
	 
	
	function  a() {
		  var items =document.querySelectorAll("#mylocation li");
		  for(var i = 0; i<items.length; i++)
	      {
	          items[i].onclick = function(){
	              document.getElementById('name').value = this.innerHTML;
	              document.getElementById('mylocation').remove();
	          }
	      } 
		  
	}  
	  function checkQuantity() {
		  var avlQuantity = document.getElementById("qty").innerHTML;
		  var enterdQuantity = document.dummy.quantity.value
		  
		  if(enterdQuantity < avlQuantity)
			  {
			  	alert("You enter more quantits than available ..!");
			  	return false;
			  }
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
				%>
				<div>
					<b><a href="/Gym/sellByBarCode.jsp" class="btn btn-primary">Sell
							Using BarCode</a></b>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<form method="get" action="#" name="dummy">
							<label><b>Buyer Name:</b></label>
							<input type="text" name="name" class="form-control" placeholder="Enter Name" id="name"  onkeyup="autoGenName();"><br>
								<ul id="mylocation" class="list-group" onclick="a()"> </ul>
							
							
							<!--
								 1. take input as ID here inside value field
							 	 2. pass the ID in name field and get respected value from them  
							 -->
							<%-- 
							
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
							
							 --%>
							
							<label><b>Product Name:</b></label>
							<!-- <input type="text" name="pname" class="form-control" placeholder="Enter Products Details"><br> -->
							 <select class="form-control" name="pname" id="pname"  onchange="loadXMLDoc();">
							<%
									Connection con1 = DBconnection.getDBConnection();
										PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `product_registration`");
										ResultSet rs1 = ps1.executeQuery();
										
										while (rs1.next()) {
								%>
								<option value="<%=rs1.getString("product_name")%>"><%=rs1.getString("product_name")%></option>
								<%
									}
								%>
							</select>
							
							 <label><b>Price (Per Product):</b></label> 
							<input type="number" name="price" class="form-control" placeholder="Enter Price" id="price" required disabled><br> 
								
								<label><b>Quantity:</b></label>
							<input type="number" name="quantity" class="form-control" placeholder="Enter Quantity" id="quantity" required min="1"><!-- onblur="checkQuantity();" -->
							<span style="color: red;">Available Quantity : <b id="qty"></b></span><br><br>

							<label><b>GST (%):</b></label>
							 <input type="number" name="gst" class="form-control" placeholder="Enter GST" id="gst" onblur="total_amount()" required><br> 
								
								<label><b>Total Amount:</b></label>
								 <input type="number" name="amount" class="form-control" placeholder="Enter Amount" disabled id="res" required><br>

							   <!--  <label><b>Discount :</b></label> 
							    <input type="number" name="discount" class="form-control"  placeholder="Enter Discount" id="discount" required><br>

								<label><b>Recived Amount:</b></label> 
								<input type="number" name="PaidAmount" class="form-control" placeholder="Recived Ammount" id="recAmount"onblur="balence_amount()" required><br> 
								
								<label><b>Balence Amount:</b></label> 
								<input type="number" name="BalenceAmount"	class="form-control" placeholder="Balence Ammount" disabled	id="res1" required><br> 
								 -->
						<!-- 	<label><b>Note:</b></label>
							<textarea name="note" style="height: 100px" class="form-control"></textarea> -->
							
							
							<br> <a onclick="addToCart();" class="btn btn-success"> Add</a> 
							<!-- <input type="submit" value="Submit" class="btn btn-success" id="myBtn"> -->
						</form>
					</div>
					
					
					<div class="col-sm-9">
						<form action="/Gym/getData.jsp">
							<table id="myTable" class="table table-bordered">
								<tr>
									<th>Name</th>
									<th>Product Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>GST</th>
									<th>Total Amount</th>
								</tr>

						<!--	<tr>
									<td id="resName"></td>
									<td id="resPName"></td>
									<td id="resPrice"></td>
									<td id="resQuantity"></td>
									<td id="resGst"></td>
									<td id="resTotalAmount"></td>
								</tr>
								
								 <tr>
									<td><B>Total</B></td>
									<td><B>Discount</B></td>
									<td><B>Recived Amount</B></td>
									<td><b>Balence</b></td>
								</tr> -->
							</table>
							
							<!-- <table>
								<tr>
									<th><label><b>Note :</b></label></th>
									<td><textarea name="note" style="height: 50px;width: 500px;border: none;"></textarea></td>
								</tr>
								
								<tr>
									<th><label><b>Total Amount :</b></label></th>
									<td><input type="text" name ="total_amount" style="border: none;" value="0" id="tAmount"></td>
								</tr>
								
								<tr>
									<th><label><b>Discount :</b></label></th>
									<td><input type="text" name ="discount" style="border: none;" value="0"></td>
								</tr>
								
								<tr>
									<th><label><b>Recived Amount:</b></label></th>
									<td><input type="text" name ="recived_amount" style="border: none;" value="0"></td>
								</tr>
								
								<tr>
									<th><label><b>Balence:</b></label></th>
									<td><input type="text" name ="balence" style="border: none;" value="0"></td>
								</tr>
								
							</table> -->
							<!-- 
							<label><b>Note :</b></label>
							<textarea name="note" style="height: 50px;width: 500px;border: none;"></textarea><br>
							
							<label><b>Total Amount :</b></label>
							<input type="text" name ="total_amount" style="border: none;" value="0"><br>
							
							<label><b>Discount :</b></label>
							<input type="text" name ="discount" style="border: none;" value="0"><br>
							
							<label><b>Recived Amount:</b></label>
							<input type="text" name ="recived_amount" style="border: none;" value="0"><br>
							
							<label><b>Balence:</b></label>
							<input type="text" name ="balence" style="border: none;" value="0"><br>
							
							 -->
							 
							 <!-- <input type="button" value="Total" onclick="AddAllData();">  -->
							 							
							<input type="submit" value="Submit" class="btn btn-primary">
						</form>
					</div>

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
