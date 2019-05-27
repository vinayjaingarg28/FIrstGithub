<div><jsp:include page="Header2.jsp"/></div>
<div>
    <center>

<form action="Suggestion.jsp">
    <br><br><br><br><br><br><br><br><br>
    Year:<input type="text" placeholder="yyyy" name="year" required>
    Month:<select name="month" required>
  
        <option value ="Option">Option</option>
                                        <option value ="01">Jan</option>
                                        <option value ="02">Feb</option>
                                        <option value ="03">March</option>
                                        <option value ="04">April</option>
                                        <option value ="05">May</option>
                                        <option value ="06">June</option>
                                        <option value ="07">July</option>
                                        <option value ="08">Aug</option>
                                        <option value ="09">Sept</option>
                                        <option value ="10">Oct</option>
                                        <option value ="11">Nov</option>
                                        <option value ="12">Dec</option>
                                </select>
    &nbsp;&nbsp;&nbsp;&nbsp;Half of Month:
    <select name="half" required>
  
        <option value ="Option">Option</option>
        <option value ="1">1st Half</option>
                                        <option value ="2">2nd Half</option>
    </select>
    <input type="submit" value="Get Report">
</form>
    </center>
    </div>