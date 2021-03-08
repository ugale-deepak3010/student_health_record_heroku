<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
    Connection con=null;
    Statement st=null;
    try{
    //Class.forName("com.mysql.jdbc.Driver");
    //con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");
    

st=con.createStatement();
    }catch(Exception e){
        out.print("dbconnect is error="+e);
    }
%>