package invetary.buy;

import conect.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Genius
 */
@WebServlet(name = "buy", urlPatterns = {"/buy"})
public class buy extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        
        	
                HttpSession session = request.getSession();
                String name = (String)session.getAttribute("BuyerName");
                String pname = (String)session.getAttribute("BuyerPname");
                float price = (float)session.getAttribute("BuyerPrice");
                int quantity = (int)session.getAttribute("BuyerQuantity");
                float gst = (float)session.getAttribute("BuyerGst");
                float recived_amount =(float)session.getAttribute("BuyerRecived_amount");
                float total_amount = (float)session.getAttribute("BuyerTotal_amount");
                int discoutnt =(int)session.getAttribute("BuyerDiscount");
                float balence= (float)session.getAttribute("BuyerBalence");
                String note = (String)session.getAttribute("BuyerNote");
                       
        
//        response.setContentType("text/html");
//        String name = request.getParameter("name");
//        String pname = request.getParameter("pname");
//        float price = Float.parseFloat(request.getParameter("price"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        float gst = Float.parseFloat(request.getParameter("gst"));
//        float recived_amount = Float.parseFloat(request.getParameter("PaidAmount"));
//
//        float not_total_amount = (price * quantity) * (gst / 100);
//        float total_amount = (price * quantity) + not_total_amount;
//
//        //  Discount
//        int discount = 0;
//        if (request.getParameter("discount").equals(null)) {
//            discount = 0;
//        } else {
//            discount = Integer.parseInt(request.getParameter("discount"));
//        }
//        total_amount = total_amount - discount;
//        // Discount End                        
//
//        float balence = total_amount - recived_amount;
//
//        String note = request.getParameter("note");
//
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DBconnection.getDBConnection();
            //System.out.println("Connection Eastablished\n");
            //INSERT INTO `seller`(`seller_name`, `product_name`, `price`, `quantity`, `gst`, `total_amount`, `recived_amount`, `balence`) VALUES (?,?,?,?,?,?,?,?)
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO `byers`(`buyer_name`, `product_name`, `price`, `quantity`, `gst`, `total_amount`, `paid`, `balence`, `discount`, `note`, `date`) VALUES (?,?,?,?,?,?,?,?,?,?,now() )");
            System.out.println(pstmt + "\n");
            pstmt.setString(1, name);
            pstmt.setString(2, pname);
            pstmt.setFloat(3, price);
            pstmt.setInt(4, quantity);
            pstmt.setFloat(5, gst);
            pstmt.setFloat(6, total_amount);
            pstmt.setFloat(7, recived_amount);
            pstmt.setFloat(8, balence);
            pstmt.setInt(9, discoutnt);
            pstmt.setString(10, note);
            //pstmt.setDate(10, now());
            pstmt.executeUpdate();

            //changing quantity from product table
            Connection conn = DBconnection.getDBConnection();

            //GEtting Existing quantity
            PreparedStatement ps2 = conn.prepareStatement("SELECT `quantity` FROM `product_registration` WHERE `product_name`=?");
            ps2.setString(1, pname);
            ResultSet rs = ps2.executeQuery();
            int existingQuantity = 0;
            while (rs.next()) {
                existingQuantity = rs.getInt("quantity");
            }

            PreparedStatement ps = conn.prepareStatement("UPDATE `product_registration` SET `quantity`=? WHERE `product_name`=?");
            ps.setInt(1, (quantity + existingQuantity));
            ps.setString(2, pname);
            ps.executeUpdate();

            response.sendRedirect("/Gym/buy.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
