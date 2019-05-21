<html>
    <head>
        <meta>
        <title>www.MileStone14.com</title>
     <link rel=stylesheet href="Projcss.css" />  
   
                <jsp:include page="Header.jsp"/>
    </head>
    <body style="margin:0px" >
        <table width="100%" border="1" >
           
            <tr>
                <td width="1" valign="top" height="60%"><jsp:include page="menu.jsp"/></td>
                  <%
        String uid = (String)session.getAttribute("uid");
           if(uid==null)
           {
       response.sendRedirect("Login.jsp?t=1");
           }
           else
           {
        String authority = (String)session.getAttribute("authority");
         if(!(authority.equals("Dean") || authority.equals("HOD")) )
         {
            response.sendRedirect("Login.jsp?t=0");
         }
        if(authority==null) uid = authority = "";
           }
    %>
                <td width="750"  bgcolor="#FFFFFF">
                    <form action="AddUser" method="post" name="form1" id="form1" onsubmit="return check()">
                        <table width ="85%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" align="left">
                             <tr bgcolor ="#E9E9D8" wdth ="100%">
                                <td height="27" colspan="4" bgcolor="#FEF7E9"><div align="center" class="style4">               
                                        <font color="#006666"> Registration</font></div></td>
                            </tr>
                            <tr bgcolor ="#E9E9D8" width ="100%">
                                <td width="6%" bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td width="32%"><font size="2" color="black" face ="arial" >Name&nbsp;<font color="blue"> (as in academic                                              records) </font></font></td>
                                <td width="52%"><input type="text" name="name" size="30" maxlength="30" value='' required /></td>
                                <td width="10%" bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Gender</font></td>
                                <td>
                                    <select required aria-required="true" name="gender" >
                                        <option >--Select--</option>
                                        <option  value="Male">Male</option>
                                        <option  value="Female" >Female </option>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Date of Birth&nbsp;</font><font color="blue">(dd/mm/yyyy)</font></td>
                                <td><input type="text" name="dob"  pattern="[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}" size="30" maxlength="30" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial" >Date of Joining&nbsp;</font><font color="blue">(dd/mm/yyyy)</font></td>
                                <td><input type="text" name="doj"  pattern="[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}" size="30" maxlength="30" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial"> Qualification</font></td>
                                <td><select name="qual" required>
                                        <option value ="Btech">BTech</option>
                                        <option value ="Mtech">MTech</option>
                                        <option value ="MCA">MCA</option>
                                        <option value ="BCA">BCA</option>
                                        <option value ="BSC">BSC</option>
                                        <option value ="MSC">MSc</option>
                                        <option value ="BBA">BBA</option>
                                        <option value ="MBA">MBA</option>
                                        <option value ="Ph.D">Ph.D</option>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor ="#FEF7E9" wdth ="100%">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Salary</font></td>
                                <td><input type="number" name="sal" size="30" maxlength="30" min="0" required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                
                
                            <tr bgcolor ="#FEF7E9" wdth ="100%">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Password</font></td>
                                <td><input type="password" name="pass" size="30" maxlength="30" value='' required /></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Authority</font></td>
                                <td><select name="authority" required>
                                        <option value ="Dean">Dean</option>
                                        <option value ="DirectorGeneral">DG</option>
                                        <option value ="HOD">HOD</option>
                                        <option value ="Faculty">Faculty</option>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                             <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Desgination</font></td>
                                <td><select name="desg" required>
                                        <option value ="Dean">Dean</option>
                                        <option value ="DG">Director</option>
                                        <option value ="HOD">HOD</option>
                                        <option value ="Professor">Professor</option>
                                         <option value ="AssitanceProfessor">Assistance Professor</option>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Department</font></td>
                                <td><select name="dept" required>
                                        <option value ="IT">IT</option>
                                        <option value ="MGMT">Management</option>
                                        <option value ="Law">Law</option>
                                        <option value ="Education">Education</option>
                                </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr  bgcolor ="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Email_id</font></td>
                                <td><input type="text" name="email" size="30" maxlength="30" value='' required/></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font size="2" color="black" face ="arial">Contact Number</font><font color="blue">Must be digits(10)</font></td>
                                <td><input type="text" name="contact" pattern="[0-9]{10}" value="" min="0" maxlength="10" required/>
                               </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr  bgcolor ="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font face="Arial, helvetica" color="#000000" size="-1">Address</font></td>
                                <td><input class="USS_TEXT" maxlength="30" name="address" size="40" value='' required/>
                                <b><font face="ARIAL, HELVETICA" color="red" size="+2"></font></b></td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            <tr bgcolor="#E9E9D8">
                                <td bgcolor="#FEF7E9"><span class="style5"></span></td>
                                <td><font face="Arial, helvetica" color="#000000" size="-1">State</font></td>
                                <td><select name="state" required  >
                                        <option selected="selected" value="">Select State</option>
                                          <%
                                          String st = "Andaman And Nicobar,Andhra Pradesh,Arunachal Pradesh,Assam,Bihar,Chandigarh,Chhattisgarh,Dadar And Nagar Haveli,Daman and Diu,Delhi,Goa,Gujarat,Haryana,Himachal Pradesh,Jammu and Kashmir,Jharkhand,Karnataka,Kerala,Lakshadweep,Madhya Pradesh,Maharashtra,Manipur,Meghalaya,Mizoram,Nagaland,Orissa,Puducherry,Punjab,Rajasthan,Sikkim,Tamil Nadu,Telangana,Tripura,Uttar Pradesh,Uttarakhand,West Bengal";
                                          String ar[] = st.split(",");
                                          for(String n : ar) 
                                          {
                                               st = String.format("<option value='%s'>%s</option>",n,n);
                                              out.println(st);
                                          }
                                          %>
                                                 </select>              </td>
                                <td bgcolor="#FEF7E9">&nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td colspan="4" align="center" bgcolor="#FEF7E9" ><br/>
                                   <!-- <input type="button" onclick="window.location.href='WelcomeHod.jsp'" value="Back" /> -->
                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="submit" value="Submit" />
                                    <br />
                                    <br><br><br><br><br><br><br><br><br><br><br>
                                <br /> </td>
                            </tr>
                        </table>
                </form></td>
            </tr>
        </table>

    </body>
</html>
