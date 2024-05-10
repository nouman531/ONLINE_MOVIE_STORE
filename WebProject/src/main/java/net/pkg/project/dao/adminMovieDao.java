package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;
public class adminMovieDao {
	
public int AddMovie(adminMoviesBean obj)throws ClassNotFoundException
	
	{
	String query="INSERT INTO moviedb "+"(name,rating,directorname,genre,releasedate,reviews) VALUES"+"(?,?,?,?,?,?);";
		
		int rs=0;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, obj.getMoviename());
		pst.setString(2, obj.getMovierating());
		pst.setString(3, obj.getDirectorName());
		pst.setString(4, obj.getGenre());
		pst.setString(5, obj.getReleasedate());
		pst.setString(6, obj.getReviews());
		
		
		rs=pst.executeUpdate();

		}catch(SQLException ex)
		{

			return -1;
			 	
		}catch(Exception ex)
		{
			ex.addSuppressed(ex);
		}
		
		return rs;
	
	}

	

}
