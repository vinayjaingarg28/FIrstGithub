<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 100%;
  z-index: 1;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div class="sidenav">
       <%
        String uid = (String)session.getAttribute("uid");
        if(uid==null)
       response.sendRedirect("Login.jsp?t=1");
        String authority = (String)session.getAttribute("authority");
        if(authority==null) uid = authority = "";
    %>
    <a href="ViewProfilehod.jsp">View Profile</a><br>
   <a href="AddUser.jsp">Add new User</a><br>
       <%
       int i=db.Admin.checkDate(uid);
       if(!(i>0))
       {
       %>
 <a href="FortNight.jsp">Fill Fortnight</a> <br>
   <%
       }
else{
       %>
       
        <a href="Viewowncomplete.jsp">View Fortnight</a><br>
<%}%>  
 <a href="ViewPendHod.jsp">Pending Report</a><br>
                 <a href="SuggestionReport.jsp">Suggestion Report</a><br>
                 <a href="Completereport.jsp">Compeleted Report</a><br>
</div>
</body>
</html> 

