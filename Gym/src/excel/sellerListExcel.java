package excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import conect.DBconnection;

/**
 * Servlet implementation class sellerListExcel
 */
@WebServlet("/sellerListExcel")
public class sellerListExcel extends HttpServlet {
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
			ResultSet resultSet = statement.executeQuery("SELECT * FROM `seller`");
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet spreadsheet = workbook.createSheet("employe db");

			XSSFRow row = spreadsheet.createRow(1);
			XSSFCell cell;
			cell = row.createCell(1);
			cell.setCellValue("ID");
			
			cell = row.createCell(2);
			cell.setCellValue("SELLER NAME");
			
			cell = row.createCell(3);
			cell.setCellValue("PRODUCT NAME");
			
			cell = row.createCell(4);
			cell.setCellValue("PRICE");
			
			cell = row.createCell(5);
			cell.setCellValue("QUANTITY");
			
			cell = row.createCell(6);
			cell.setCellValue("TOTAL AMOUNT");
			
			cell = row.createCell(7);
			cell.setCellValue("RECIVED AMOUNT");
			
			cell = row.createCell(8);
			cell.setCellValue("BALENCE AMOUNT");

			int i = 2;

			while (resultSet.next()) {
				row = spreadsheet.createRow(i);
				
				cell = row.createCell(1);
				cell.setCellValue(resultSet.getInt("id"));
				
				cell = row.createCell(2);
				cell.setCellValue(resultSet.getString("seller_name"));
				
				cell = row.createCell(3);
				cell.setCellValue(resultSet.getString("product_name"));
				
				cell = row.createCell(4);
				cell.setCellValue(resultSet.getString("price"));
				
				cell = row.createCell(5);
				cell.setCellValue(resultSet.getString("quantity"));
				
				cell = row.createCell(6);
				cell.setCellValue(resultSet.getString("total_amount"));
				
				cell = row.createCell(7);
				cell.setCellValue(resultSet.getString("recived_amount"));
				
				cell = row.createCell(8);
				cell.setCellValue(resultSet.getString("balence"));
				i++;
			}
			//String filnam ="C:\\Users\\Genius\\Documents\\exceldatabase.xlsx";
			FileOutputStream out1 = new FileOutputStream(new File("C:\\Users\\Genius\\Documents\\SELLER_LIST_EXCEL.xlsx"));
			workbook.write(out1);

			out1.close();
			out.println("exceldatabase.xlsx written successfully");
			
			request.setAttribute("sellList", "seller_list");
			RequestDispatcher rd = request.getRequestDispatcher("/SellerList.jsp");
			rd.forward(request, response);
			
			//response.sendRedirect("/Gym/SellerList.jsp");
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
