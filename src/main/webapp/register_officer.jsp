<%-- 
    Document   : index
    Created on : 22 Apr, 2020, 3:30:52 PM
    Author     : Deepak
--%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student_Health_Record</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="img/shr_ico.png" type="image/x-icon" />
    </head>
    <body>
        <%! int m=0,max=0;%>
          <%
    String admin_id = (String)session.getAttribute("admin_id");
if (admin_id == null){
response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location","index.jsp");
}
else{
//out.print("<h1>" + admin_id + "</h1>");
//out.print("<a href='logout.jsp'>Logout</a>");
}
    %>
        <div class="container">
            <hr>
            <center><h1>Student Health Record</h1></center><hr>
            <center><div class="btn-group btn-group-lg">
        <a href="mainpage.jsp"  class="btn btn-primary active">Register</a>
        <a href="logout.jsp"  class="btn btn-primary">Logout</a>
</div> </center><hr>
            <form action="officer_register.jsp" method="post">
                <fieldset>
    <div class="form-inline fluid" >
    <div class="form-group col-sm-4">
      <label for="first_name">First Name :&nbsp;&nbsp;&nbsp;</label>
      <input type="text" pattern="[A-Za-z]{3,32}" class="form-control" id="first_name" placeholder="Officer first name" name="first_name" required>
    </div>
    <div class="form-group col-sm-4">
      <label for="last_name">Last Name :&nbsp;&nbsp;&nbsp;</label>
      <input type="text" pattern="[A-Za-z]{3,32}" class="form-control" id="last_name" placeholder="Officer last name" name="last_name" required>
    </div>
    <div class="form-group col-sm-4">
      <label for="phone">Contact No :&nbsp;&nbsp;&nbsp;</label>
      <input type="tel" class="form-control" id="phone" placeholder="officer Mobile" name="phone" pattern="(6|7|8|9)\d{9}" required>
    </div>
    </div>
    <br>
    <div class="form-group">
      <label for="officer_id">Officer ID:</label>
      <input type="text" class="form-control " id="officer_id" placeholder="Auto generated : <%
          try{
           //   Class.forName("com.mysql.jdbc.Driver");
           //   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");

             
 Statement st= con.createStatement();
              ResultSet rs;
              
              rs=st.executeQuery("SELECT MAX(officer_id) from register");
              //rs.next();
              //
              while(rs.next()){
                max=rs.getInt(1);  //Very Important
                m=max+1;
              }
              out.print(max+1);
          }catch(Exception e){
              out.print("errror"+e);
          }
      %> "   disabled>
      <input type="text" value="<% out.print(m); %>" name="officer_id" style="display:none;">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="text" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" id="password" placeholder="Enter password" name="password" required>
    </div>
            <center><button type="submit" class="btn btn-outline-dark">Add Officer</button></center>
                </fieldset>
  </form>
        </div>
    </body>
</html>
