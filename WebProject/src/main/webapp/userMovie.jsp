

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.pkg.project.dao.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
</head>

<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
  }

  h2 {
    text-align: center;
    color: blue;
  }

  .container {
    max-width: 600px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
  }

  form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  h3 {
    color: blue;
    margin-bottom: 10px;
  }

  select {
    width: 50%;
    height: 40px;
    font-size: 16px;
    margin-bottom: 20px;
    padding: 10px;
  }

  input[type="submit"] {
    width: 20%;
    height: 40px;
    background-color: blue;
    color: #fff;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  button {
  background-color: blue;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>



<body>
<%
 if(session.getAttribute("user")!=null)
   { %>
<div class="user_movie">

          <div>  <h2>Search Movie</h2>
        </div>
        <div>
         
        

            <form action="<%= request.getContextPath()%>/search" method="post">

                Name:<input type="text" name="name" required><br><br>
                
				<input type="submit" value="Search">


            </form>
        </div>

          <div>  <h2>View All Movies</h2></div>
          
      
          
        <div>
    
            <form action="viewMovie.jsp" >
								
				<input type="submit" value="view">

            </form>





        <div class="container">
            
            
                    <div>
                        <h2> Movies By Catogory</h2>
                    </div>
                <br>
                <div class="form-group">
            <form method="get" action="viewMovie.jsp">     
                      <div class="form-group">
                          <h3>Select the Genre</h3>
       <%
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            
         try
	     {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/webproject","root","noman6140");
            pst = con.prepareStatement("select distinct genre from moviedb");
            
	    rs=pst.executeQuery();
            
            if(rs.next())
	   {
	      out.println("<tr>");
              out.println("<td>Choose Movie Category</td>");
	      out.println("<td>");
	      out.println("<select name='cat'>");
	   do{
            String moviecat = rs.getString("genre");
	    out.println("<option value='"+ moviecat   +"'>" +  moviecat +  "</option>"); 
          }
            while(rs.next());
	   out.println("</select>");
           rs.close();
	   out.println("</td></tr>");
           out.println("</tr><td><input type=submit  value=view></td></tr>");
           }
           else
            {
           out.println("<tr>");
 	   out.println("<td>");
	   out.println("Sorry table is Empty");
           out.println("</td>");
            }	

	   out.println("</form>");
	  }
        catch(Exception e)
        {
                 e.printStackTrace(); // Or System.out.println(e);
        }	 
                              
        %>
         </div>
                    
           
                    
          </form>                     
                    
              </div>      
               
     </div>
</div>

        </div>
        



</div>        
        
        
        <div style="position:absolute; right:100px; bottom :100px;"> 
			
			  <form action="<%= request.getContextPath()%>/logout" method="POST">
			
			<button>Logout</button>
			
			</form>
			</div>
        
        <%}else
        {
        	response.sendRedirect("login.jsp");
        }


%>
        
        
        </body>
</html>




