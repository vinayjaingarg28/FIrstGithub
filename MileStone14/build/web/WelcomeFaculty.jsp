<html>
<head>
    <meta/>
    <title>Welcome to MileStone14</title>
     <link rel=stylesheet href="Projcss.css" />
</head>
<jsp:include page="Header2.jsp"/>

<body style="margin:0px">
<table width="100%" height="492" border="1">
    
    <td width="1" height="449" valign="top" ><jsp:include page="SideNavigation.jsp"/></td>
    <td width="759" valign="top" bgcolor="#E8E1C7">
        <div align="center" >
            <p><img src="home4.jpg" width="500" height="170"></p>
        </div>
        <br>
        <%
        String uid = (String)session.getAttribute("uid");
        if(uid==null)
            response.sendRedirect("Login.jsp?t=1");
        String authority = (String)session.getAttribute("authority");
        if(authority==null) uid = authority = "";
    %>
  Hello , U r Login as - <%=authority%> 


           <form action=" "  method="post" >

            <div align="center">
                <table>
                    <br>
                    
         <td width="22%" bordercolor="#4E3A3" bgcolor="black" ><div align="center" class="style11">
  
      </div>
  </td>
   </tr>
     <tr>
         <td width="22%" bordercolor="#4E3A3" bgcolor="black" ><div align="center" class="style11"><a href="ViewProfile.jsp">View Profile</a></div></td>
   </tr>
   <%
       int i=db.Admin.checkDate(uid);
       if(!(i>0))
       {
       %>
   <tr>
         <td width="16%" bordercolor="#4E3A34" bgcolor="black"><div align="center" class="style4"><a href="FortNight.jsp">Fill Fortnight</a></div></td>
   </tr>  
   <%
       }
else{
       %>
   
  <tr>
         <td width="14%" bordercolor="#4E3A34" bgcolor="black"><div align="center" class="style4"><a href="Viewowncomplete.jsp">View Fortnight</a></div></td>
  </tr> 
<%}%>  
                </table>
        </div></form>
        <p align="center">&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
    <p>&nbsp;</p>    </td>
    </tr>
</table>
</tr>
</table>

</body>
</html>