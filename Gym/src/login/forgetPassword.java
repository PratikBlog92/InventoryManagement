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
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author Genius
 */
@WebServlet(name = "forgetPassword", urlPatterns = {"/forgetPassword"})
public class forgetPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        // out.print("Forget password");

        String email = request.getParameter("email");
        //out.print(email);
        try {
            Connection conn = DBconnection.getDBConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM `admin` WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            String Dbemail = "",DBusername = "", DBpassword="";
            
            while (rs.next()) {
                Dbemail = rs.getString("email");
                DBusername = rs.getString("userName");
                DBpassword = rs.getString("password");
            }

            if (Dbemail.equals(email)) {
                // Email Sending Code // 

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");

                Session s = Session.getDefaultInstance(props,
                        new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("chaiwala.mestro@gmail.com", "12345asd");
                    }
                });

                try {
                    String mailMessage = "Username :"+DBusername+"\n Password : "+DBpassword;
                    Message message = new MimeMessage(s);
                    message.setFrom(new InternetAddress(email));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(Dbemail));
                    message.setSubject("Gym -> Forget Password ");
                    message.setText("Gym.com, \n\n" + mailMessage);

                    Transport.send(message);

                } catch (MessagingException e) {
                    throw new RuntimeException(e);

                } 
                request.setAttribute("email", "FindEmail");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("email", "ForgetEmail");
                RequestDispatcher rd = request.getRequestDispatcher("/ForgetPassword.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
