package net.pkg.project.dao;

import java.sql.*;
import net.pkg.project.model.*;
public class adminlogin {
	
	public boolean loginAdmin(adminloginBean obj) throws ClassNotFoundException{
		
		
	
	boolean status=false;	
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/webproject?useSSL=false";
		
		Connection con=DriverManager.getConnection(url,"root","noman6140");
		
		String query="SELECT * FROM admindb WHERE email=? and password=?";
		PreparedStatement pst=con.prepareStatement(query);
		
		pst.setString(1, obj.getEmail());
		pst.setString(2, obj.getPassword());
		
		System.out.println(pst);
		
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
