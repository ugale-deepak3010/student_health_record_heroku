<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="shortcut icon" href="img/shr_ico.png" type="image/x-icon" />
<%
String fname=request.getParameter("first_name");
String lname=request.getParameter("last_name");
String phone=request.getParameter("phone");
String officer_id_temp=request.getParameter("officer_id");

//int phoneInt = Integer.parseInt(phone);//not work because limit of int value.
String password=request.getParameter("password");
try
{
out.print("vvvv="+officer_id_temp);
int officer_id1=Integer.parseInt(officer_id_temp);
//Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record", "root", "");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");


Statement st=con.createStatement();

String qry9="INSERT INTO register VALUES("+officer_id1+",'"+fname+"','"+lname+"','"+password+"','"+phone+"')";

st.executeUpdate(qry9);
out.println("<div class='alert alert-success' role='alert'> <a type='button' href='register_officer.jsp' class='btn btn-outline-success btn-lg btn-block'>Successfully Registered OnClick to Go Back</a></div>");
}
catch(Exception e)
{
out.print("Error="+e);
e.printStackTrace();
}
%>