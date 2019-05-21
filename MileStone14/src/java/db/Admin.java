package db;
import code.Form2;
import code.FormTable;
import com.sun.xml.internal.bind.v2.schemagen.Util;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Admin
{
   // for oracle
    private static Connection connect() throws Exception
    {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
    }
    
    public  static String addForm2(String authority,ArrayList list,String email,String impattend,String innovation,String curricular,String responsibilty,String contadmission,String contplacement,String suggestion )
    {
        String msg=null;
        int reportid=-1;
        int fieldno =-1;
        int status=1;
        try{
            Statement s = connect().createStatement();
            String datecheck = String.format("select * from form2 where emailid='%s' and dor>sysdate-12",email);
            ResultSet rs = s.executeQuery(datecheck);
            if(!rs.next())
            {
                rs = s.executeQuery("Select max(reportid) from form2");
            if(rs.next())
            {
                reportid = rs.getInt(1);
                reportid++;
            }
            if(authority.equalsIgnoreCase("hod"))
                status=2;
            String str = String.format("insert into form2 values('%d','%s',%d,sysdate,'%s','%s','%s','%s','%s','%s','%s','NA','NA','NA')",reportid,email,status,impattend,innovation,curricular,responsibilty,contadmission,contplacement,suggestion);
            int x = s.executeUpdate(str);
            if(x>0)
            {
                for(Object o: list)
                {
                    FormTable ft = (FormTable) o;
                    rs = s.executeQuery("Select max(fieldno) from form1");
                    if(rs.next())
                    {
                        fieldno = rs.getInt(1);
                    }
                    fieldno++;
                    System.out.println(fieldno);
                    String sql = String.format("insert into form1 values(%d,%d,'%s','%s','%s',%d,%d)", fieldno,reportid,ft.getSubject(),ft.getSemester(),ft.getTopic(),ft.getPeriod(),ft.getAverage());
                    int y = s.executeUpdate(sql);
               //     System.out.println(sql);
                    if(x<1)break;
                }
            }
            }
            else
            {
                msg="you have already filled your Fortnight report";
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return msg;
    }
    
    public static int updHod(String hod, String uid)
    {
        int x=0;
         try {  
        Statement s = connect().createStatement();
        String str = String.format("update form2 set hod='%s',status=2 where( emailid ='%s' and dor> sysdate-12 and status=1) ",hod,uid);
         x = s.executeUpdate(str);
         }
         catch(Exception ex)
         {
             System.out.println(""+ ex);
         }
         return x;
    }
    
      public static int updDg(String hod, String uid)
    {
        int x=0;
         try {  
        Statement s = connect().createStatement();
        String str = String.format("update form2 set dg='%s',status=3 where( emailid ='%s' and dor> sysdate-12 and status=2) ",hod,uid);
         x = s.executeUpdate(str);
         }
         catch(Exception ex)
         {
             System.out.println(""+ ex);
         }
         return x;
    }
    
        public static int updDean(String hod, String uid)
    {
        int x=0;
         try {  
        Statement s = connect().createStatement();
        String str = String.format("update form2 set dean='%s',status=4 where( emailid ='%s' and dor> sysdate-12 and status=3) ",hod,uid);
         x = s.executeUpdate(str);
         }
         catch(Exception ex)
         {
             System.out.println(""+ ex);
         }
         return x;
    }
        
    public static String addUser(String name,String gender,String dob,String doj,String qual,int sal,String pass,String authority,String desg,String dept,String email,String contact,String address,String state)
    {
      try {  
        Statement s = connect().createStatement();
        String str = String.format("insert into fortRegistration values('%s','%s','%s','%s','%s','%s',%d,'%s','%s','%s','%s' ,'+91-%s','%s','%s')",email,name,gender,dob,doj,qual,sal,pass,authority,desg,dept,contact,address,state);
        int x = s.executeUpdate(str);
        if(x==1) // if record inserted
        {
           str = String.format("insert into fortLogin values('%s','%s','%s')",email,pass,authority);
            System.out.println(str);
           int y = s.executeUpdate(str);
           if(y==0)
           {
               str = String.format("delete from fortRegistration where email='%s'",email);
               s.executeUpdate(str);
           }
           return "User Successfully Registered, U can Login now....";
        }
        else
           return "Sorry User Id already in used, try another userId..";
      }
      catch(Exception ex )
      { 
          System.out.println(ex);
          return "Sorry User Id already in used, try another userId.." ;
          
      }
      
     }

    public static int checkDate(String emailid)
    {
        int i=0;
        try 
        {  
            Statement s = connect().createStatement();
            String str = String.format("select * from form2 where emailid='%s' and dor>sysdate-12",emailid);
            ResultSet rs = s.executeQuery(str);
            if(rs.next())
            {
                i++;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return i;
    }
    
     public static String checkId(String email,String pass)
     {
      
       try {  
             
        Statement s = connect().createStatement();
        String str = String.format("select authority from fortlogin where email='%s' and pass='%s'",email,pass);
           System.out.println(str);
        ResultSet rs = s.executeQuery(str);
      
        if(rs.next())
        {
             System.out.println(rs.getString(1));
        // if user exist
           return rs.getString(1);
        
        }
           else
          return "Sorry this is Invalid Login Id & Password, re-enter Plz..";
      }catch(Exception e) { 
           System.out.println(e);
          return "Sorry " ; }
     }
    
     public static ResultSet getUser(String uid) throws Exception
     {
         return connect().createStatement().executeQuery("select email,name,gender,to_char(dob,'dd-Mon-YYYY') dob,to_char(doj,'dd-Mon-YYYY') doj,qual,sal,authority,desg,dept,contact,address,state from fortregistration where email='"+uid+"'");
                                                                                        
     }
     
     public static ArrayList getFormList(String authority)
     {
         ArrayList list = new ArrayList();
         Form2 f = null;
         int status=-1;
         try
         {
             Statement s = connect().createStatement();
             if(authority.equalsIgnoreCase("HOD"))
                 status=1;
             else
             if(authority.equalsIgnoreCase("directorgeneral"))
                 status=2;
             else
             if(authority.equalsIgnoreCase("dean"))
                 status=3;
             String sql = String.format("select * from form2 where (dor > sysdate-12 and status=%d)",status);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = new Form2();
                 f.setReportid(rs.getInt(1));
                 f.setEmail(rs.getString(2));
                 f.setStatus(rs.getInt(3));
                 f.setDor(rs.getDate(4));
                 f.setImpattend(rs.getString(5));
                 f.setInnovation(rs.getString(6));
                 f.setCurricular(rs.getString(7));
                 f.setResponsibilty(rs.getString(7));
                 f.setContadmission(rs.getString(9));
                 f.setContplacement(rs.getString(10));
                 f.setSuggestion(rs.getString(11));
                 f.setHodcomment(rs.getString(12));
                 f.setDgcomment(rs.getString(13));
                 f.setDeancomment(rs.getString(14));
                 list.add(f);
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return list;
     }
     
     public static ArrayList getCompleteFormList()
     {
         ArrayList list = new ArrayList();
         Form2 f = null;
         try
         {
             Statement s = connect().createStatement();
             String sql = String.format("select * from form2 where (dor > sysdate-12 and status=4)");
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = new Form2();
                 f.setReportid(rs.getInt(1));
                 f.setEmail(rs.getString(2));
                 f.setStatus(rs.getInt(3));
                 f.setDor(rs.getDate(4));
                 f.setImpattend(rs.getString(5));
                 f.setInnovation(rs.getString(6));
                 f.setCurricular(rs.getString(7));
                 f.setResponsibilty(rs.getString(7));
                 f.setContadmission(rs.getString(9));
                 f.setContplacement(rs.getString(10));
                 f.setSuggestion(rs.getString(11));
                 f.setHodcomment(rs.getString(12));
                 f.setDgcomment(rs.getString(13));
                 f.setDeancomment(rs.getString(14));
                 list.add(f);
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return list;
     }
     
     
     public static Form2 getFormListById(int id)
     {
         Form2 f = null;
         try
         {
             Statement s = connect().createStatement();
             String sql = String.format("select * from form2 where reportid=%d",id);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = new Form2();
                 f.setReportid(rs.getInt(1));
                 f.setEmail(rs.getString(2));
                 f.setStatus(rs.getInt(3));
                 f.setDor(rs.getDate(4));
                 f.setImpattend(rs.getString(5));
                 f.setInnovation(rs.getString(6));
                 f.setCurricular(rs.getString(7));
                 f.setResponsibilty(rs.getString(7));
                 f.setContadmission(rs.getString(9));
                 f.setContplacement(rs.getString(10));
                 f.setSuggestion(rs.getString(11));
                 f.setHodcomment(rs.getString(12));
                 f.setDgcomment(rs.getString(13));
                 f.setDeancomment(rs.getString(14));
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return f;
     }
     
      public static Form2 getFormListByEmail(String emailid)
     {
         Form2 f = null;
         try
         {
             Statement s = connect().createStatement();
             String sql = String.format("select * from form2 where emailid='%s' ",emailid);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = new Form2();
                 f.setReportid(rs.getInt(1));
                 f.setEmail(rs.getString(2));
                 f.setStatus(rs.getInt(3));
                 f.setDor(rs.getDate(4));
                 f.setImpattend(rs.getString(5));
                 f.setInnovation(rs.getString(6));
                 f.setCurricular(rs.getString(7));
                 f.setResponsibilty(rs.getString(7));
                 f.setContadmission(rs.getString(9));
                 f.setContplacement(rs.getString(10));
                 f.setSuggestion(rs.getString(11));
                 f.setHodcomment(rs.getString(12));
                 f.setDgcomment(rs.getString(13));
                 f.setDeancomment(rs.getString(14));
                 System.out.println(f.getReportid());
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return f;
     }
     
     public static ArrayList getForm1(int reportid)
     {
         ArrayList list = new ArrayList();
         FormTable ft = null;
         try
         {
             Statement s = connect().createStatement();
             String sql = String.format("select * from form1 where reportid=%d", reportid);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 ft = new FormTable();
                 ft.setFieldno(rs.getInt(1));
                 ft.setReportid(rs.getInt(2));
                 ft.setSubject(rs.getString(3));
                 ft.setSemester(rs.getString(4));
                 ft.setTopic(rs.getString(5));
                 ft.setPeriod(rs.getInt(6));
                 ft.setAverage(rs.getInt(7));
                 list.add(ft);
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return list;
     }
     public static ArrayList getSuggestionList(String start, String end)
     {
         ArrayList list = new ArrayList();
         Form2 f = null;
         try
         {
             System.out.println(start);
             
             System.out.println(end);
             Statement s = connect().createStatement();
             String sql = String.format("select * from form2 where dor between '%s' and '%s'", start,end);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = new Form2();
                 f.setReportid(rs.getInt(1));
                 f.setEmail(rs.getString(2));
                 f.setStatus(rs.getInt(3));
                 f.setDor(rs.getDate(4));
                 f.setImpattend(rs.getString(5));
                 f.setInnovation(rs.getString(6));
                 f.setCurricular(rs.getString(7));
                 f.setResponsibilty(rs.getString(7));
                 f.setContadmission(rs.getString(9));
                 f.setContplacement(rs.getString(10));
                 f.setSuggestion(rs.getString(11));
                 f.setHodcomment(rs.getString(12));
                 f.setDgcomment(rs.getString(13));
                 f.setDeancomment(rs.getString(14));
                 list.add(f);
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         
         return list;
     }
     
     public static ArrayList getNamesByEmail(ArrayList emaillist)
     {
         ArrayList list = new ArrayList();
         String f = null;
         try
         {
             Statement s = connect().createStatement();
             for(Object email : emaillist)
             {
             String emailid = (String) email;
             String sql = String.format("select name from fortregistration where email='%s'",emailid);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = rs.getString(1);
                 list.add(f);
             }
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return list;
     }
     
     public static String getNameByEmail(String emaillist)
     {
         ArrayList list = new ArrayList();
         String f = null;
         try
         {
             Statement s = connect().createStatement();
             {
             String sql = String.format("select name from fortregistration where email='%s'",emaillist);
             ResultSet rs = s.executeQuery(sql);
             while(rs.next())
             {
                 f = rs.getString(1);
               
             }
             }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
         return f;
     }
}

// 