/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DB.JDBC;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
/**
 *
 * @author ASUS
 */
@WebServlet("/StudentEdit")

public class StudentEdit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        try(Connection conn = JDBC.con();
                PreparedStatement pst = conn.prepareStatement("sms_web_student_getbyid ?"))
        {
           pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                
                request.setAttribute("id", rs.getString("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("dob", rs.getDate("dob"));
                request.setAttribute("gender", rs.getString("gender"));
                request.setAttribute("course", rs.getString("course"));
                request.setAttribute("image", rs.getBytes("image"));
                request.setAttribute("time", rs.getTime("time"));

        }
              RequestDispatcher dispatcher = request.getRequestDispatcher("Student_edit.jsp");
            dispatcher.forward(request, response);
 }
        
        catch(Exception e)
        {
              e.printStackTrace();
 
        }
        
        
 

}
}