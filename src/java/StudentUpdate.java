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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static java.lang.System.out;

@MultipartConfig
public class StudentUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
         String name = request.getParameter("name");
          String gender = request.getParameter("gender");
           String course = request.getParameter("course");
            String dob = request.getParameter("dob");
             Part imagepart = request.getPart("image");
              String time = request.getParameter("time");
              
              try(Connection conn = JDBC.con();
                      PreparedStatement pst = conn.prepareStatement("sms_web_student_update ?,?,?,?,?,?,?"))
              {
               pst.setString(1,id);
               pst.setString(2,name);
               pst.setString(3,gender);
               pst.setString(4,course);
               pst.setDate(5,Date.valueOf(dob));
                InputStream imageStream = null;
               if(imagepart != null && imagepart.getSize() > 0)
               {
                   imageStream = imagepart.getInputStream();
               }
               pst.setBinaryStream(6, imageStream,(int) imagepart.getSize());
               pst.setTime(7,Time.valueOf(time));
              
               int result = pst.executeUpdate();
               if(result == 1)
               {
                   response.sendRedirect("Student_page.jsp");
               }
              }
              catch(Exception e)
              {
                e.printStackTrace();
              }
     
    }
}
