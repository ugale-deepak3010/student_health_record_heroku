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
<body class="animated lightSpeedIn">
      <%
    String officer_id = (String)session.getAttribute("officer_id");
if (officer_id == null){
	out.print("<h1>Session is not set</h1>");
}
else{
}
    %>
    <%!
        String fn="", ln="",prn="",ht="",fv="",ph="",cm="";
        int wt=0;
    %>
<%
    String hid_temp=request.getParameter("hid");
    int hid=Integer.parseInt(hid_temp);
    

    try{
       //       Class.forName("com.mysql.jdbc.Driver");
        //      java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");

          
    Statement st= con.createStatement();
              ResultSet rs;

              rs=st.executeQuery("SELECT * from student_record WHERE health_id="+hid);
              while(rs.next()){
                 fn=rs.getString("first_name");
                 ln=rs.getString("last_name");
                 prn=rs.getString("prn");
                 ht=rs.getString("height");
                 wt=rs.getInt("weight");
                 fv=rs.getString("favor");
                 ph=rs.getString("physical_challenge");
                 cm=rs.getString("comment");                             }
    }catch(Exception e){
              out.print("errror"+e);
          }
    
%>
<div class="container">
    
    <hr><center><h1>Student Health Record</h1><hr><h3>Update Health Data</h3></center><hr><br><br>
</div>
    <div class="container">
  <form class="form-inline" action="shd_update.jsp"  method="post">
    <div class="form-group">
        <input type="text" class="form-control" pattern="[A-Za-z]{3,32}" placeholder="First Name" name="fname" value="<% out.print(fn); %>" required>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" pattern="[A-Za-z]{3,32}" placeholder="Last Name" name="lname" value="<% out.print(ln); %>" required>
    </div>
    <div class="form-group">
        <input type="tel" class="form-control" pattern="[0-9]{3,32}"  placeholder="PRN No" name="prn" value="<% out.print(prn); %>" required>
    </div>
    <div class="form-group">
        <input type="text" name="hid" value="<% out.print(hid); %>" style="display:none">
        <input type="text" class="form-control"  placeholder="Height (cm)" name="height" value="<%out.print(ht);%>">
    </div><hr><center><button type="button" class="btn btn-outline-success">HID<% out.print(hid); %>
        </button></center> 
      
    <div class="form-group">
        <input type="text" class="form-control"  placeholder="Weight (kg)" name="weight" value="<% out.print(wt); %>" required>
    </div>
    <div class="form-group">
      <input type="text" class="form-control"  placeholder="Any Favor" value="<% out.print(fv); %>" name="favor">
    </div>
    <div class="form-group">
        <label for="ph">Physical (PH):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <select  class="form-control" name="ph">
          <option name="ph" value="No">No</option>
          <option name="ph" value="Yes">Yes</option>
      </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control"  placeholder="Comment" name="comment" value="<% out.print(cm); %>" >
    </div>
      <hr>
    <center><button type="submit" class="btn btn-outline-dark">Update</button></center> 
  </form>
</div>

</body>
</html>
