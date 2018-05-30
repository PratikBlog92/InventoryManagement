/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration;

import conect.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Genius
 */
@WebServlet(name = "product_registration", urlPatterns = {"/product_registration"})
public class product_registration extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        String pname = request.getParameter("pname");
        String Description = request.getParameter("Description");
       
        String weight = request.getParameter("Weight");
        Float Weight  = Float.valueOf(weight);
        
        String gst = request.getParameter("gst");
        Float GST  = Float.valueOf(gst);
        
        String Cost = request.getParameter("Cost");
        Float cost  = Float.valueOf(Cost);
        
        String Quantity = request.getParameter("quantity");
        int quantity = Integer.parseInt(Quantity);
        
        String Brand = request.getParameter("Brand");
        
        String Bcode = request.getParameter("bCode");
          try {
            Connection con =  DBconnection.getDBConnection();
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO `product_registration`(`product_name`, `description`, `weight`, `gst`, `cost`,  `quantity`, `Brand`, `barcode`) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, pname);
            ps.setString(2, Description);
            ps.setFloat(3, Weight);
            ps.setFloat(4, GST);
            ps.setFloat(5, cost);
            ps.setInt(6, quantity);
            ps.setString(7, Brand);
            ps.setString(8, Bcode);
            ps.executeUpdate();
            System.out.println(ps);
            //response.sendRedirect("/Gym/product_registration.jsp");
            
            request.setAttribute("Product_Registration", "Custmer Registration Done");
            RequestDispatcher rd = request.getRequestDispatcher("/product_registration.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    
}
