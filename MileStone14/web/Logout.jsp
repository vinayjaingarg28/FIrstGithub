<%
    session.removeAttribute("uid");
    session.removeAttribute("authority");
   session.invalidate();
   response.sendRedirect("Login.jsp?t=2");
%>