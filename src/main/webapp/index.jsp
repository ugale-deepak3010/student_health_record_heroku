<%-- 
    Document   : index
    Created on : 22 Apr, 2020, 3:30:52 PM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student_Health_Record</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="shortcut icon" href="img/shr_ico.png" type="image/x-icon" />
        <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
    </head>
    <body>
         
        
        
        <%
    String officer_id = (String)session.getAttribute("officer_id");
    String admin_id = (String)session.getAttribute("admin_id");
if (officer_id == null){
   // out.print("no officer");
        if (admin_id == null){
        //out.print("no admin");
        }
else{
          //  out.print("admin yes");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location","register_officer.jsp");       
}
        
}
else{
    //out.print("yes officer"+officer_id);
    //forward to insert student..
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location","mainpage.jsp");
}
    %>
        
        
        
        <div class="container">
            <hr>
            <center><h1 class="animated wow zoomIn">Student Health Record</h1></center><hr>
            <form class="animated wow rubberBand" action="action_login.jsp" method="post">
    <div class="form-group">
      <label for="officer_id">Officer ID:</label>
      <input type="text" class="form-control" id="officer_id" placeholder="Enter your ID" name="officer_id" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="pass" required>
    </div>
    <center><button type="submit" class="animated wow bounce btn btn-outline-dark">Login</button></center>
    
  </form>
        </div>
    </body>
</html>
