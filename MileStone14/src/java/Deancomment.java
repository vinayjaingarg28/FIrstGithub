import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Deancomment extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter out=res.getWriter();
        String hod = req.getParameter("deancomment");
        String uid=req.getParameter("uid");
        res.setContentType("text/html");
        System.out.println(hod);
        int msg = db.Admin.updDean(hod,uid);
        if(msg>0)
        {
             
                 
                   
            out.println("<red>Your Comment is added successfully</red>");
            req.getRequestDispatcher("WelcomeDean.jsp").include(req,res); 
        }
        else
        {
            out.println("<body style='color:red;' >You cannot comment again</label>");
            req.getRequestDispatcher("WelcomeDean.jsp").include(req,res);
        }
         
        
   }
}
