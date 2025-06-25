
import DB.JDBC;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.tools.ws.wsdl.document.Output;


public class CSV extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/csv");
    response.setHeader("Content-Disposition", "attachment; filename=\"userDirectory.csv\"");
 try(OutputStream outputsteam = response.getOutputStream()){
     StringBuilder csv = new StringBuilder();
     csv.append("Id,Name,Gender,Course,DOB,Image,Time\n");
     try(Connection conn = JDBC.con();
          PreparedStatement pst = conn.prepareStatement("sms_web_student_getall"))
     {
         ResultSet rs = pst.executeQuery();
         while(rs.next())
         {
          csv.append(rs.getString("id")).append(",")
                  .append(rs.getString("name")).append(",")
                  .append(rs.getString("gender")).append(",")
                  .append(rs.getString("course")).append(",")
                  .append(rs.getString("dob")).append(",")
                  .append(rs.getString("time")).append("\n");
         }
     
 }
 catch(Exception e)
 {
   e.printStackTrace();
 }
outputsteam.write(csv.toString().getBytes());
 outputsteam.flush();
outputsteam.close();
 }

    }
}
