package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;
public class loginDao {
	
	public boolean loginUser(loginBean userbeanobj) throws ClassNotFoundException{
		
		
	
	boolean status=false;	
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
//		String query="SELECT * FROM userdb WHERE email=? and password=? and user_type=?";
		String query="SELECT * FROM userdb WHERE email=? and password=?";
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, userbeanobj.getEmail());
		pst.setString(2, userbeanobj.getPassword());
//		pst.setString(3, userbeanobj.getUsertype());
		
		
		
		ResultSet rs=pst.executeQuery();
		
		status=rs.next();
		
		pst.close();
		con.close();
		rs.close();
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return status;
	
	}

}
