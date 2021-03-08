<%-- 
    Document   : view_student_data
    Created on : 25 Apr, 2020, 8:12:28 AM
    Author     : Deepak
--%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="shortcut icon" href="img/shr_ico.png" type="image/x-icon" />
    </head>
    <body>
          <%
    String officer_id = (String)session.getAttribute("officer_id");
if (officer_id == null){
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location","index.jsp");
}
else{
}
    %>
        <div class="container">
        <hr><center><h1>Student Health Record</h1><hr><div class=" animated bounceInLeft btn-group btn-group-lg">
        <a href="mainpage.jsp"  class="btn btn-primary ">Insert Student Health</a>
        <a href="logout.jsp"  class="btn btn-primary">Logout</a>
  <a href="view_student_data.jsp" class="btn btn-primary active">View Student Health</a>
</div> </center><hr><br><br>

        </div>
        <div class="container-fluid">
<div class="table-responsive animated bounceInUp">
<table class="table table-sm table-hover table-striped table-bordered">
    <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">PRN</th>
      <th scope="col">Health&nbsp;ID</th>
      <th scope="col">Height&nbsp;(cm)</th>
      <th scope="col">Weight&nbsp;(kg)</th>
      <th scope="col">Favor</th>
      <th scope="col">PH</th>
      <th scope="col">Comment</th>
      <th scope="col">date&nbsp;&&nbsp;time</th>
      <th scope="col">Officer&nbsp;ID</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <%
          try{
           //   Class.forName("com.mysql.jdbc.Driver");
           //   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");
            
Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");


  Statement st= con.createStatement();
              ResultSet rs;

              rs=st.executeQuery("SELECT * from student_record");
              int sr_no=1;
              while(rs.next()){
                out.print("<tr>");
                out.print("<th>"+sr_no+"</th>");
                out.print("<td>"+rs.getString("first_name")+"</td>");
                out.print("<td>"+rs.getString("last_name")+"</td>");
                out.print("<td>"+rs.getString("prn")+"</td>");
                int hid=rs.getInt("health_id");
                out.print("<td>"+hid+"</td>");
                out.print("<td>"+rs.getString("height")+"</td>");
                out.print("<td>"+rs.getInt("weight")+"</td>");
                out.print("<td>"+rs.getString("favor")+"</td>");
                out.print("<td>"+rs.getString("physical_challenge")+"</td>");
                out.print("<td>"+rs.getString("comment")+"</td>");
                out.print("<td>"+rs.getString("date_time")+"</td>");
                out.print("<td>"+rs.getInt("officer_id")+"</td>");
               
                out.print("<td><div class='btn-group-sm'><a href='update_shd.jsp?hid="+hid+"' class='btn btn-outline-warning'>Update</a><a href='delete_shd.jsp?hid="+hid+"'  class='btn btn-danger'>Delete</a></div></td>");
                out.print("</tr>");
                sr_no++;
              }
              //out.print(max+1);
          }catch(Exception e){
              out.print("errror"+e);
          }
        %>
  </tbody>
</table>
</div>

        </div>
    </body>
</html>
