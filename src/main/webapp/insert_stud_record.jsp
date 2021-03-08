<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %>
<%
    String officer_id_temp= (String)session.getAttribute("officer_id");
    int officer_id=Integer.parseInt(officer_id_temp);
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String prn=request.getParameter("prn");
//    int prn=Integer.parseInt(prn_temp);
    String height=request.getParameter("height");
    String weight=request.getParameter("weight");
    String pc=request.getParameter("ph");
    String comment=request.getParameter("comment");
    String favor=request.getParameter("favor");
    
    try{
      //  Class.forName("com.mysql.jdbc.Driver");
      //  java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");

int max=0;
Statement st= con.createStatement();
ResultSet rs;
              rs=st.executeQuery("SELECT MAX(health_id) from student_record");
              //rs.next();
              //
              while(rs.next()){
               max=rs.getInt(1);  //Very Important
               }

String qry8="INSERT INTO student_record(health_id,first_name,last_name,prn,height,weight,favor,physical_challenge,comment,officer_id) VALUES("+(max+1)+",'"+fname+"','"+lname+"','"+prn+"','"+height+"','"+weight+"','"+favor+"','"+pc+"','"+comment+"',"+officer_id+")";
out.print("<a href='mainpage.jsp'>Suucess</a>");
st.executeUpdate(qry8);
con.close();
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>