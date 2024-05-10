package net.pkg.project.dao;


import java.sql.*;
import net.pkg.project.model.*;
public class searchByUserDao {

	
	
	public ResultSet searchMovie(searchByUser obj) throws ClassNotFoundException
	{
	
		
		ResultSet result;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/webproject?useSSL=false";
			
			Connection con=DriverManager.getConnection(url,"root","noman6140");
			
			String query="SELECT * FROM moviedb WHERE name=?";
			PreparedStatement pst=con.prepareStatement(query);
			
			pst.setString(1, obj.getName());
			
			
			System.out.println(pst);
			
			result =pst.executeQuery();
			
			
			
			
			}catch(Exception ex)
			{
				return null;
			}
			
			return result;	
	}
	
	
}
