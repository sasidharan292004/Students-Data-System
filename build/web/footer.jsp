<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
    <%
    HttpSession s = request.getSession();
    String i = (String) s.getAttribute("id");
        s.setMaxInactiveInterval(120);
  if(i==null)
  {
  response.sendRedirect("login.jsp");
}
%>
<style>
    .container
    {
       
      padding: 10px;
    }
</style>
<!DOCTYPE html>
<footer class="bg-dark text-white text-center py-1">
    <div class="container" >
        <p>&copy;2025 SMS 06 All rights reserved.</p>
    </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
</footer>
    </body>
</html>
