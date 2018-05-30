/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inventary.report;

import conect.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author Genius
 */
@WebServlet(name = "SellProductReport", urlPatterns = {"/SellProductReport"})
public class SellProductReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session1 = request.getSession(true);
        String name = (String)session1.getAttribute("username");

        if(name != null)
        {
                PrintWriter out = response.getWriter();
               try {
                  Connection connection = DBconnection.getDBConnection();
                  String report = "D:\\Neatbeans\\Gym\\src\\java\\inventary\\report\\XMLfiles\\sellProductReport.jrxml";
                   JasperReport jasp_rep = JasperCompileManager.compileReport(report);
                   JasperPrint jsap_print = JasperFillManager.fillReport(jasp_rep, null,connection);
                   JasperViewer.viewReport(jsap_print);
                   out.print("Report Generated");


             } catch (Exception e) {
                 e.printStackTrace();
             }
       }else{
            response.sendRedirect("/Gym/login.jsp");
        }
        
       
    }

    
}
