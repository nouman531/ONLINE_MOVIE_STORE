package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;
public class adminDeleteDao {
	
	public int deleteMovie(adminDeleteMovie obj) throws ClassNotFoundException
	{

		String query="DELETE FROM moviedb WHERE name=?";
		int rs=0;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, obj.getMoviename());
		
		
		
		
		System.out.println(pst);
		
		rs=pst.executeUpdate();
		
		

		}catch(Exception ex)
		{
			return -1;
		}
		
		return rs;
	
	}

	
}
