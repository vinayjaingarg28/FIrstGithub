<html>
<head>
    <meta/>
    <title>MileStone14-Fill the FortNight-2</title>
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
           <form action="FortNight2"  method="post" >

            <div >
                <table class="gfg">
                    <br>
                    <%
        String uid = (String)session.getAttribute("uid");
           if(uid==null)
       response.sendRedirect("Login.jsp?t=1");
        String authority = (String)session.getAttribute("authority");
        if(authority==null) uid = authority = "";
    %>
                    <tr>
                        <td>Steps Taken to Improve Class Attendance</td>
                        <td> <textarea name="impattend" rows="3" cols="80" ></textarea></td>
                    </tr> 
                    <tr>
                        <td>Innovations brought in Teaching</td>
                        <td><textarea name="innovation" rows="3" cols="80" ></textarea></td>
                    </tr> 
                    <tr>
                        <td>Curricular/Co-Curricular Activities Organized or in which Participated</td>
                        <td><textarea name="curricular" rows="3" cols="80" ></textarea></td> 
                    </tr> 
                    <tr>
                        <td>Administrative Responsibilities  Carried Out</td>
                        <td><textarea name="responsibility" rows="3" cols="80" ></textarea></td>
                    </tr> 
                    <tr>
                        <td>Contributions made towards Admissions</td>
                        <td><textarea name="contadmission" rows="3" cols="80" ></textarea></td>
                    </tr>  
                    <tr>
                        <td>Contributions made for Training & Placement</td>
                        <td><textarea name="contplacement" rows="3" cols="80" ></textarea></td>
                    </tr>
                    <tr>
                        <td>Suggestions for improvement , Growth & Development of the Department and ant Special Achievements</td>
                        <td><textarea name="suggestion" rows="3" cols="80" ></textarea></td>
                    </tr>
                </table>
                    <center>
                   <input type="submit" value="Submit"> 
                    </center>
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