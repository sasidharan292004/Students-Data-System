

import DB.JDBC;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class PDF extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      response.setContentType("application/pdf");  
  
response.setHeader("Content-Disposition","attachment; filename='javatpoint.pdf'");
Document doc = new Document();
try{
    PdfWriter.getInstance(doc,response.getOutputStream());
    doc.open();
    doc.add(new Paragraph("                                                            STUDENT DETAILS"));
    doc.add(Chunk.NEWLINE);
    
    PdfPTable tbl = new PdfPTable(7); {
        tbl.addCell("Id");
         tbl.addCell("Name");
          tbl.addCell("Gender");
           tbl.addCell("Course");
            tbl.addCell("DOB");
             tbl.addCell("Image");
              tbl.addCell("Time");
              
              try(Connection conn = JDBC.con();
                      PreparedStatement pst = conn.prepareStatement("sms_web_student_getall"))
              {
                  ResultSet rs = pst.executeQuery();
               while(rs.next())
               {
                   tbl.addCell(rs.getString("id"));
                    tbl.addCell(rs.getString("name"));
                     tbl.addCell(rs.getString("gender"));
                      tbl.addCell(rs.getString("course"));
                       tbl.addCell(rs.getDate("dob").toString());
                       byte[] imagebytes = rs.getBytes("image");
                       Image image = Image.getInstance(imagebytes);
                       tbl.addCell(image);
                         tbl.addCell(rs.getTime("time").toString());
                        
               }
              }
              catch(Exception e)
              {
                  e.printStackTrace();
    
              }
             
    }
     doc.add(tbl);
}
catch(Exception e)
{
    e.printStackTrace();
}
doc.close();
response.sendRedirect("Student_page.jsp");

  
}
}
