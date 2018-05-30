package inventary.sell;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conect.DBconnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class sell
 */
@WebServlet("/sell")
public class sell extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");


	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		HttpSession session = req.getSession();
		
		try {
			
			/* Getting valu from session */
			String Uname[] = (String[])session.getAttribute("Uname");
			String pname[] = (String[])session.getAttribute("pname");
			String price[] = (String[])session.getAttribute("price");
			String quantity[] = (String[])session.getAttribute("quantity");
			String AvalableQty[] = (String[])session.getAttribute("AvalableQty");
			String amount[] = (String[])session.getAttribute("amount");//AvalableQty
						
			String totalAmount = req.getParameter("totalAmount");
			String discountAmount = req.getParameter("discountAmount");
			String recivedAmount = req.getParameter("recivedAmount");
			String balenceAmount = req.getParameter("balenceAmount");
			
			/* Getting value from session END*/
			/*SETTING VALUE INSIDE SESSION*/	
			session.setAttribute("totalAmount", totalAmount);
			session.setAttribute("discountAmount", discountAmount);
			session.setAttribute("recivedAmount", recivedAmount);
			session.setAttribute("balenceAmount", balenceAmount);
			
			/*SETTING VALUE INSIDE SESSION end*/		
			Connection conn = DBconnection.getDBConnection();

			/*Getting user id*/
			PreparedStatement pstm = conn.prepareStatement("SELECT `id` FROM `custmer_registration` WHERE `name`=?");
			pstm.setString(1, Uname[0]);
			ResultSet rst = pstm.executeQuery();
			int id=0;
			while (rst.next()) {
				id=rst.getInt("id");
			}
			//System.out.println("ID - "+id);
		/* Getting user id END */
		/* Getting id of product */
			
			StringBuilder sql = new StringBuilder("SELECT id FROM `product_registration` WHERE ");
			StringBuilder sbr = new StringBuilder();
			
			
			
			for(String s : pname) {
				sbr.append("`product_name`='"+s+"' OR ");
			}
			sql.append(sbr);
			
			int lenget = sql.length();
			
			sql.delete((lenget-4), lenget);
			
			PreparedStatement pstm1 = conn.prepareStatement(sql.toString());
			ResultSet rst1 = pstm1.executeQuery();
			
			// add data to arraylist
			
			List al = new ArrayList();
			
			while (rst1.next()) {
				al.add(rst1.getString("id"));
			}
			
			String array[] = new String[al.size()];
			
			for(int j =0;j<al.size();j++){
				  array[j] = al.get(j).toString();
				}
			
			/* Getting id of product END */		
			
			/* Substracting Enterd quantity from, quantity present inside database */
				
				// Convert String Quantity to Integer Quantity
					int[] intQuantity = new int[quantity.length];
					for (int i = 0; i < quantity.length; i++) {
				         String numberAsString = quantity[i];
				         intQuantity[i] = Integer.parseInt(numberAsString);
				      }
					
				// Convert String AvailableQuantity to Integer AvailableQuantity
					int[] intAvalableQty = new int[AvalableQty.length];
					for (int i = 0; i < AvalableQty.length; i++) {
				         String numberAsString = AvalableQty[i];
				         intAvalableQty[i] = Integer.parseInt(numberAsString);
				      }
				// getting remainning quantity
					int[] remainQuantity = new int[intQuantity.length];
					int a=0,b=0;
					for(int i=0;i < intQuantity.length;i++)
					{
						
						a=intAvalableQty[i];
						b=intQuantity[i];
						remainQuantity[i] = a-b;
						//System.out.println(intQuantity[i]+"  -----**********-----"+intAvalableQty[i]+"  remainQuantity"+remainQuantity[i]);
						
					}
					
					Statement statement = conn.createStatement();
					for(int i=0;i<remainQuantity.length;i++)
					{
						//INSERT INTO `product_registration`(`quantity`) VALUES ("+remainQuantity[i]+")  WHERE `id`="+array[i]+"
						//UPDATE `product_registration` SET `quantity`=10 WHERE `id`=
						statement.addBatch("UPDATE `product_registration` SET `quantity`="+remainQuantity[i]+" WHERE `id`="+array[i]+"");
					}
					statement.executeBatch();
					
			/* Substracting Enterd quantity from, quantity present inside database */
			
			/* Store data into database */
			
			Statement  st = conn.createStatement();
			
			for(int i = 0; i<pname.length; i++)
			{
				st.addBatch("INSERT INTO `bill`(`productName`, `productQuantity`, `productPrice`, `quantityINTOprice`, `total_amount`, `discount_amount`, `recived_amount`, `balenc_amount`, `product_id`, `custmer_id`) VALUES ('"+pname[i]+"',"+quantity[i]+","+price[i]+","+amount[i]+","+totalAmount+","+discountAmount+","+recivedAmount+","+balenceAmount+","+array[i]+","+id+")");
				System.out.println(st+" \n qwery1");
			}
			System.out.println(st+" \n qwery2");
			st.executeBatch();
			System.out.println(st+" \n qwery3");
			
			
			/* Store data into database END */
			
			out.print("Record store successfully");
			response.sendRedirect("/Gym/print_bill_update.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
