  

<%
    HttpSession session1 = request.getSession();
    String username  = (String)session1.getAttribute("username");
   /* if(username == null)
    {
        username = "Gym";
    } */
%>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Gym</a>
        </div>

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <!-- Top Navigation: Left Menu -->
        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
        </ul>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
            <li class="dropdown navbar-inverse">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                     <%  if(username == null) {%>
                         <i class="fa fa-user fa-fw"></i>Hello Gym <b class="caret"></b>
                     <% }else{ %>
                        <i class="fa fa-user fa-fw"></i>Hello <%= username%> <b class="caret"></b>
                     <% } %>
                 </a>
                <ul class="dropdown-menu dropdown-user">
                   <%  if(username == null) {%>
                         <li><a href="/Gym/login.jsp"><i class="fa fa-user fa-fw"></i> Login</a>
                         </li>
                    <% }%>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="/Gym/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <form action="SerchName.jsp" method="post">
                      <%--   <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search SELL by Name" name="name">
                                    <span class="input-group-btn">
                                       <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                            </div> --%>
                         </form>
                    </li>
                    <li>
                        <a href="/Gym/index.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    
                     <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Registration <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Gym/searchCustmers.jsp">Customer</a>
                            </li>
                            <li>
                                <a href="/Gym/searchProduct.jsp">Product<span class="fa arrow"></span></a>
                                
                            </li>
                        </ul>
                    </li>
                    
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Transaction <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Gym/buy.jsp">Buy</a>
                            </li>
                            <li>
                                <a href="/Gym/sell.jsp">Sell<span class="fa arrow"></span></a>
                                
                            </li>
                        </ul>
                    </li>
                    
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Data <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Gym/buyesList.jsp">Buyers</a>
                            </li>
                            <li>
                                <a href="/Gym/SellerList.jsp">Sellers<span class="fa arrow"></span></a>
                                
                            </li>
                        </ul>
                    </li>
                    
 
                    
                <!--      <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Report <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Gym/reportBuy" target="_blank">Buyers</a>
                            </li>
                            <li>
                                <a href="/Gym/reportSell" target="_blank">Sellers<span class="fa arrow"></span></a>
                                
                            </li>
                            
                            <li>
                                <a href="/Gym/SellProductReport" target="_blank">Selling Products<span class="fa arrow"></span></a>
                                
                            </li>
                            
                            <li>
                                <a href="/Gym/BuyingProductReport" target="_blank">Buying Products<span class="fa arrow"></span></a>
                                
                            </li>
                        </ul>
                    </li>
                 -->    
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Balance Amount <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/Gym/CheckBuyBalence.jsp">Buy Balance</a>
                            </li>
                            <li>
                                <a href="/Gym/checkSellBalence.jsp">Sell Balance<span class="fa arrow"></span></a>
                                
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    <%-- <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Balance Amount<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a>Buy Balance</a>
                            </li>
                            <li>
                                <a>Sell Balance</a>
                            </li>
                        </ul>
                    </li> --%>
                </ul>

            </div>
        </div>
    </nav>

   