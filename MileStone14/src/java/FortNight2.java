
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FortNight2 extends HttpServlet {

    @Override
    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession hs = req.getSession(false);
        String impattend = req.getParameter("impattend").trim();
        String innovation = req.getParameter("innovation").trim();
        String curricular = req.getParameter("curricular").trim();
        String responsibility = req.getParameter("responsibility").trim();
        String contadmission = req.getParameter("contadmission").trim();
        String contplacement = req.getParameter("contplacement").trim();
        String suggestion = req.getParameter("suggestion").trim();
        String email = (String)hs.getAttribute("uid");
        ArrayList list  = (ArrayList)hs.getAttribute("list");
        String auth = (String)hs.getAttribute("authority");
        if(impattend==null || impattend=="")
            impattend="NA";
         if(innovation==null || innovation=="")
            innovation="NA";
         if(curricular==null || curricular=="")
            curricular="NA";
         if(responsibility==null || responsibility=="")
            responsibility="NA";
         if(contadmission==null || contadmission=="")
            contadmission="NA";
         if(contplacement==null || contplacement=="")
            contplacement="NA";
         if(suggestion==null || suggestion=="")
            suggestion="NA";
      String msg=db.Admin.addForm2(auth,list,email, impattend,innovation,curricular,responsibility,contadmission,contplacement,suggestion );
        PrintWriter out = resp.getWriter();
    
    if(auth.equalsIgnoreCase("hod"))
    {
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Sucessfully filled your fortnight report');");
    out.println("location='WelcomeHod.jsp';");
    out.println("</script>");
    }
    else
    {
        
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Sucessfully filled your fortnight report');");
    out.println("location='WelcomeFaculty.jsp';");
    out.println("</script>");
    }
    }
}