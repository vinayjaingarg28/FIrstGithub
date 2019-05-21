import db.Admin;
import code.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class FortNight extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        HttpSession hs = req.getSession(false);
        String cls[] = req.getParameterValues("cls");
        String sub[] = req.getParameterValues("sub");
        String topic[] = req.getParameterValues("topic");
        String period[] = req.getParameterValues("period");
        String avg[] = req.getParameterValues("avg");
        PrintWriter out = res.getWriter();
        String clsdata="",subdata="",topicdata="",perioddata="",avgdata="";
        ArrayList<FormTable> list = new ArrayList<>();
        for(int i=0; i<cls.length; i++)
                {
            FormTable ft = new FormTable();
          ft.setSemester(cls[i]);
          ft.setSubject(sub[i]);
          ft.setTopic(topic[i]);
          perioddata=period[i];
          int per=Integer.parseInt(perioddata);
          ft.setPeriod(per);
          int avg1=Integer.parseInt(avg[i]);
          ft.setAverage(avg1);
        list.add(ft);
        }
        
           hs.setAttribute("list", list);
        req.getRequestDispatcher("FortNight-2.jsp").forward(req, res);
        
   }
}
