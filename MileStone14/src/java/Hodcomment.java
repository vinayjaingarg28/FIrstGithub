import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Hodcomment extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        PrintWriter out=res.getWriter();
        String hod = req.getParameter("hodcomment");
        String uid=req.getParameter("uid");
        res.setContentType("text/html");
        System.out.println(hod);
        int msg = db.Admin.updHod(hod,uid);
        if(msg>0)
        {
             
                 
                   
            out.println(" Your Comment is added successfully");
            req.getRequestDispatcher("WelcomeHod.jsp").include(req,res); 
        }
        else
        {
            out.println("You cannot comment again");
            req.getRequestDispatcher("WelcomeHod.jsp").include(req,res);
        }
         
        
   }
}
