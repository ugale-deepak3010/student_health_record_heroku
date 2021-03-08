<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String fname=request.getParameter("fname");
    String hid_temp=request.getParameter("hid");
    int hid=Integer.parseInt(hid_temp);
    String lname=request.getParameter("lname");
    String prn=request.getParameter("prn");
    String height=request.getParameter("height");
    String weight=request.getParameter("weight");
    String pc=request.getParameter("ph");
    String comment=request.getParameter("comment");
    String favor=request.getParameter("favor");
    
    try{
       // Class.forName("com.mysql.jdbc.Driver");
       // java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");


Statement st= con.createStatement();
String qry8="UPDATE student_record SET first_name='"+fname+"',last_name='"+lname+"',prn='"+prn+"',height="+height+",weight='"+weight+"',favor='"+favor+"',physical_challenge='"+pc+"',comment='"+comment+"' WHERE health_id='"+hid+"'";
st.executeUpdate(qry8);

response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "view_student_data.jsp");
         
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>