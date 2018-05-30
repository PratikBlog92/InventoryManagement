/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import conect.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Genius
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       PrintWriter out = response.getWriter();
       String  username  = request.getParameter("username");
       String  password  = request.getParameter("password"); 
       
       //out.print(username+"   "+password);
        try {
            
             Connection con =  DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM `admin` WHERE `userName`=? AND password=?");
             ps.setString(1, username);
             ps.setString(2, password);
             ResultSet rs = ps.executeQuery();
             
             String DbUsername="",DbPassword="";
             while (rs.next()) {
                 DbUsername = rs.getString(1);
                 DbPassword  =  rs.getString(2);
             }
             
             if(username.equals(DbUsername) && password.equals(DbPassword))
                 {
                     HttpSession session = request.getSession(true);
                     session.setAttribute("username", DbUsername);
                     response.sendRedirect("/Gym/sell.jsp");
                 }else{
                  out.print("UN - Authenticate User");
             }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
}
