<div><jsp:include page=
             "Header2.jsp"/></div>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="code.Form2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<style>body{background: #fafafa;}</style>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String half = request.getParameter("half");
int day1=0;
if(half.equalsIgnoreCase("1"))
    day1=1;
else{
    day1=16;
}
String date = String.format("%s-%s-%d", year, month, day1);
String date2 = String.format("%s-%s-%d", year, month,day1+14 );

ArrayList dlist = new ArrayList();
ArrayList list = db.Admin.getSuggestionList(date, date2);
if(!(list.isEmpty()))
{
    %>
    <center>
        <br><br>
<table border="1">
    <tr><th>Name</th><th>Suggestion</th><th>HOD comment</th><th>DG comment</th><th>Dean comment</th><th>Signature</th></tr>
<%
    for(Object o:list)
{
    Form2 f = (Form2) o;
    dlist.add(f.getEmail());
}
ArrayList list2 = db.Admin.getNamesByEmail(dlist);
for(int i=0; i<list.size(); i++)
{
    Form2 f = (Form2) list.get(i);
    String name = (String) list2.get(i);
    %>
    <tr><td><%=name%></td><td><%=f.getSuggestion()%></td><td><%=f.getHodcomment()%></td><td><%=f.getDgcomment()%></td><td><%=f.getDeancomment()%></td><td></td></tr>
<%
}
}
else
{
  out.println("No data found!");
}
%>
</table>
</center>