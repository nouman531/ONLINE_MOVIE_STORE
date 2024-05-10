package net.pkg.project.controller;

import java.io.*;

import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import net.pkg.project.dao.*;
import net.pkg.project.model.*;

@WebServlet("/login")
public class loginSrvCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	private loginDao userlogindaoobj= new loginDao();
	private adminlogin adminlogindaoobj= new adminlogin();
	
    public loginSrvCtrl() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rdis=request.getRequestDispatcher("login.jsp");
		rdis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loginBean userbeanobj= new loginBean();
		adminloginBean adminbeanobj=new adminloginBean();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		
		
		if(email==""&& password=="")
		{
			request.setAttribute("errormessage","Please Enter email and password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(email=="")
		{
			request.setAttribute("errormessage","Please Enter email");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else if(password=="")
		{
			request.setAttribute("errormessage","Please Enter Password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		userbeanobj.setEmail(email);
		userbeanobj.setPassword(password);
		adminbeanobj.setEmail(email);
		adminbeanobj.setPassword(password);
	
		
		HttpSession sess=request.getSession();
		
		try {
			
			if(userlogindaoobj.loginUser(userbeanobj))
			{
				sess.setAttribute("user", email);
				
				response.sendRedirect("userMovie.jsp");
				return;
				
			}
			if(adminlogindaoobj.loginAdmin(adminbeanobj))
			{
				sess.setAttribute("admin", email);
				
				
				response.sendRedirect("Admin.jsp");
				return;
				
			}
			
			request.setAttribute("errormessage","Invalid Email or Password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		
	}

}
