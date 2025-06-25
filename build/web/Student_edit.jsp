<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
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
        <title> Student Edit page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <style>
            body{

                background-image:url('image/bg3.jpg');
                background-attachment:fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
            label
            {
                color: black;
                font-size: 25px;
            }
            /*            input[type=radio] {
                border: 0px;
                width: 1%;
                height: 20px;
            }*/
            form{
                padding: 20px
            }
            .form-check{
                padding: 10px;
            }
            label{
                font-family: "Times New Roman", Times, serif;
            }

        </style>


        <div class="container">
            <h2 style="color: black">Welcome <%=i%></h2>

            <div class="container1">
                <form  action="StudentUpdate"  method="post" enctype="multipart/form-data">
                    <div>
                        <h1 class="text-center" style="color:black">SMS STUDENT EDIT PAGE</h1> 
                    </div> 
                    <div class="form-group">
                        <label class="sr-only">ID :</label>
                        <input type="text" class="form-control" name="id" value="<%=request.getAttribute("id")%>" readonly="" >
                    </div>  

                    <div class="form-group">
                        <label class="sr-only">NAME :</label>
                        <input type="text" class="form-control" name="name"  value="<%=request.getAttribute("name")%>">
                    </div>  

                    <div>
                        <label>GENDER :</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="male" <%= "male".equals(request.getAttribute("gender")) ? "checked" : "" %> >
                            <label class="form-check-label">
                                MALE
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="female"<%= "female".equals(request.getAttribute("gender")) ? "checked" : "" %>  >
                            <label class="form-check-label">
                                FEMALE
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="others" <%= "others".equals(request.getAttribute("gender")) ? "checked" : "" %> >
                            <label class="form-check-label">
                                OTHERS
                            </label>
                        </div>
                    </div>

                    <div>
                        <label>COURSE :</label>
                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="course" >
                           
                            <%
                                String selected_course_name = (String)request.getAttribute("course");
                                try (Connection conn = JDBC.con(); 
                                PreparedStatement pst = conn.prepareStatement("sp_web_course_getname")) {
                                    ResultSet rs = pst.executeQuery();
                                    while (rs.next()) {
                                        String coursename = rs.getString("course_name");
                                        String CourseName = coursename.equals(selected_course_name)? "CourseName" : "";
                            %>
                            <option value="<%=coursename%>"<%=CourseName%>><%=coursename%></option>
                            <%
                                    }
                                    
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="sr-only">DOB :</label>
                        <input type="date" class="form-control" name="dob"  value="<%= request.getAttribute("dob")%>">
                    </div> 

                    <div class="mb-3">
                        <label  class="form-label">image :</label>
                        <input class="form-control" type="file" name="image"  value="<%= request.getAttribute("image")%>">
                         <img src="data:image/png;base64,<%= Base64.getEncoder().encodeToString((byte[]) request.getAttribute("image"))%>"  style="width: 100px; height: 100px">

                    </div>

                    <div class="form-group">
                        <label class="sr-only">TIME :</label>
                        <!--<input type="text" class="form-control" name="time" value="" readonly="" value="<%=request.getAttribute("time")%>">-->
                        <input type="text"  name="time" class="form-control" value="<%=request.getAttribute("time")%>" ><br>
                    </div> 
                    
                    
            <div>
              
                <input type="submit" class="btn btn-success" value="UPDATE"> <br><br>
                  
            </div> 
           
                <div class="row">
               <div class="col">
               <a href="Student_details.jsp"  class="btn btn-warning">BACK</a>
               </div>
                        
                     </div>
                </form>
        </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>