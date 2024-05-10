package net.pkg.project.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class CategoryDao {
	public ArrayList<String> get_categories(){
		ArrayList<String>li=new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/webproject?useSSL=false";
			
			Connection con=DriverManager.getConnection(url,"root","noman6140");
			
			PreparedStatement pst=con.prepareStatement("select * from categories");
			
			String name;
			ResultSet data=pst.executeQuery();
			while(data.next()) {
				name=data.getString("categoryname");
				li.add(name);
			}
			
			return li;
		}catch(Exception e) {
			return li;
		}
		
	
	}
}
