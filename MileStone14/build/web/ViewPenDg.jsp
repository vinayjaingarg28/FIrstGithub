<%@page import="code.Form2"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <meta/>
    <title>View Pending  Reports</title>
     <link rel=stylesheet href="Projcss.css" />
</head>
<jsp:include page="Header2.jsp"/>

<body style="margin:0px">
<table width="100%" height="492" border="1">
   
    <td width="1" height="449" valign="top" ><jsp:include page="SideNavigation.jsp"/></td>
    <td width="759" valign="top" bgcolor="#E8E1C7">
      
        <br>
       <%
        String uid = (String)session.getAttribute("uid");
         if(uid==null)
       response.sendRedirect("Login.jsp?t=1");
        String authority = (String)session.getAttribute("authority");
        if(authority==null) uid = authority = "";
    %>
  Hello , You are Login as - <%=authority%> 

           <form action=" "  method="post" >
               <center>
                   <div align="center" style="text-align: center; background-color:#ef475b ;width: 30%">
         <% 
ArrayList list = db.Admin.getFormList(authority);
if((list.isEmpty()))
{
    %>
    <h1>No Pending Records!</h1>
                       <%
}
else
{
for(Object o:list)
{
    Form2 f = (Form2)o;
    int i = f.getReportid();
    %>
     <a href="Viewindidg.jsp?id=<%=i%>" >
    <div>
        <%=f.getEmail()%>
    </div>
    <br>
    </a>
                       <%
}}
%>
                
   


        </div>                                    <br><br><br><br><br><br><br><br><br><br><br>

               </center>
           </form>
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