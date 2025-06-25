<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>



<!doctype html>
<%
        HttpSession s = request.getSession();
    String i = (String) s.getAttribute("id");
        s.setMaxInactiveInterval(120);
  if(i==null)
  {
  response.sendRedirect("login.jsp");
}

if(request.getParameter("add") != null)
    {
    String course_id = request.getParameter("course_id");
    String course_name = request.getParameter("course_name");
    try(Connection conn = JDBC.con();
    PreparedStatement pst = conn.prepareStatement("sp_sms_web_course_insert ?,?"))
    {
    pst.setString(1,course_id);
    pst.setString(2,course_name);
    int result = pst.executeUpdate();
    if(result == 1)
    {
%>
<script>
       alert("Course Added");
      </script>
<%     
}
else
{
%>
   <script>
       alert("Error");
      </script>
      <%
          }
}
catch(Exception e)
{

}
}
    %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body{
            background-color: #9cf5fc;
            background-image:url('image/sms_web_bg3.jpg');
            background-attachment:fixed;
            background-repeat: no-repeat;
            background-size: cover;
        }
        h1
        {
            color: gold;
        }
        .edit{
            background-color:orange;
            border-radius: 5px;
        }
             .delete{
            background-color:red;
            border-radius: 5px;
        }
        .col{
            padding: 2px;
        }
    </style>
  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   <div class="container">
          
           <div class="container">
          
           <h1 class="text-center">COURSE DETAILS</h1>
           <table id="print" class="table table-striped" style="border:2px solid black;text-align: center">
               <thead>
                   <tr>
                       <th> COURSE ID</th>
                        <th> COURSE NAME</th>
                        <th>MODIFY</th>
                        
                   </tr>
               </thead>
               <tbody>
                   <%
                       try(Connection conn = JDBC.con();
                       PreparedStatement pst = conn.prepareStatement("sp_sms_web_course_getall"))
                       {
                       ResultSet rs = pst.executeQuery();
                       while(rs.next())
                       {
                       String course_id = rs.getString("course_id");
                       String course_name = rs.getString("course_name");
                   %>
                   <tr>
                       <td><%=course_id%></td>
                       <td><%=course_name%></td>
                       <td>
                           <form style="display: inline-block" action="edit.jsp">  
                               <input type="hidden" name="course_id" value="<%=course_id%>">
                               <input type="hidden" name="course_name" value="<%=course_name%>">
                               <button type="submit" name="edit" class="btn btn-warning">EDIT</button>
                          </form>
                                <form style="display: inline-block" action="delete.jsp">  
                              <input type="hidden" name="course_id" value="<%=course_id%>">
                               <input type="hidden" name="course_name" value="<%=course_name%>">
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
           </table>

               
               
               <div class="col">
                   <button class="btn btn-primary" onclick="print()">PRINT</button>
                    </div>
               <div class="col">
                        <a href="course.jsp"  class="btn btn-warning">BACK</a>
                    </div>
      </div>
  </body>
</html>