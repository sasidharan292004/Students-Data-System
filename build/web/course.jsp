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
    <title>SMS Course Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body{
            background-color: #9cf5fc;
            background-image:url('image/sms_web_bg3.jpg');
            background-attachment:fixed;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .form-label
        {
            color: white;
        }
         h1{
             color:gold;
        }
        .edit{
            background-color: orange;
            border-radius: 10px;
        }
        .delete{
            background-color:red;
            border-radius: 10px;  
        }
        
    </style>
  </head>
  <body>
      <div class="container">
          
           <h1 class="text-center"> ADD COURSE PAGE</h1>
      <form method="post" action="course.jsp">
  <div class="mb-3">
    <label  class="form-label">COURSE ID :</label>
    <input type="text" class="form-control" name="course_id" required="">
   </div>
          
   <div class="mb-3">
    <label  class="form-label">COURSE NAME :</label>
    <input type="text" class="form-control" name="course_name" required="">
   </div>
  
          <div class="row">
               <div class="col">
                  <input type="submit" class="btn btn-success" value="ADD" name="add">
              </div>
               <div class="col">
                  <a href="course_details.jsp"  class="btn btn-primary">COURSE DETAILS</a>
           </div>
              <div class="col">
                  <a href="Student_page.jsp" class="btn btn-warning">BACK</a><br><br>
              </div>
            </div>
          
          
      </form>
      </div>
      <br><br>   
  </body>