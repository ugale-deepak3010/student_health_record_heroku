<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/animate.css">
  <link rel="shortcut icon" href="img/shr_ico.png" type="image/x-icon" />
  
</head>
<body class="">
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
    <hr><center><h1>Student Health Record</h1><hr>
    <div class="animated bounceInRight btn-group btn-group-lg">
        <a href="mainpage.jsp"  class="btn btn-primary active">Insert Student Health</a>
        <a href="logout.jsp"  class="btn btn-primary">Logout</a>
  <a href="view_student_data.jsp" class="btn btn-primary">View Student Health</a>
</div>    
    </center><hr>
        <br><br>
</div>
    <div class="container animated rotateInUpLeft">
  <form class="form-inline" action="insert_stud_record.jsp"  method="post">
    <div class="form-group">
        <input type="text" pattern="[A-Za-z]{3,32}" class="form-control" placeholder="First Name" name="fname" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" pattern="[A-Za-z]{3,32}" placeholder="Last Name" name="lname" required>
    </div>
    <div class="form-group">
        <input type="tel" class="form-control" pattern="[0-9]{3,32}" placeholder="PRN No" name="prn" required>
    </div>
    <div class="form-group">
      <input type="text" class="form-control"  placeholder="Height (cm)" name="height">
    </div><hr><center><button type="button" class="btn btn-outline-success">HID
        <%
          try{
             // Class.forName("com.mysql.jdbc.Driver");
             // java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");

             
 Statement st= con.createStatement();
              ResultSet rs;
              int max=0;
              rs=st.executeQuery("SELECT MAX(health_id) from student_record");
              //rs.next();
              //
              while(rs.next()){
                max=rs.getInt(1);  //Very Important
              }
              out.print(max+1);
          }catch(Exception e){
              out.print("errror"+e);
          }
        %>
        </button></center> 
      
    <div class="form-group">
        <input type="text" class="form-control"  placeholder="Weight (kg)" name="weight" required>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" pattern="{3,100}"  placeholder="Any Favor" name="favor">
    </div>
    <div class="form-group">
        <label for="ph">Physical (PH):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <select  class="form-control" name="ph">
          <option name="ph" value="No">No</option>
          <option name="ph" value="Yes">Yes</option>
      </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control"  placeholder="Comment" name="comment">
    </div>
      <hr>
    <center><button type="submit" class="btn btn-outline-dark">Insert</button></center> 
  </form>
</div>

</body>
</html>
