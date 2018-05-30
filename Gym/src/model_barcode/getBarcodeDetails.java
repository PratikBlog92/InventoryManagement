package model_barcode;

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

/**
 * Servlet implementation class getBarcodeDetails
 */
@WebServlet("/getBarcodeDetails")
public class getBarcodeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getBarcodeDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
				HttpSession session1 = request.getSession();
			/*Take data from database */

			String DbBarcode = null, Dbproduct_name=null,Dbbrand=null;
			int Dbid=0,Dbquantity=0;
			float Dbgst=0,Dbcost=0;
			
			String name = request.getParameter("name");
			if(name != null)
			{
				session1.setAttribute("name_by_barcode",name);
			}
			
			
			String barcode = request.getParameter("barcode");
			Connection conn = DBconnection.getDBConnection();
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM `product_registration` WHERE `barcode`=?");
			pst.setString(1, barcode);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				DbBarcode = rs.getString("barcode");
				Dbid = rs.getInt("id");
				Dbproduct_name = rs.getString("product_name");
				Dbgst = rs.getFloat("gst");
				Dbcost = rs.getFloat("cost");
				Dbquantity = 1;/*rs.getInt("quantity")*/
				Dbbrand = rs.getString("Brand");
			}

			/*Check Where data present inside db or not*/
			if(DbBarcode != null)
			{
				HttpSession session = request.getSession(true);
				ArrayList al = new ArrayList();

				if(session.getAttribute("al") == null)
				{
					/* Check weather arraylist  size is zero or not  */

					BarcodeModel bm = new BarcodeModel(Dbid,Dbquantity,Dbproduct_name,Dbgst,Dbcost,Dbbrand,DbBarcode);
					al.add(bm);

					session.setAttribute("al", al);

					//	response.sendRedirect("/Gym/sellByBarCode.jsp");

					RequestDispatcher rd = request.getRequestDispatcher("/sellByBarCode.jsp");
					rd.forward(request,response);

				}else if(session.getAttribute("al") != null)
				{
					// take arraylist from session
					// convert session arraylist into actual arraylist
					al = (ArrayList)session.getAttribute("al");

					// take data of related barcode
					//add it in BarcodeModel object
					//add it in arraylist
					BarcodeModel bm = new BarcodeModel(Dbid,Dbquantity,Dbproduct_name,Dbgst,Dbcost,Dbbrand,DbBarcode);
					al.add(bm);

					// send arraylist inside session in (al) parameter
					session.setAttribute("al", al);

					//response.sendRedirect("/Gym/sellByBarCode.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("/sellByBarCode.jsp");
					rd.forward(request,response);
				}
			}
			else 
			{
				out.println("BarCode not match to products");
			}
} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
