<div><jsp:include page="Header2.jsp"/></div>
<div>
    <center>

<form action="Suggestion.jsp">
    <br><br><br><br><br><br><br><br><br>
    Year:<input type="text" placeholder="yyyy" name="year" required>
    Month:<select name="month" required>
  
        <option value ="Option">Option</option>
                                        <option value ="January">Jan</option>
                                        <option value ="Feburary">Feb</option>
                                        <option value ="March">March</option>
                                        <option value ="April">April</option>
                                        <option value ="May">May</option>
                                        <option value ="June">June</option>
                                        <option value ="July">July</option>
                                        <option value ="August">Aug</option>
                                        <option value ="September">Sept</option>
                                        <option value ="October">Oct</option>
                                        <option value ="November">Nov</option>
                                        <option value ="December">Dec</option>
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