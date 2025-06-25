<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>



<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SMS Admin Page</title>
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
    </style>
  </head>
  <body>
      <div class="container">
          
           <h1 class="text-center">SMS ADMIN PAGE</h1>
           <table class="table table-striped" style="border:2px solid black;text-align: center">
               <thead>
                   <tr>
                       <th>ID</th>
                        <th>NAME</th>
                         <th>PASSWORD</th>
                   </tr>
               </thead>
               <tbody>
                   <%
                       try(Connection conn = JDBC.con();
                       PreparedStatement pst = conn.prepareStatement("sp_sms_web_admin_getall"))
                       {
                       ResultSet rs = pst.executeQuery();
                       while(rs.next())
                       {
                       String id = rs.getString("id");
                       String name = rs.getString("name");
                       String password = rs.getString("password");
                   %>
                   <tr>
                       <td><%=id%></td>
                       <td><%=name%></td>
                       <td><%=password%></td>
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
                        <a href="Student_page.jsp"  class="btn btn-warning">BACK</a>
                    </div>
      </div>

          
     
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>