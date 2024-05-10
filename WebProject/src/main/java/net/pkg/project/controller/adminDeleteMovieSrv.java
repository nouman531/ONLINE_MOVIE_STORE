package net.pkg.project.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import net.pkg.project.dao.*;
import net.pkg.project.model.*;


/**
 * Servlet implementation class adminDeleteMovieSrv
 */
@WebServlet("/delete")
public class adminDeleteMovieSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	private adminDeleteDao addobj=new adminDeleteDao();
   
    public adminDeleteMovieSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		if(sess==null|| sess.getAttribute("admin")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		RequestDispatcher rdis=request.getRequestDispatcher("AdminDeleteMovies.jsp");
		rdis.forward(request, response);
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		if(sess==null|| sess.getAttribute("admin")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String name=request.getParameter("name");
		String dname=request.getParameter("dname");
		
		adminDeleteMovie admobj= new adminDeleteMovie();
		
		admobj.setMoviename(name);
		admobj.setDirectorName(dname);
		
		try
		{
			int result=addobj.deleteMovie(admobj);
			
			if(result>0)
			{
				request.setAttribute("NOTIFICATION","Deleted Successfully");
			}
			else
			{
				request.setAttribute("NOTIFICATION","Movie does not exist!!!");
			}
		}catch(Exception ex)
		{
			ex.addSuppressed(ex);
		}
		RequestDispatcher rdis=request.getRequestDispatcher("AdminDeleteMovies.jsp");
		rdis.forward(request, response);
		return;
	}

}
