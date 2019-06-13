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
        String name = req.getParameter("name").trim();
        String gender= req.getParameter("gender").trim();
        String dob= req.getParameter("dob").trim();
        String doj= req.getParameter("doj").trim();
        String qual = req.getParameter("qual").trim();
        String sal1= req.getParameter("sal").trim();
        int sal = Integer.parseInt(sal1);
        String pass= req.getParameter("pass").trim();
        String authority=req.getParameter("authority").trim();
        String desg=req.getParameter("desg").trim();
        String dept=req.getParameter("dept").trim();
        String email= req.getParameter("email").toLowerCase().trim();
        String contact= req.getParameter("contact").trim();
        String address= req.getParameter("address").trim();
        String state= req.getParameter("state").trim();
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
