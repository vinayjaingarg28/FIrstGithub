<%@page import="java.sql.ResultSet,java.util.*"%>
<html lang="en">
<head>
<meta charset="utf-8">
<%
    String uid = (String)session.getAttribute("uid");
      if(uid==null)
       response.sendRedirect("Login.jsp?t=1");

int i = db.Admin.checkDate(uid);
if(i>0)
{
    
}
%>
<title>MileStone14-Fill the FortNight</title>
<jsp:include page="Header2.jsp"/>

 <link rel=stylesheet href="Projcss.css" />
  <%
            
            System.out.println("");
            if(uid == null) uid = "";else;
            ResultSet rs = db.Admin.getUser(uid);
            if(rs.next()) {
        %>
       
<style type="text/css">
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    .btn
    {
         position:absolute;
         bottom:5%;
         margin-left:44%;
     }
    table{
        width: 100%;
        margin-bottom: 20px;
        border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".add-row").click(function(){
            var sub = $("#sub").val();
            var cls = $("#cls").val();
            var topic = $("#topic").val();
            var period = $("#period").val();
            var avg = $("#avg").val();
            if(sub == "")
            {
                alert("\n\nPlz enter the Subject.......!");
                return false;
            }
            if(cls == "")
            {
                alert("\n\nPlz enter the Semester .......!");
                return false;
            }
             
            if(topic == "")
            {
                alert("\n\nPlz enter the Topic.......!");
                return false;
            }if(period == "")
            {
                alert("\n\nPlz enter the No. of Period Taken.......!");
                return false;
            }
            if(avg == "")
            {
                alert("\n\nPlz enter the Average Attendance.......!");
                return false;
            }
            
            var markup = "<tr><td><input type='checkbox' name='record'></td><td><input type=hidden name=cls value='"+cls+"'>" + cls + "</td><td><input type=hidden name=sub value='"+sub+"'>" + sub + "</td><td><input type=hidden name=topic value='"+topic+"'>" + topic + "</td><td><input type=hidden name=period value='"+period+"'>" + period + "</td><td><input type=hidden name=avg value='"+avg+"'>" + avg + "</td></tr>";
            $("table tbody").append(markup);
            with(document.forms[0])
            {
                elements[3].value="";
                elements[4].value="";
                elements[5].value="";
                elements[6].value="";
                elements[7].value="";
                
            }
            
        });
        
        // Find and remove selected table rows
        $(".delete-row").click(function(){
            $("table tbody").find('input[name="record"]').each(function(){
                if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });  
    function myFunction()
    {
        document.getElementById('demo').value=Date();
    }
     
            function Warn()
            
            {
               if (confirm('Are you sure you want to save this thing into the database?')==1) 
                 return true;
               else 
                 return false;
           }
</script>
</head>
<body onload="myFunction()">
    
          
    
  
    <div style="background-color: #DCDBB6;">
        <br><br>
        <form action="FortNight" method="post" onsubmit="return Warn()">
        <center>
      Name<input type="text" class="fld" readonly value="<%=rs.getString(2)%>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      Department<select name="dept" class="fld" disabled>
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
                                </select>  
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      Date<input style="margin-right: 0px;" type="text" class="" id="demo" size="11" >
  
      <br><br><br><hr>
     
      Semester & Section &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Subject &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Topics Covered &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  No. of Periods &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Average Attendance<br>
      
      <input type="text" id="cls" class="fld"  placeholder="Semester & Section"   >
      <input type="text" id="sub" class="fld"  placeholder="Subject"  >
      <input type="text" id="topic"  class="fld"  placeholder="Topics Covered" >
      <input type="number" id="period" class="fld"  placeholder="No. of periods" min="0"  >
      <input type="number" id="avg" class="fld"  placeholder="Average Attendance" min="0"  >
      <br><hr>
      <input type="button" class="add-row" value="Add Row">
      <br>
        
    </center>
    <table>
        <thead>
            <tr>
                <th>Select</th>
                <th>Semester</th>
                <th>Subject </th>
                <th>Topics Covered</th>
                <th>No. of period</th>
                <th>Average Attendance</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                

            </tr>
        </tbody>
    </table>
    <button type="button" class="delete-row">Delete Row</button>
    <!--<button style="" type="button" class="btn" onclick="window.location.href='FortNight-2.jsp'">Next</button> <br>-->     
    <!-- <button type="button" class="btn">Back</button> -->   
    <input type="submit" VALUE="Next" > 
                                        
             <% } %>
    </form>
    </div>
</body> 
</html>                       
     