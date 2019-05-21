<html>
<head>
    <meta />
    <title>Welcome to View Pending  MileStone14</title>
     <link rel=stylesheet href="Projcss.css" />
     <style>
         .tr { height: 45px;}
     </style>
</head>
<jsp:include page="Header.jsp"/>
<body style="margin:0px">
<table width="100%" height="492" border="1">
   
    <td width="1" height="449" valign="top" ><jsp:include page="menu.jsp"/></td>
    <td width="759" valign="top" bgcolor="#E8E1C7">
        <div align="center" >
            <img src="Login.jpg" width="209" height="166">
        </div>
            <center>
            <div align="center" class="frm">
             <form name="login"action="SignInAction"  method="post" >
                <table width="100%" height="100%" border="0" align="center">
                    <tr valign="top">
                        <td height="36" bgcolor="#668CCC" colspan="2"><p align="center" class="style10" > <img src="logo1.png" width="35" height="35"></td>
                    </tr>
                    <tr class="tr">
                        <td>User Id <td> <input name="userid" type="text" class="fld" maxlength="30" placeholder="Enter ur User Id" required/>
                    </tr>
                    <tr class="tr">
                        <td>Password<td><input name="pass" type="password" maxlength="15" class="fld" placeholder="Enter ur Password" required/>
                    </tr>
                    <tr class="tr">
                        <th colspan="2"><input type="submit" name="Submit" class="btn" value="LOG IN" />
                    </tr>
                      <tr class="tr">
                        <td colspan="2">
                                <%
                                   String t = request.getParameter("t");
                                   if(t!=null)
                                   {
                                       out.println("<hr size=2 color=green>");
                                       if(t.equals("2"))
                                           out.print("U r Successfully Logout...");
                                       if(t.equals("1"))
                                           out.print("Sorry U can't contd.. without Login...");
                                       if(t.equals("0"))
                                           out.print("Sorry U have to login as Dean or HOD");
                                   }
         String msg = (String)request.getAttribute("msg");
            if(msg!=null)
              out.println(msg);
        
                                %>
                      </tr>
                </table>
            </form>
          </div>
            </center>              
    
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