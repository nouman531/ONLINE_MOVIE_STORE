package net.pkg.project.controller;

import java.io.*;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import net.pkg.project.dao.*;
import net.pkg.project.model.*;
	
@WebServlet("/search")
public class searchByUserSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private searchByUserDao sbudobj= new searchByUserDao();
       
   
    public searchByUserSrv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession(false);
		if(sess==null|| sess.getAttribute("user")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		RequestDispatcher rdis=request.getRequestDispatcher("userMovie.jsp");
		rdis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);
		if(sess==null|| sess.getAttribute("user")==null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String name=request.getParameter("name");
		PrintWriter out=response.getWriter();
		
		searchByUser sbuobj= new searchByUser();
		
		sbuobj.setName(name);
		
		
		try
		{
			ResultSet result=sbudobj.searchMovie(sbuobj);
			if(result.next()) {
//				
				String mname=result.getString("name");
				String rating=result.getString("rating");
				String dname=result.getString("directorname");
				String genre=result.getString("genre");
				String releasedate=result.getString("releasedate");
				String reviews=result.getString("reviews");
				request.setAttribute("name",mname);
				request.setAttribute("rating",rating);
				request.setAttribute("dname",dname);
				request.setAttribute("genre",genre);
				request.setAttribute("rdate",releasedate);
				request.setAttribute("reviews",reviews);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/searchresult.jsp");
			      dispatcher.forward(request, response);
			      return;
			}else {
				request.setAttribute("errormessage","No such Movie exist");
				request.getRequestDispatcher("searchresult.jsp").forward(request, response);
				return;
			}
		
		
	}catch(Exception ex)
		{
		ex.addSuppressed(ex);
	}
		
	}

}
