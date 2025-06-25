<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>



<!doctype html>
<%
    if(request.getParameter("login") != null)
    {
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    try(Connection conn = JDBC.con();
    PreparedStatement pst = conn.prepareStatement("sp_sms_web_admin_login ?,?"))
    {
    pst.setString(1,id);
    pst.setString(2,password);
    ResultSet rs = pst.executeQuery();
    if(rs.next())
    {
   %>
   <script>
       alert("Loged in");
        location.assign("http://localhost:8080/SMS_Web/Student_page.jsp");
      </script>
      <%
//          HttpSession s = request.getSession();
//          s.setAttribute("id",id);
}
else
{
%>
 <script>
       alert("Login Error");
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
    <title>SMS Login Page</title>
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
          
           <h1 class="text-center">SMS LOGIN PAGE</h1>
      <form method="post" action="login.jsp">
  <div class="mb-3">
    <label  class="form-label">ID :</label>
    <input type="text" class="form-control" name="id" required="">
   </div>
          
   <div class="mb-3">
    <label  class="form-label">PASSWORD :</label>
    <input type="password" class="form-control" name="password" required="">
   </div>
  
          <div class="row">
              <div class="col">
                  <input type="submit" class="btn btn-danger" value="LOGIN" name="login">
              </div>
              
              <div class="col">
                  <a href="signup.jsp" class="btn btn-primary">SIGN-UP</a>
              </div>

                    <div class="col">
                        <a href="forgot_password.jsp"  class="btn btn-success">FORGET PASSWORD</a>
                    </div>

                    <div class="col">
                        <a href="reset_password.jsp"  class="btn btn-success">RESET PASSWORD</a>
                    </div>
              
<!--              <div class="col">
                        <a href="admin.jsp"  class="btn btn-danger">ADMIN</a>
                    </div>-->
</form>
          
      </div>
          
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>