<%@ page import="javax.servlet.http.HttpSession" %>

<%
  // Get the current session
  
  // Check if the session exists
  if (session != null) {
    // Clear the session
    session.invalidate();
  }
  
  // Redirect the user to the login page or any other desired page
  response.sendRedirect("home.jsp");
%>