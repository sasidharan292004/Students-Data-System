<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>



<!doctype html>
<%
    if(request.getParameter("signup")!= null)
    {
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
  
try(Connection conn = JDBC.con();
PreparedStatement pst = conn.prepareStatement("sp_sms_web_admin_insert ?,?,?"))
{
 pst.setString(1,id);
 pst.setString(2,name);
 pst.setString(3, password);

 int result = pst.executeUpdate();
 if(result == 1)
 {
 %>
 <script>
     alert("Signed Up");
     location.assign("http://localhost:8080/SMS_Web/login.jsp");
     </script>
<%
     }
  else
  {
  %>
   <script>
     alert(" Can't SignUp");
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
    
    
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SMS Signup page</title>
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
            <h1 class="text-center">SMS SIGN-UP PAGE</h1>
            <form method="post" action="signup.jsp">
                <div class="mb-3">
                    <label  class="form-label">ID :</label>
                    <input type="text" class="form-control" name="id" required="">
                </div>

                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">NAME :</label>
                    <input type="text" class="form-control" name="name" required="">
                </div>

                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">PASSWORD :</label>
                    <input type="text" class="form-control" name="password" required="">
                </div>


                <div class="row">
                    <div class="col">
                        <input type="submit" class="btn btn-danger" value="SIGN-UP" name="signup">
                    </div>

                   

                </div>
            </form>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>