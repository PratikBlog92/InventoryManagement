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
                    <h1 class="page-header">Customer Registration</h1>
                </div>
            </div>

            <!-- ... Your content goes here ... -->
            
        <%
            HttpSession session1 = request.getSession(true);
            String name = (String)session1.getAttribute("username");

            if(name != null)
            {
                String Custmer_Registration = (String)request.getAttribute("Custmer_Registration");
                if(Custmer_Registration  != null)
                {
                    %>
                   
                    <%-- <%=Custmer_Registration%> --%>
                    <script type="text/javascript">
                        alert("Customer Registration Done..!\n SUCCESSFULLY ");                        
                    </script>
                     
                     <%
                }
        %>
            
                    <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                
                <form method="post" action="/Gym/custmer_registration">
                    <label>Name : </label> <d><b>*</b></d><br>
                    <input type="text" name="name" class="form-control" placeholder="Enter Custmer Name" required pattern="[A-Za-z]+" title="letters and numbers only, no punctuation or special characters"><br>
                    
                      <label>Phone : </label> <d><b>*</b></d><br>
                      <input type="text" name="phone" class="form-control" placeholder="Enter Contact details" required pattern="(7|8|9)\d{9}$" title="Phone number is not valid"><br>
                    
                      <label>Email : </label> <d><b>*</b></d><br>
                      <input type="email" name="email" class="form-control" placeholder="Enter Email" required><br>
                    
                      <label>Address : </label> <d><b>*</b></d><br>
                    <textarea style="height: 50px" class="form-control" name="address"required></textarea><br>
                    
                    <input type="submit" value="Register" class="btn btn-primary">                   
                    
                </form>
                
            </div>
            <div class="col-sm-4"></div>
        </div>
            
        <% 
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
