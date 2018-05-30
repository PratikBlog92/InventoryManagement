<%-- 
    Document   : sell
    Created on : 24 Nov, 2017, 7:58:47 PM
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
        
       /* function loadXMLDoc() {
		var xmlhttp;
		var price = document.getElementById("price").value;
		var quantity = document.getElementById("quantity").value;
                var gst = document.getElementById("gst").value;
                var discount = document.getElementById("discount").value;
                var ReciveAmount = document.getElementById("ReciveAmount").value;
		var urls = "http://localhost:8084/Gym/sellTest?price="+price+"&quantity="+quantity+"&gst="+gst+"&discount="+discount+"&ReciveAmount="+ReciveAmount;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				//document.getElementById("err").style.color="red";
				document.getElementById("res").value = xmlhttp.responseText;

			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
	}
        
        
    */
   
   
    function loadXMLDoc() {
		var xmlhttp;
		var price = document.getElementById("price").value;
		var quantity = document.getElementById("quantity").value;
                var gst = document.getElementById("gst").value;
                var discount = document.getElementById("discount").value;
                
                var tgst = (price/100)*quantity;
                
               document.getElementById("res").value = (price * quantity)+tgst;
                
                
        
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
            
            
            
                    <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                
                <form method="post" action="/Gym/sell">
                    <label><b>Seller Name:</b></label>
                    <input type="text" name="name" class="form-control" placeholder="Enter Name"><br>
                    <label><b>Product Name:</b></label>
                    <input type="text" name="pname" class="form-control" placeholder="Enter Products Details"><br>
                    <label><b>Price (Per Product):</b></label>
                    <input type="text" name="price" class="form-control" placeholder="Enter Price" id="price"><br>
                    <label><b>Quantity:</b></label>
                    <input type="text" name="quantity" class="form-control" placeholder="Enter Quantity" id="quantity"><br>
                     <label><b>GST (%):</b></label>
                     <input type="text" name="gst" class="form-control" placeholder="Enter GST" id="gst" onblur="loadXMLDoc()"><br>
                     <label><b>Total Amount:</b></label>
                     <input type="text" name="amount" class="form-control" placeholder="Enter Amount" id="res" disabled><br>
                     <label><b>Discount :</b></label>
                     <input type="text" name="discount" class="form-control" placeholder="Enter Discount" id="discount"><br>
                     <label><b>Recived Amount:</b></label>
                     <input type="text" name="PaidAmount" class="form-control" placeholder="Recived Ammount" id="ReciveAmount"><br> 
                     <label><b>Balence Amount:</b></label>
                     <input type="text" name="BalenceAmount" class="form-control" placeholder="Balence Ammount" disabled><br> 
                     
                     <label><b>Note :</b></label>
                     <textarea  name="note" style="height: 100px" class="form-control"></textarea><br>
                     
                     
                     
                    <input type="submit" value="Submit" class="btn btn-success">
                    
                   
                </form>
                
            </div>
            <div class="col-sm-4">  
                
            </div>
        </div>
            
                            
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
