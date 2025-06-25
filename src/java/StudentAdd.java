/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DB.JDBC;
import java.sql.*;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static java.lang.System.out;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class StudentAdd extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String course = request.getParameter("course");
        String dob = request.getParameter("dob");
        Part filepart = request.getPart("image");
        InputStream inputstream = filepart.getInputStream();
        String time = request.getParameter("time");
        java.sql.Time time1 = java.sql.Time.valueOf(time);
        
        try(Connection conn = JDBC.con();
                PreparedStatement pst = conn.prepareStatement("sms_web_student_insert ?,?,?,?,?,?,?"))
        {
            pst.setString(1, id);
             pst.setString(2, name);
              pst.setString(3, gender);
               pst.setString(4, course);
                pst.setDate(5,java.sql.Date.valueOf(dob));
                 pst.setBlob(6, inputstream);
                  pst.setTime(7, time1);
                  
                  int result = pst.executeUpdate();
                  if(result>0)
                  {
                      response.getWriter().println("Student Information Saved Successfully");
                      response.sendRedirect("Student_page.jsp");
                  }
        }
        catch(Exception e)
        {
         out.println(e);
         response.getWriter().println("Error :"+e.getMessage());
        }
      }
}

