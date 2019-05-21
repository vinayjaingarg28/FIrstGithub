import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignInAction extends HttpServlet {

    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        String userid = req.getParameter("userid");
        String pass= req.getParameter("pass");
       System.out.print(userid);
        String msg = db.Admin.checkId(userid,pass);
        if(msg.startsWith("Sorry")) 
        {
          req.setAttribute("msg",msg); 
          req.getRequestDispatcher("Login.jsp").forward(req,res); 
        }
        else
        {
               HttpSession ses = req.getSession(true);
           ses.setAttribute("uid",userid);
           ses.setAttribute("authority",msg);
         
            if(msg.equals("Dean"))
            {
           res.sendRedirect("WelcomeDean.jsp");
            }
            else
            if(msg.equals("DirectorGeneral"))
            {
           res.sendRedirect("WelcomeDg.jsp");
            }
            else
            if(msg.equals("HOD"))
            {
           res.sendRedirect("WelcomeHod.jsp");
            }
            if(msg.equals("Faculty"))
            {
              res.sendRedirect("WelcomeFaculty.jsp");  
            }
        }
            
   }
}




