<%@page import="DB.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<jsp:include page="header.jsp" />


<!doctype html>
<%
    java.util.Date now = new java.util.Date();
    java.sql.Time currenttime = new java.sql.Time(now.getTime());

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
        <title>SMS Student page</title>
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
                <form  action="StudentAdd"  method="post" enctype="multipart/form-data">
                    <div>
                        <h1 class="text-center" style="color:black">SMS STUDENT PAGE</h1> 
                    </div> 
                    <div class="form-group">
                        <label class="sr-only">ID :</label>
                        <input type="text" class="form-control" name="id" required="">
                    </div>  

                    <div class="form-group">
                        <label class="sr-only">NAME :</label>
                        <input type="text" class="form-control" name="name" required="">
                    </div>  

                    <div>
                        <label>GENDER :</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="male" required="">
                            <label class="form-check-label">
                                MALE
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="female" required="">
                            <label class="form-check-label">
                                FEMALE
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="others" required="">
                            <label class="form-check-label">
                                OTHERS
                            </label>
                        </div>
                    </div>

                    <div>
                        <label>COURSE :</label>
                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="course" required="">
                            <option selected>--SELECT COURSE--</option>
                            <%
                                try (Connection conn = JDBC.con(); PreparedStatement pst = conn.prepareStatement("sp_sms_web_course_getall")) {
                                    ResultSet rs = pst.executeQuery();
                                    while (rs.next()) {
                                        String coursename = rs.getString("course_name");
                            %>
                            <option><%=coursename%></option>
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
                        <input type="date" class="form-control" name="dob" required="">
                    </div> 

                    <div class="mb-3">
                        <label  class="form-label">image :</label>
                        <input class="form-control" type="file" name="image" required="">
                    </div>

                    <div class="form-group">
                        <label class="sr-only">TIME :</label>
                        <input type="text" class="form-control" name="time" value="<%=currenttime%>" required="">
                    </div>  




            

           
            <div>
              
                    <input type="submit" class="btn btn-success" value="ADD" name="add"> 
                  
            </div>
                        </form>
                     </div>
        </div>








        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>