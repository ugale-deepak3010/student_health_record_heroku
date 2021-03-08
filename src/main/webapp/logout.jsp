<%-- 
    Document   : logout
    Created on : 26 Apr, 2020, 11:31:50 AM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<% session.invalidate(); %>
<% HttpSession ses = request.getSession(false);
if(ses != null) {
   out.print(session.getAttribute("officer_id"));
}
else{
  response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location","index.jsp");
        
}
%>
    </body>
</html>
