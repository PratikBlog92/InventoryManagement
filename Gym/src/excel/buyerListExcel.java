package excel;


import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.*;

import conect.DBconnection;

/**
 * Servlet implementation class buyerListExcel
 */
@WebServlet("/buyerListExcel")
public class buyerListExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		 HttpSession session1 = request.getSession(true);
         String name = (String)session1.getAttribute("username");

         if(name != null)
         {
		
		try {

		Connection connect =	DBconnection.getDBConnection();

			Statement statement = connect.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM `byers`");
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet spreadsheet = workbook.createSheet("employe db");

			XSSFRow row = spreadsheet.createRow(1);
			XSSFCell cell;
			cell = row.createCell(1);
			cell.setCellValue("ID");
			
			cell = row.createCell(2);
			cell.setCellValue("BUYER NAME");
			
			cell = row.createCell(3);
			cell.setCellValue("PRODUCT NAME");
			
			cell = row.createCell(4);
			cell.setCellValue("PRICE");
			
			cell = row.createCell(5);
			cell.setCellValue("QUANTITY");
			
			cell = row.createCell(6);
			cell.setCellValue("TOTAL AMOUNT");
			
			cell = row.createCell(7);
			cell.setCellValue("PAID AMOUNT");
			
			cell = row.createCell(8);
			cell.setCellValue("BALENCE AMOUNT");

			int i = 2;

			while (resultSet.next()) {
				row = spreadsheet.createRow(i);
				
				cell = row.createCell(1);
				cell.setCellValue(resultSet.getInt("id"));
				
				cell = row.createCell(2);
				cell.setCellValue(resultSet.getString("buyer_name"));
				
				cell = row.createCell(3);
				cell.setCellValue(resultSet.getString("product_name"));
				
				cell = row.createCell(4);
				cell.setCellValue(resultSet.getString("price"));
				
				cell = row.createCell(5);
				cell.setCellValue(resultSet.getString("quantity"));
				
				cell = row.createCell(6);
				cell.setCellValue(resultSet.getString("total_amount"));
				
				cell = row.createCell(7);
				cell.setCellValue(resultSet.getString("paid"));
				
				cell = row.createCell(8);
				cell.setCellValue(resultSet.getString("balence"));
				i++;
			}
			//String filnam ="C:\\Users\\Genius\\Documents\\exceldatabase.xlsx";
			FileOutputStream out1 = new FileOutputStream(new File("C:\\Users\\Genius\\Documents\\BUYER_LIST_EXCEL.xlsx"));
			workbook.write(out1);

			out1.close();
			out.println("exceldatabase.xlsx written successfully");
			
			request.setAttribute("buyList", "seller_list");
			RequestDispatcher rd = request.getRequestDispatcher("/buyesList.jsp");
			rd.forward(request, response);
			/* response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename="+filnam);
			 */
			// response.sendRedirect("/apachePOItest/index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	 }else
     {
        response.sendRedirect("/Gym/login.jsp");
       }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
