/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DB.JDBC;
import java.sql.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;

@WebServlet("/Delete")
public class Delete extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String delete = request.getParameter("id");
        try(Connection conn = JDBC.con();
                PreparedStatement pst = conn.prepareStatement("sms_web_student_delete ?"))
        {
           pst.setString(1, delete);
           int result = pst.executeUpdate();
           if(result == 1)
           {
               response.sendRedirect("Student_page.jsp");
           }
           
        }
        catch(Exception e)

        {
           out.println(e);
        }
    }

   

}
