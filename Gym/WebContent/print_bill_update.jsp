<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <style>
        .clearfix:after {
  content: "";
  display: table;
  clear: both;
}

a {
  color: #5D6975;
  text-decoration: underline;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #001028;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 12px; 
  font-family: Arial;
}

header {
  padding: 10px 0;
  margin-bottom: 30px;
}

#logo {
  text-align: center;
  margin-bottom: 10px;
}

#logo img {
  width: 90px;
}

h1 {
  border-top: 1px solid  #5D6975;
  border-bottom: 1px solid  #5D6975;
  color: #5D6975;
  font-size: 2.4em;
  line-height: 1.4em;
  font-weight: normal;
  text-align: center;
  margin: 0 0 20px 0;
  background: url(dimension.png);
}

#project {
  float: left;
}

#project span {
  color: #5D6975;
  text-align: right;
  width: 52px;
  margin-right: 10px;
  display: inline-block;
  font-size: 0.8em;
}

#company {
  float: right;
  text-align: right;
}

#project div,
#company div {
  white-space: nowrap;        
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table tr:nth-child(2n-1) td {
  background: #F5F5F5;
}

table th,
table td {
  text-align: center;
}

table th {
  padding: 5px 20px;
  color: #5D6975;
  border-bottom: 1px solid #C1CED9;
  white-space: nowrap;        
  font-weight: normal;
}

table .service,
table .desc {
  text-align: left;
}

table td {
  padding: 20px;
  text-align: right;
}

table td.service,
table td.desc {
  vertical-align: top;
}

table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

table td.grand {
  border-top: 1px solid #5D6975;;
}

#notices .notice {
  color: #5D6975;
  font-size: 1.2em;
}

footer {
  color: #5D6975;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #C1CED9;
  padding: 8px 0;
  text-align: center;
}
    </style>
  </head>
  <body>
   
    <header class="clearfix">
      <div id="logo">
        <img src="logo.png">
      </div>
     
      <h1>INVOICE 3-2-1</h1>
      <div id="company" class="clearfix">
        <div>Company Name</div>
        <div>455 Foggy Heights,<br /> AZ 85004, US</div>
        <div>(602) 519-0450</div>
        <div><a href="mailto:company@example.com">company@example.com</a></div>
      </div>
      <div id="project">
        <div><span>PROJECT</span> Website development</div>
        <div><span>CLIENT</span> John Doe</div>
        <div><span>ADDRESS</span> 796 Silver Harbour, TX 79273, US</div>
        <div><span>EMAIL</span> <a href="mailto:john@example.com">john@example.com</a></div>
        <div><span>DATE</span> August 17, 2015</div>
        <div><span>DUE DATE</span> September 17, 2015</div>
      </div>
    </header>
    <main>
       <%
		        String Uname[] = (String[])session.getAttribute("Uname");
				String pname[] = (String[])session.getAttribute("pname");
				String price[] = (String[])session.getAttribute("price");
				String quantity[] = (String[])session.getAttribute("quantity");
				String amount[] = (String[])session.getAttribute("amount");
				String gst[] = (String[])session.getAttribute("gst");
				String totalAmount = (String)session.getAttribute("totalAmount");
				String discountAmount = (String)session.getAttribute("discountAmount");
				String recivedAmount = (String)session.getAttribute("recivedAmount");
				String balenceAmount = (String)session.getAttribute("balenceAmount");
	    %>
      <table style="text-align: center;">
	        <thead>
	          <tr>
	            <th class="service">PRODUCT NAME</th><!-- class="service" -->
	            <th class="desc">PRICE</th><!-- class="desc" -->
	            <th>QUANTITY</th>
	            <th>GST</th>
	            <th>TOTAL</th>
	          </tr>
	        </thead>
	        
	        <tbody>
	        <%
	        	for(int i=0;i<pname.length;i++)
	        	{
	        %>
	         <tr>
	            <td class="service"><%=pname[i]%></td>
	            <td class="desc"><%=price[i]%></td>
	            <td class="unit"><%=quantity[i]%></td>
	            <td class="qty"><%=gst[i]%></td>
	            <td class="total"><%=amount[i] %></td>
	          </tr>
	          <%
	        	}
	          %>
	          <tr>
		          	<td><b><i>Total Amount</i></b></td>
		          	<td><%=totalAmount%></td>
		          	<td></td>
		          	<td><b><i>Discount Amount</i></b></td>
		          	<td><%=discountAmount%></td>
	          </tr>
	          <tr>
		          	<td><b><i>Recived Amount</i></b></td>
		          	<td><%=recivedAmount%></td>
		          	<td></td>
		          	<td><b><i>Balence Amount</i></b></td>
		          	<td><%=balenceAmount%></td>
	          </tr>
	          <%--
	          
	           <tr>
		          	<td></td>
		          	<td></td>
		          	<td></td>
		          	<td><b><i>Total Amount</i></b></td>
		          	<td><%=totalAmount%></td>
	          </tr>
	          <tr>
	          		<td></td>
		          	<td></td>
		          	<td></td>
		          	<td><b><i>Total Amount</i></b></td>
		          	<td><%=totalAmount%></td>
	          </tr>
	          
	          --%>
	       </tbody>
      </table>
      <button onclick="myFunction()">Print</button>
     <!--  <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
    </main>
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer> -->
    <script>
function myFunction() {
    window.print();
}
</script>
 
  </body>
  </html>