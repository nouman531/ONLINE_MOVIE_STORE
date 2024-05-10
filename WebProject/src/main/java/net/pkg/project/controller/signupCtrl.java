package net.pkg.project.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import net.pkg.project.dao.*;
import net.pkg.project.model.*;
import javax.servlet.annotation.WebServlet;
import java.util.regex.*;



@WebServlet("/signup")
public class signupCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private signupDao userdaoobj= new signupDao();  
	
    public signupCtrl() {
     
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher rdis=request.getRequestDispatcher("signupJsp.jsp");
		rdis.forward(request, response);
    
    }
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		signupBean beanobj= new signupBean();	
			
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirm_password=request.getParameter("confirm_pass");
		
		
		boolean status = false;
		adminloginBean adminbeanobj= new adminloginBean();
		adminbeanobj.setEmail(email);
		
		
	    
	    adminbeanobj.getEmail();
	    
		try
		{
			ResultSet rs=userdaoobj.check(adminbeanobj);
			status=rs.next();
			
				
		}catch(Exception ex)
		{
			response.getWriter().println(ex);
		}
	    String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$"; 
	    Pattern pattern = Pattern.compile(regex);  
	    Matcher matcher = pattern.matcher(email);  
		
	    
		int a=password.indexOf(' ');
		int b=confirm_password.indexOf(' ');
		
		if(a!=-1 ||b!=-1)
		{
			String msg="Spaces are not Allowed !";
			
			response.sendRedirect("signupJsp.jsp?id="+msg);
			return;
		}
		else if(status)
		{
			String msg="Cannot sign up with this email!";
			
			response.sendRedirect("signupJsp.jsp?id="+msg);
			return;
		}
		
	    else if(email==""&& password=="")
		{
			request.setAttribute("errormessage","Please Enter email and password");
			request.getRequestDispatcher("signupJsp.jsp").forward(request, response);
			return;
			
		}
		else if(email=="")
		{
			request.setAttribute("errormessage","Please Enter email");
			request.getRequestDispatcher("signupJsp.jsp").forward(request, response);
			return;
			
		}
		else if(!matcher.matches())
		{
			request.setAttribute("errormessage","Please Enter valid email Format");
			request.getRequestDispatcher("signupJsp.jsp").forward(request, response);
			return;
			
		}
		
		
		else if(password=="")
		{
			request.setAttribute("errormessage","Please Enter Password");
			request.getRequestDispatcher("signupJsp.jsp").forward(request, response);
			return;
			
		}
		else if(!(password.equals(confirm_password)))
		{
			request.setAttribute("errormessage","Password and confirm password doesnot match");
			request.getRequestDispatcher("signupJsp.jsp").forward(request, response);
			return;
			
		}
					

		beanobj.setEmail(email);
		beanobj.setPassword(password);
		beanobj.setConfirm_password(confirm_password);
		
		adminbeanobj.setEmail(email);
		
		
		try {
			int result =userdaoobj.sinupUser(beanobj);
			
			if(result>0)
			{
				request.setAttribute("NOTIFICATION","SignedUp Successfully");
				
			}
			else if(result==-1)
			{
				request.setAttribute("NOTIFICATION","User Email Already exist!!!!!!");
				
				
			}
			
			
				
		}catch(ClassNotFoundException ex)
		{
			ex.addSuppressed(ex);
		}
		RequestDispatcher rdis=request.getRequestDispatcher("signupJsp.jsp");
		rdis.forward(request, response);
		return;
	}

}
