<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
    <%
    HttpSession s = request.getSession();
    String i = (String) s.getAttribute("id");
        s.setMaxInactiveInterval(60);
  if(i==null)
  {
  response.sendRedirect("login.jsp");
}
if(request.getParameter("logout")!=null)
{
s.removeAttribute("i");
response.sendRedirect("login.jsp");
}
%>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <body>
        <style>
          .container-fluid  {
              background-color:black;
            }
            .navbar-brand{
                background-color:aqua;
                margin: 5px;
                border-radius: 5px;
            }
            .pdf 
            {
                padding: 20px;
            } 

            
        </style>
         <%
             String msg = "Press OK to LogOut ";
         %>
  <script>
     
    
    function getout(m)
    {
      alert(m)  ;
    }
</script>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin.jsp">ADMIN</a>
                <a class="navbar-brand" href="course.jsp">COURSE</a>
                 <a class="navbar-brand" href="student_details.jsp">STUDENT</a>
                 <form  action="PDF">  
                     <button   class="btn btn-info" type="submit">PDF</button>
                 </form>
                 
                     <form action="CSV">  
                     <button   class="btn btn-info" type="submit">CSV</button>
                     </form>
                 <form>
                      <button type="submit" class="btn btn-warning btn-sm" name="logout" onclick="getout('<%=msg%>')">LOGOUT</button> 
                 </form>
                
                   
                
            </div>
        </nav>

        
