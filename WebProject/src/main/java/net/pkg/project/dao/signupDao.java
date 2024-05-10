package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;
public class signupDao {
	
	public ResultSet check(adminloginBean obj1)throws  ClassNotFoundException
	{
		
		
		ResultSet result;
		String query="select * from admindb where email=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/webproject?useSSL=false";
			
			Connection con=DriverManager.getConnection(url,"root","noman6140");
			
			PreparedStatement pst=con.prepareStatement(query);
			
			pst.setString(1, obj1.getEmail());

			
			
			result =pst.executeQuery();
			
			
			
			
			}catch(Exception ex)
			{
				return null;
			}
			
			return result;
	}
			
			
		
	
	
	
	
	
	public int sinupUser(signupBean obj)throws ClassNotFoundException
	
	{
	String query="INSERT INTO userdb "+"(email,password) VALUES"+"(?,?);";
		
	
	

	
		int rs=0;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, obj.getEmail());
		pst.setString(2, obj.getPassword());
//		pst.setString(3,"user");
		
	

		
		rs=pst.executeUpdate();
		
		
		
		}catch(SQLException ex)
		{
			
			 		return -1;
			 	
		}catch(Exception ex)
		{
			ex.addSuppressed(ex);
		}
		if(rs>0)
			
		return rs;
		else
			
		{
			return -1;
		}
	
	}

}
