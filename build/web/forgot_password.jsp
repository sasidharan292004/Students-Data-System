<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>



<!doctype html>

  
        

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SMS Forgot Password page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <style>
        body{
            background-color: #9cf5fc;  background-image:url('image/sms_web_bg3.jpg');
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
          <h1 class="text-center">SMS FORGOT PASSWORD PAGE</h1>
      <form method="post" action="forgot_password.jsp">
  <div class="mb-3">
    <label  class="form-label">ID :</label>
    <input type="text" class="form-control" name="id" required="">
  </div>
          <% 
   if(request.getParameter("get") != null)
    {
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    try(Connection conn = JDBC.con();
    PreparedStatement pst = conn.prepareStatement("sp_sms_web_admin_forgotpassword ?"))
    {
    pst.setString(1,id);
    ResultSet rs = pst.executeQuery();
    if(rs.next())
    {
    String name = rs.getString("name");
    String pwd = rs.getString("password");
    %>
           <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">NAME :</label>
    <input type="text" class="form-control" name="id" value="<%=name%>" readonly="">
  </div>
          
           <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">PASSWORD :</label>
    <input type="text" class="form-control" name="password" value="<%=pwd%>" readonly="">
  </div>
  <script>
      alert("Name : <%=name%> & Password : <%=pwd%>");
  </script>  
          <%
}
else
{
%>
  <script>
      alert("Incorrect ID !");
  </script>  
<%
}
}
catch(Exception e)
{
out.println(e);
}
}
%>
  
   
    <div class="row">
              <div class="col">
                  <input type="submit" class="btn btn-danger" value="GET" name="get">
              </div>
         <div class="col">
                  <a href="login.jsp" class="btn btn-primary">LOGIN</a>
              </div>
          

              
         
</form>
          
      </div>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>