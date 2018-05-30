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

         <!-- JsPdf link -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
        
        
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
                                <h1 class="page-header">Buying Bill</h1>
                            </div>
                        </div>

                        <!-- ... Your content goes here ... -->

                    <%
                        HttpSession session1 = request.getSession(true);
                        String SessionName = (String) session1.getAttribute("username");

                        if (SessionName != null) {
                            /* Get and display values */
                            
                                    String name = request.getParameter("name");
                                    String pname = request.getParameter("pname");
                                    
                                    //Null Pointer
                                    String Sprice =request.getParameter("price");
                                    float price;
                                        if(Sprice != null)
                                        {
                                            price =Float.parseFloat(Sprice);
                                        }else{ price = 0F;}

                                    //null pointer
                                    String Squantity = request.getParameter("quantity");
                                    int quantity;
                                        if(Squantity != null)
                                        {
                                            quantity = Integer.parseInt(Squantity);
                                        }else{ quantity = 0; }
                                    
                                    // null pointer    
                                    String Sgst =request.getParameter("gst");
                                    float gst;
                                   
                                        if(Sgst != null)
                                        {
                                            gst = Float.parseFloat(Sgst);
                                        }else{ gst = 0.0F; }
                                    
                                    //null pointer
                                    String Srecived_amount =request.getParameter("PaidAmount");
                                    float recived_amount;
                                        if(Srecived_amount != null)
                                        {
                                            recived_amount = Float.parseFloat(Srecived_amount);
                                        }else{ recived_amount=0.0F;}

                                    //Calculation    
                                    float not_total_amount = (price * quantity)*(gst/100);
                                    float total_amount = (price * quantity) + not_total_amount;
                                     String note = request.getParameter("note");


                                     // null pointer
                                    //  Discount
                                        String Sdiscount = request.getParameter("discount");
                                        int discount =0;
                                        if(Sdiscount != null)
                                           {
                                                   discount = Integer.parseInt(Sdiscount);
                                           }
                                        else{
                                            discount=0;
                                        }
                                    total_amount = total_amount-discount;
                                    // Discount End                        


                                    float balence = total_amount-recived_amount;
                                    
                            /* Get and display values END*/
                            
                            /* Add value to session */
                                session1.setAttribute("BuyerName", name);
                                 session1.setAttribute("BuyerPname", pname);
                                   session1.setAttribute("BuyerPrice", price);
                                    session1.setAttribute("BuyerQuantity", quantity);
                                     session1.setAttribute("BuyerGst", gst);
                                      session1.setAttribute("BuyerDiscount", discount);
                                       session1.setAttribute("BuyerRecived_amount", recived_amount);
                                        session1.setAttribute("BuyerTotal_amount", total_amount);
                                         session1.setAttribute("BuyerBalence", balence);
                                          session1.setAttribute("BuyerNote", note);
                                      
                            /* Add value to session END*/
                            
                    %>
                <form action="/Gym/buy" method="post">
                    <div class="row">
                        
                            <div class="col-sm-2">

                                    <div>
                                        <label>Name :</label>
                                        <input type="text" name="name" class="form-control" value="<%= name%>" disabled id="name">
                                    </div>

                            </div>

                            <div class="col-sm-2">

                                    <div>
                                        <label>Product Name :</label>
                                        <input type="text" name="pname" class="form-control" value="<%= pname%>" disabled id="pname">
                                    </div>

                            </div>

                            <div class="col-sm-2">
                                <div>
                                    <label>Price :</label>
                                    <input type="text" name="price" class="form-control" value="<%= price%>" disabled id="price">
                                </div>
                            </div>
                            
                            <div class="col-sm-2">
                                <div>
                                    <label>Quantity:</label>
                                    <input type="text" name="quantity" class="form-control" value="<%= quantity%>" disabled id="quantity">
                                </div>
                            </div>
                            
                            <div class="col-sm-2">
                                <div>
                                    <label>GST :</label>
                                    <input type="text" name="gst" class="form-control" value="<%= gst%>" disabled id="gst">
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div>
                                    <label>Total Amount :</label>
                                    <input type="text" name="amount" class="form-control" value="<%= total_amount%>" disabled id="amount">
                                </div>                                
                            </div>
                                           
                    </div>
                    
                    <hr>
                    
                    <div class="row">
                        <div class="col-sm-2">
                            <div>
                               <label>Discount Amount :</label>
                               <input type="text" name="discount" class="form-control" value="<%= discount%>" disabled id="discount">
                            </div> 
                        </div>
                        <div class="col-sm-2">
                            <div>
                               <label>Recived Amount :</label>
                               <input type="text" name="PaidAmount" class="form-control" value="<%= recived_amount%>" disabled id="PaidAmount">
                            </div>  
                        </div>
                        <div class="col-sm-2">
                            <div>
                               <label>Balence Amount :</label>
                               <input type="text" name="BalenceAmount" class="form-control" value="<%=  balence%>" disabled id="BalenceAmount">
                            </div> 
                        </div>
                        <div class="col-sm-2">
                             <div>
                                 <input type="hidden" name="note" class="form-control" value="<%= note%>" disabled>
                            </div> 
                        </div>
                        <div class="col-sm-2"><%-- Blank Space --%></div>
                        <div class="col-sm-2"><%-- Blank Space --%></div>
                    </div>
                    
                    <hr><hr>
                    
                    <div class="row">
                        <div class="col-sm-5"></div>
                        <div class="col-sm-1">
                            <%--  <input type="submit" value="Submit" class="btn btn-primary"> --%>
                        </div>
                        <div class="col-sm-1">
                            <input type="submit" value="Register" class="btn btn-primary">
                        </div>
                        <div class="col-sm-5"></div>
                    </div>
                </form> 
                      <button class="btn btn-primary">Back</button>
                      <button class="btn btn-primary" onclick="genPDF();">Print</button>
                    <!-- ... Your content goes here ... -->
                </div>
            </div>

        </div>

                    
        <script>
            
            function genPDF(){
                
                 var doc = new jsPDF()
                 var name= document.getElementById("name").value;
                 var pname= document.getElementById("pname").value;
                 var price= document.getElementById("price").value;
                 var quantity= document.getElementById("quantity").value;
                 var gst= document.getElementById("gst").value;
                 var amount= document.getElementById("amount").value;
                 var discount= document.getElementById("discount").value;
                 var PaidAmount= document.getElementById("PaidAmount").value;
                 var BalenceAmount= document.getElementById("BalenceAmount").value;
                 

                    doc.text('Name : '+name+'\n', 10, 10);
                    doc.text('Product Name : '+pname+'\n', 10, 20);
                    doc.text('Price : '+price+'\n', 10, 30);
                    doc.text('Quantity : '+quantity+'\n', 10, 40);
                    doc.text('GST : '+gst+'\n', 10, 50);
                    doc.text('Total Amount : '+amount+'\n', 10, 60);
                    doc.text('Discount(RS.) : '+discount+'\n', 10, 70);
                    doc.text('Recived Amount : '+PaidAmount+'\n', 10, 80);
                    doc.text('Balence Amount : '+BalenceAmount+'\n', 10, 90);
            
            doc.save('Bill.pdf');
            }
           
         </script>
         
          <%
             } else {
                   response.sendRedirect("/Gym/login.jsp");
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
