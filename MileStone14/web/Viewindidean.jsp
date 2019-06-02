
<%@page import="java.sql.ResultSet"%>
<%@page import="code.FormTable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="code.Form2"%>
<html>
<head>
    <meta/>
    <title>MileStone14</title>
     <link rel=stylesheet href="Projcss.css" />
     <style>
         .gfg
            {
                 border-spacing: 0 20px;
             }
             
         
     </style>
</head>
<jsp:include page="Header2.jsp"/>

<body style="margin:0px">
<table width="100%" height="492" border="1">
    
    <td width="1" height="449" valign="top" ><jsp:include page="SideNavigation.jsp"/></td>
    <td width="759" valign="top" bgcolor="#E8E1C7">
           <form action="DeanComment"  method="post" >
               <center>
                   <table>
                       <thead>
            <tr>
                <th>Semester</th>
                <th>Subject</th>
                <th>Topics Covered</th>
                <th>No. of period</th>
                <th>Average Attendance</th>
            </tr>
        </thead>
                   <%
            String authority = (String)session.getAttribute("authority");
      if(authority==null)
            response.sendRedirect("Login.jsp?t=1");
                       
                       String i = request.getParameter("id");
                       int id = Integer.parseInt(i);
                       Form2 f2 = db.Admin.getFormListById(id);
                                    String uid = f2.getEmail();
            System.out.println("");
            if(uid == null) uid = "";else;
            ResultSet rs = db.Admin.getUser(uid);
            if(rs.next()) {
                %>
                <br><br><br>
                   NAME: <input type="text" class="fld" name="name" size="30" maxlength="30" readonly value="<%=rs.getString(2)%>">
                   Department: <input type="text" class="fld" name="name" size="30" maxlength="30" readonly value="<%=rs.getString(10)%>">
        <%
            }
                   ArrayList list = db.Admin.getForm1(id);
                   
for(Object o:list)
{
    FormTable f = (FormTable)o;
    %>
    <br>
    <input type=hidden name=uid class="fld" readonly value="<%=f2.getEmail()%>">
    <tr><td><input type=text name=cls class="fld" readonly value="<%=f.getSemester()%>"></td><td><input type=text class="fld" readonly name=sub value="<%=f.getSubject()%>"></td><td><input type=text name=topic class="fld" readonly value="<%=f.getTopic()%>"></td><td><input type=text name=period class="fld" readonly value="<%=f.getPeriod()%>"></td><td><input type=text name=avg class="fld" readonly value="<%=f.getAverage()%>"></td></tr>              
                   <%
}
%>
                   </table>
    <div>
                <table class="gfg">
                    <br>
                    <tr>
                        
                        <td>Steps Taken to Improve Class Attendance</td>
                        <td> <textarea  name="impattend"  rows="3" cols="80" readonly><%=f2.getImpattend()%></textarea></td>
                    </tr> 
                    <tr>
                        <td>Innovations brought in Teaching</td>
                        <td><textarea name="innovation" rows="3" cols="80" readonly><%=f2.getInnovation()%></textarea></td>
                    </tr> 
                    <tr>
                        <td>Curricular/Co-Curricular Activities Organized or in which Participated</td>
                        <td><textarea name="curricular" rows="3" cols="80" readonly><%=f2.getCurricular()%></textarea></td> 
                    </tr> 
                    <tr>
                        <td>Administrative Responsibilities  Carried Out</td>
                        <td><textarea name="responsibility" rows="3" cols="80" readonly><%=f2.getResponsibilty()%></textarea></td>
                    </tr> 
                    <tr>
                        <td>Contributions made towards Admissions</td>
                        <td><textarea name="contadmission" rows="3" cols="80" readonly><%=f2.getContadmission()%></textarea></td>
                    </tr>  
                    <tr>
                        <td>Contributions made for Training & Placement</td>
                        <td><textarea name="contplacement" rows="3" cols="80" readonly><%=f2.getContplacement()%></textarea></td>
                    </tr>
                    <tr>
                        <td>Suggestions for improvement , Growth & Development of the Department and ant Special Achievements</td>
                        <td><textarea name="suggestion" rows="3" cols="80" readonly><%=f2.getSuggestion()%></textarea></td>
                    </tr>
                    <tr>
                        <td>Comment of HOD</td>
                        <td><textarea name="hodcomment" rows="3" cols="80" readonly><%=f2.getHodcomment()%></textarea></td>
                    </tr>
                    <tr>
                        <td>Comment of Director General</td>
                        <td><textarea name="dgcomment" rows="3" cols="80" readonly><%=f2.getDgcomment()%></textarea></td>
                    </tr>
                    <tr>
                        <td>Comment of Dean</td>
                        <td><textarea name="deancomment" rows="3" cols="80" ></textarea></td>
                    </tr>
                </table>
                    <input type="submit" value="submit">    
                  
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