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
@WebServlet(name = "custmer_registration", urlPatterns = {"/custmer_registration"})
public class custmer_registration extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        
        try {
            Connection con = DBconnection.getDBConnection();
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO `custmer_registration`(`name`, `address`, `phone`, `email`) VALUES (?,?,?,?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, address);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, email);
            preparedStatement.executeUpdate();
            
            request.setAttribute("Custmer_Registration", "Custmer Registration Done");
            RequestDispatcher rd = request.getRequestDispatcher("/custmer_registration.jsp");
            rd.forward(request, response);
            //response.sendRedirect("/Gym/custmer_registration.jsp");
            
        } catch (Exception e) {
        }
        
    }

    

}
