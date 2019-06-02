import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AddUser extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        String name = req.getParameter("name");
        String gender= req.getParameter("gender");
        String dob= req.getParameter("dob");
        String doj= req.getParameter("doj");
        String qual = req.getParameter("qual");
        String sal1= req.getParameter("sal");
        int sal = Integer.parseInt(sal1);
        String pass= req.getParameter("pass");
        String authority=req.getParameter("authority");
        String desg=req.getParameter("desg");
        String dept=req.getParameter("dept");
        String email= req.getParameter("email").toLowerCase();
        String contact= req.getParameter("contact");
        String address= req.getParameter("address");
        String state= req.getParameter("state");
        System.out.println(dob+",,,,,,"+doj);
        String msg1 = db.Admin.addUser(name,gender,dob,doj,qual,sal, pass,authority,desg,dept, email, contact, address,state); 
        req.setAttribute("msg",msg1);
        HttpSession hs = req.getSession(false);
        String msg = (String) hs.getAttribute("authority");
        if(msg.equals("Dean"))
            {
           req.getRequestDispatcher("WelcomeDean.jsp").forward(req,res);
            }
            else
            if(msg.equals("DirectorGeneral"))
            {
           req.getRequestDispatcher("WelcomeDg.jsp").forward(req,res);
            }
            else
            if(msg.equals("HOD"))
            {
           req.getRequestDispatcher("WelcomeHod.jsp").forward(req,res);
            }
            if(msg.equals("Faculty"))
            {
              req.getRequestDispatcher("WelcomeFaculty.jsp").forward(req,res);
            }
         
   }
}
