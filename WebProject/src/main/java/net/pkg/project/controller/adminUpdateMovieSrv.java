package net.pkg.project.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.pkg.project.model.*;
import net.pkg.project.dao.*;

/**
 * Servlet implementation class AdminMovieSrv
 */
@WebServlet("/update")
public class adminUpdateMovieSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private adminUpdateMovieDao aumdobj= new adminUpdateMovieDao();

       public adminUpdateMovieSrv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		if(sess==null|| sess.getAttribute("admin")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		RequestDispatcher rdis=request.getRequestDispatcher("AdminUpdateMovies.jsp");
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
		String rating=request.getParameter("rating");
		String dname=request.getParameter("dname");
		String genre=request.getParameter("genre");
		String rdate=request.getParameter("date");
		
		
		
		adminUpdateMovieBean aumbobj= new adminUpdateMovieBean();
		aumbobj.setMoviename(name);
		aumbobj.setMovierating(rating);
		aumbobj.setDirectorName(dname);
		aumbobj.setGenre(genre);
		aumbobj.setReleasedate(rdate);
		
		try {
			int result =aumdobj.updateMovie(aumbobj);
			
			if(result>0)
			{
				request.setAttribute("NOTIFICATION","Updated Successfully");
			}
			else 
			{
				request.setAttribute("NOTIFICATION","Movie does not exist!!! ");
			}
		}catch(ClassNotFoundException ex)
		{
			ex.addSuppressed(ex);
		}
		RequestDispatcher rdis=request.getRequestDispatcher("AdminUpdateMovies.jsp");
		rdis.forward(request, response);
		return;
		
	}

}
