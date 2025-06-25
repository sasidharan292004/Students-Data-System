<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>

<!doctype html>
<%

    HttpSession s = request.getSession();
    String i = (String) s.getAttribute("id");
    s.setMaxInactiveInterval(120);
    if (i == null) {
        response.sendRedirect("login.jsp");
    }

    if (request.getParameter("logout") != null) {
        s.removeAttribute("i");
        response.sendRedirect("login.jsp");
    }
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Details Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
          body{

                background-image:url('image/bg3.jpg');
                background-attachment:fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .ptn{
                padding: 5px;
            }
    </style>
  
  </head>
  <body>
      
     
          
           <div class="container">
          
           <h1 class="text-center">STUDENT DETAILS</h1>
                
               <table  id="print" class="table table-striped" style="border:2px solid black;text-align: center">
               <thead>
                   <tr>
                       <th>ID</th>
                        <th>NAME</th>
                        <th>GENDER</th>
                         <th>COURSE</th>
                          <th>DOB</th>
                           <th>IMAGE</th>
                           <th>TIME</th>
                           <th>MODIFY</th>
                        </tr>
               </thead>
               <tbody>
                   <%
                       try(Connection conn = JDBC.con();
                       PreparedStatement pst = conn.prepareStatement("sms_web_student_getall"))
                       {
                       ResultSet rs = pst.executeQuery();
                       while(rs.next())
                       {
                       String id = rs.getString("id");
                        String name = rs.getString("name");
                         String gender = rs.getString("gender");
                          String course = rs.getString("course");
                           String dob = rs.getDate("dob").toString();
                             String time = rs.getTime("time").toString();
                   %>
                   <tr>
                       <td><%=id%></td>
                       <td><%=name%></td>
                       <td><%=gender%></td>
                       <td><%=course%></td>
                       <td><%=dob%></td>
                       <td>
                           <img src="data:image/jpeg;base64,<%=java.util.Base64.getEncoder().encodeToString(rs.getBytes("image"))%>"
                                width="70" height="70">
                       </td>
                       <td><%=time%></td>
                       <td>
<!--                           <form style="display: inline-block" action="StudentEdit">  
                               <input type="hidden" name="id" value="<%=id%>">
                               <button type="submit" name="edit" class="btn btn-warning">EDIT</button>
                          </form>-->
                               
                                <form style="display: inline-block" method="post"action="StudentEdit">  
                                <input type="hidden" name="id" value="<%=id%>">
                                <button type="submit" name="edit" class="btn btn-warning">EDIT</button>
                            </form>

                                <form style="display: inline-block" action="Delete" method="post">  
                              <input type="hidden" name="id" value="<%=id%>">
                            <button type="submit" name="deletee" class="btn btn-danger">DELETE</button>
                          </form>  
                            
                           
                       </td> 
                       
                   </tr>
                   <%
                       }
}
catch(Exception e)
{
out.println(e);
}
                   %>
               </tbody>
               
               <script>
//    function print()
//{
//   var divToPrint=document.getElementById("printTable");
//   var newWin= window.open("");
//   newWin.document.write(divToPrint.outerHTML);
//   newWin.print();
//   newWin.close();
//} 
        
    </script>
              
           </table>     
               <form style="display: inline-block" class="ptn">  
                                <button   class="btn btn-info" onclick="print()">PRINT</button>
               
              
               <div class="col" style="display: inline-block">
                   <a href="Student_page.jsp"  class="btn btn-warning">BACK</a>
               </div>
                                 </form>
                
              
      </div>
               
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>