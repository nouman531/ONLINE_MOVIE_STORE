<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Movies</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<%@page import="java.sql.*"%>
<%
   Connection con = null;
   PreparedStatement pst = null;
   ResultSet rs = null;
  
   if(session.getAttribute("user")!=null||session.getAttribute("admin")!=null)
   {
	   try {	
		   
		   
		   String moviecat= request.getParameter("cat");
				   
	       Class.forName("com.mysql.jdbc.Driver");
	       String url="jdbc:mysql://localhost:3306/webproject";
	       con = DriverManager.getConnection(url, "root", "noman6140");
	   
	       
	       if(moviecat!=null)
	       {
	    	   pst = con.prepareStatement("select name,rating,directorname,genre,releasedate,reviews from moviedb where genre=?");
	           pst.setString(1, moviecat);
	           rs = pst.executeQuery();
	       }
	       else
	       {
	    	   String sql = "SELECT * FROM moviedb";         
	           pst = con.prepareStatement(sql);
	           rs = pst.executeQuery();
	          
	       }
	       
	   } catch (Exception e) {
	       e.printStackTrace();
	   }
	%>
	<table>
	   <tr>
	       <th>Name</th>
	       <th>Rating</th>
	       <th>Director</th>
	       <th>Genre</th>
	       <th>Release Date</th>
	       <th>Reviews</th>
	   </tr>
	   <%
	   
	       while (rs.next()) {
	   %>
	   <tr>
	   		 
	       <td><%=rs.getString("name")%></td>
	       <td><%=rs.getString("rating")%></td>
	       <td><%=rs.getString("directorname")%></td>
	        <td><%=rs.getString("genre")%></td> 
	       <td><%=rs.getString("releasedate")%></td>
	        <td><%=rs.getString("reviews")%></td>
	   </tr>
	   <%
	       }
	   %>
	</table>
	<%
	   try {
	       if (rs != null) {
	           rs.close();
	       }
	       if (pst != null) {
	           pst.close();
	       }
	       if (con != null) {
	           con.close();
	       }
	   } catch (Exception e) {
	       e.printStackTrace();
	   }
   }
   
   
   else
   {
	   response.sendRedirect("login.jsp");
		return;
   }
%>
</body>
</html>
