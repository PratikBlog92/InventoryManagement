package inventary.sell;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conect.DBconnection;
import model_barcode.BarcodeModel;

/**
 * Servlet implementation class sellByBarcodeDataStore
 */
@WebServlet("/sellByBarcodeDataStore")
public class sellByBarcodeDataStore extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
		
		/* 	*/
		
		/* Get value from session */
		HttpSession session = request.getSession();
		float finalTotalCst = (float)session.getAttribute("finalTotalCst");
		float BarcodeDiscountCost =(float) session.getAttribute("BarcodeDiscountCost");
		float BarcodeRecivedCost =(float) session.getAttribute("BarcodeRecivedCost");
		float BarcodeBaleneCost = (float) session.getAttribute("BarcodeBaleneCost");
		String name_by_barcode =  (String) session.getAttribute("name_by_barcode");
		
		/* Getting id from  name_by_barcode */	
		Connection conn =DBconnection.getDBConnection();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM `custmer_registration` WHERE `name`=?");
		ps.setString(1, name_by_barcode);
		ResultSet rs = ps.executeQuery();
		int Db_id=0;
		while (rs.next()) {
			Db_id = rs.getInt("id");
		}
		
		System.out.println("Id of Custmer Registration ---> "+ps);
		System.out.println("Id of Custmer Registration ---> "+name_by_barcode);
		
		ArrayList alist = new ArrayList();
		
		/* Store value in arraylist */
		alist = (ArrayList) session.getAttribute("al");
		
		/* retrive all values from arraylist*/
		/* Store it in bill Database */
			//Connection conn = DBconnection.getDBConnection();
			Statement st = conn.createStatement();
			
			for(int i=0;i<alist.size();i++)
			{
				BarcodeModel bm = (BarcodeModel) alist.get(i);
				st.addBatch("INSERT INTO `bill`(`productName`, `productQuantity`, `productPrice`, `quantityINTOprice`, `total_amount`, `discount_amount`, `recived_amount`, `balenc_amount`, `product_id`, `custmer_id`) VALUES"
						+ " ('"+bm.getProduct_name()+"',"+bm.getQuantity()+","+bm.getCost()+","+bm.getCost()*bm.getQuantity()+","+finalTotalCst+","+BarcodeDiscountCost+","+BarcodeRecivedCost+","+BarcodeBaleneCost+","+bm.getId()+","+Db_id+")");
			}
			st.executeBatch();
			
		/* Removing attributes from session */
			
			session.removeAttribute("finalTotalCst");
			session.removeAttribute("al");
			session.removeAttribute("BarcodeDiscountCost");
			session.removeAttribute("BarcodeRecivedCost");
			session.removeAttribute("name_by_barcode");
			
		/* Transfer flow to sellByBarcode.jsp with transaction complit massage */
			request.setAttribute("TransationDone", "Done");
			RequestDispatcher rd = request.getRequestDispatcher("/sellByBarCode.jsp");
			rd.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		/* Store it in bill Database */
		
		/* Remove all values from session */
		
	}

	

}
