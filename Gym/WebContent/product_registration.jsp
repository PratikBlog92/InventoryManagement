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
        
        function  ProductDiscription()
        {
           var pname = document.getElementById("pname").value;
            var Brand = document.getElementById("Brand").value;
            var Weight = document.getElementById("Weight").value;
           //alert(pname+"-"+Brand+"-"+Weight);
           var output = pname+"-"+Brand+"-"+Weight ;
            document.getElementById("description").value = output;
        }
        
        function gst()
        {
            var gst = document.getElementById("gst").value;
            
            if(gst <= 25 gst >= 1)
            {
                break;
            }else{
                document.getElementById("gstmsg").value = "GST must be in between 1 to 25";
            }
        }
    </script>
    <style>
        d{
            color: red;
        }
    </style>
    
    
    
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
                    <h1 class="page-header">Product Registration</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            
       <%
            HttpSession session1 = request.getSession(true);
            String name = (String)session1.getAttribute("username");

            if(name != null)
            {
                String Product_Registration = (String)request.getAttribute("Product_Registration");
                if(Product_Registration  != null)
                {
                   
                    %>
                   
                    <%-- <%=Custmer_Registration%> --%>
                    <script type="text/javascript">
                        alert("Product Registration Done..!\n SUCCESSFULLY ");                        
                    </script>
                     
                     <%
                         
                }
                Product_Registration = null;
                
        %>
            
                    <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                
                <form method="post" action="/Gym/product_registration">
                    <label>Product Name :</label> <d><b>*</b></d><br>
                    <input type="text" name="pname" class="form-control" placeholder="Enter Product Name" id="pname" pattern="[A-Za-z0-9]+" title="letters and numbers only, no punctuation or special characters" required><br>
                    
                     <label>Product Barcode :</label> <d><b>*</b></d><br>
                    <input type="text" name="bCode" class="form-control" placeholder="Enter Barcode" id="Barcode" required><br><!-- pattern="[A-Za-z0-9]+" title="letters and numbers only, no punctuation or special characters" --> 
                    
                    <label>Product Brand : </label> <d><b>*</b></d><br>
                    <input type="text" name="Brand" class="form-control" placeholder="Enter Product Brand" id="Brand" pattern="[A-Za-z0-9]+" title="letters and numbers only, no punctuation or special characters" required><br>
               
                     <label>Product Weight :</label> <d><b>*</b></d><br>
                     <input type="number" name="Weight" class="form-control" placeholder="Enter Product Weight" id="Weight" onblur="ProductDiscription();" pattern="[A-Za-z0-9]+" title="letters and numbers only, no punctuation or special characters" required><br>
                    
                    <label>Product Description : </label> <d><b>*</b></d><br>
                    <input type="text" name="Description" class="form-control" placeholder="Enter Product Description" id="description" required><br>
               
                    <label>Product GST : </label> <d><b>*</b></d><br>
                    <input type="number" name="gst" class="form-control" placeholder="Enter Product GST" required pattern="" id="gst" onblur="gst();"><br>
               
                      <label>Product Cost : </label> <d><b>*</b></d><br>
                      <input type="number" name="Cost" class="form-control" placeholder="Enter Product Cost"required><br>
                    
                    
                      <label>Product Quantity : </label> <d><b>*</b></d><br>
                      <input type="number" name="quantity" class="form-control" placeholder="Enter Product Quantity" required>
               
                    <br><input type="submit" value="Register" class="btn btn-primary">
                </form>
                
            </div>
            <div class="col-sm-4"></div>
        </div>
            
        <% 
            request.removeAttribute("Product_Registration");
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
