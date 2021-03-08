<%@page import="java.sql.*,java.util.*"%>
<%
    String hid_temp=request.getParameter("hid");
    int hid=Integer.parseInt(hid_temp);
    out.print(hid);
    try{
             // Class.forName("com.mysql.jdbc.Driver");
             // java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_health_record","root","");

Class.forName("org.postgresql.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-79-125-26-232.eu-west-1.compute.amazonaws.com:5432/d6nh93jebmbqfv?sslmode=require","zylqnlbnvejjpa","256553f9ff6a847afc1e60e67a1d79cd3da845c902d384df784705717804be43");

              
Statement st= con.createStatement();
              ResultSet rs;

              st.executeUpdate("DELETE  FROM student_record WHERE health_id="+hid);
              response.setStatus(response.SC_MOVED_TEMPORARILY);
              response.setHeader("Location", "view_student_data.jsp");
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>