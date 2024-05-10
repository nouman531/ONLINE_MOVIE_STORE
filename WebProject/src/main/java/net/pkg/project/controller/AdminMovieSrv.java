package net.pkg.project.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;
import net.pkg.project.model.*;
import net.pkg.project.dao.*;

/**
 * Servlet implementation class AdminMovieSrv
 */
@WebServlet("/add")
public class AdminMovieSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private adminMovieDao amdobj= new adminMovieDao();

       public AdminMovieSrv() {
        super();
    }
       
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { doPost(request,response); }
	 */

	
	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession sess=request.getSession(false); 
		  if(sess==null||sess.getAttribute("admin")==null) 
		  { response.sendRedirect("login.jsp");
		  	return; 
		  } else 
		  { RequestDispatcher rdis=request.getRequestDispatcher("AdminAddMovies.jsp");
		  rdis.forward(request, response); 
		  return;
		  }
		  }
	 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		if(sess==null&& sess.getAttribute("admin")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String name=request.getParameter("name");
		String rating=request.getParameter("rating");
		String dname=request.getParameter("dname");
		String genre=request.getParameter("genre");
		String rdate=request.getParameter("date");
		String reviews=request.getParameter("reviews");
		
		
		adminMoviesBean obj= new adminMoviesBean();
		
		obj.setMoviename(name);
		obj.setMovierating(rating);
		obj.setDirectorName(dname);
		obj.setGenre(genre);
		obj.setReleasedate(rdate);
		obj.setReviews(reviews);
		
		try {
			int result =amdobj.AddMovie(obj);
			
			if(result>0)
			{
				request.setAttribute("NOTIFICATION","Added Up Successfully");
			}
			else if(result==-1)
			{
				request.setAttribute("NOTIFICATION","Movie Name Already Exist!!!!!");
			}
		}catch(ClassNotFoundException ex)
		{
			ex.addSuppressed(ex);
		}
		RequestDispatcher rdis=request.getRequestDispatcher("AdminAddMovies.jsp");
		rdis.forward(request, response);
		return;
		
	}

}
