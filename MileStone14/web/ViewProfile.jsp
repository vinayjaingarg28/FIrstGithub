
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta>
        <title>www.MileStone14Fort14/ViewProfile.com</title>
         <%
            String uid = (String)session.getAttribute("uid");
             if(uid==null)
       response.sendRedirect("Login.jsp?t=1");
            System.out.println("");
            if(uid == null) uid = "";else;
            ResultSet rs = db.Admin.getUser(uid);
            if(rs.next()) {
        %>
     <link rel=stylesheet href="Projcss.css" />        
    </head>
    <jsp:include page="Header2.jsp"/>

    <body style="margin:0px" >
        <table width="100%" border="1" >

            <tr>
                <td width="1" height="449" valign="top" ><jsp:include page="menu.jsp"/></td>
                <td width="750"  bgcolor="#FFFFFF"><form method="post" name="form1" id="form1" onsubmit="return check()">
                        <table width ="85%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" align="left">
                            <tr bgcolor ="#E9E9D8" wdth ="100%">
                                <td height="27" colspan="4" bgcolor="#FEF7E9"><div align="center" class="style4">               
                                        <font color="#006666"> View Profile</font></div></td>
                            </tr>
                            <tr bgcolor ="#E9E9D8" width ="100%">
                                <td width="6%" bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td width="32%"><font size="2" color="black" face ="arial" >Name&nbsp;<font color="blue"> (as in academic                                              records) </font></font></td>
                                <td width="52%"><input type="text" class="fld" name="name" size="30" maxlength="30" readonly value="<%=rs.getString(2)%>" required/></td>
                                <td width="10%" bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Gender</font></td>
                                <td><select name="gender" disabled class="fld" > <%if(rs.getString(3).equals("Male")) { %>    
                                       <option  value="Male" selected>Male </option> 
                                       <option  value="Female">Female</option>
                                    <%}else { %>   
                                       <option  value="Male">Male </option> 
                                       <option  value="Female"  selected>Female</option>
                                    <%}%>  
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Date of Birth&nbsp;</font><font color="blue">(dd/mm/yyyy)</font></td>
                                <td><input type="text" name="dob" class="fld" size="30" maxlength="30" readonly value="<%=rs.getString(4)%>" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Date of Joining&nbsp;</font><font color="blue">(dd/mm/yyyy)</font></td>
                                <td><input type="text" name="doj" class="fld" size="30" maxlength="30" readonly value="<%=rs.getString(5)%>" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial"> Qualification</font></td>
                                <td><select name="qual" class="fld" disabled>
                                       <%
                                          String de = "Btech,Mtech,MCA,BCA,BSC,MSC,BBA,MBA,Ph.D";
                                          String ar1[] = de.split(",");
                                          for(String n : ar1) 
                                          {
                                              if(rs.getString(6).equals(n))
                                                de = String.format("<option value='%s' selected>%s</option>",n,n);
                                              else
                                                de = String.format("<option value='%s'>%s</option>",n,n);
                                              out.println(de);
                                          }
                                        %>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9" wdth ="100%">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Salary</font></td>
                                <td><input type="number" class="fld" name="sal" size="30" maxlength="30" readonly value="<%=rs.getString(7)%>" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                               <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Desgination</font></td>
                                <td><select name="desg" class="fld" disabled>
                                         <%
                                          String stdes = "Dean,DG,HOD,Professor,AssitanceProfessor";
                                          String ardes[] = stdes.split(",");
                                          for(String n : ardes) 
                                          {
                                              if(rs.getString(9).equals(n))
                                                stdes = String.format("<option value='%s' selected>%s</option>",n,n);
                                              else
                                                stdes = String.format("<option value='%s'>%s</option>",n,n);
                                              out.println(stdes);
                                          }
                                        %>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black"  face ="arial">Department</font></td>
                                <td><select name="dept" class="fld" disabled>
                                        <%
                                          String stdep = "IT,MGMT,Law,Education";
                                          String ardep[] = stdep.split(",");
                                          for(String n : ardep) 
                                          {
                                              if(rs.getString(11).equals(n))
                                                stdep = String.format("<option value='%s' selected>%s</option>",n,n);
                                              else
                                                stdep = String.format("<option value='%s'>%s</option>",n,n);
                                              out.println(stdep);
                                          }
                                        %>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr  bgcolor ="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Email_id</font></td>
                                <td><input type="text" name="email" class="fld" size="30" maxlength="30" readonly value="<%=rs.getString(1)%>" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Contact Number</font></td>
                                <td><input type="text" name="contact" class="fld" readonly value="<%=rs.getString(11)%>" required/>
                               </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr  bgcolor ="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font face="Arial, helvetica" color="#000000" size="-1">Address</font></td>
                                <td><input  maxlength="30" class="fld" name="address"  size="40" readonly value="<%=rs.getString(12)%>" required/>
                                <b><font face="ARIAL, HELVETICA" color="red" size="+2"></font></b></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            
                            <% } %>
                            <tr>
                                <td colspan="4" align="center" bgcolor="#FEF7E9" ><br/>
                                  <input type="button" class="btn" onclick="window.location.href='WelcomeFaculty.jsp'" value="Back" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="button" class="btn" onclick="window.location.href='index.jsp'" value="Home" />
                                    <br />                                    <br><br><br><br><br><br><br><br><br><br><br>

                                <br /> </td>
                            </tr>
                        </table>
                </form></td>
            </tr>
        </table>

    </body>
</html>
