package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;

public class adminUpdateMovieDao {

	public int updateMovie(adminUpdateMovieBean aumbobj) throws ClassNotFoundException
	{

		
		String query="UPDATE moviedb SET rating = ?, directorname = ?, genre = ? , releasedate = ? WHERE name = ?";
		
		int rs=0;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, aumbobj.getMovierating());

		pst.setString(2, aumbobj.getDirectorName());
		pst.setString(3, aumbobj.getGenre());
		pst.setString(4, aumbobj.getReleasedate());
		pst.setString(5, aumbobj.getMoviename());
		
		
		rs=pst.executeUpdate();

		}catch(SQLException ex)
		{
			return -1;
		}
		catch(Exception ex)
		{
			ex.addSuppressed(ex);
		}
		
		return rs;
	

	}
}
