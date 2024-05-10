<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Movie</title>
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
  
  h1{color:red;}
</style>

<body>
<%@page import="java.sql.*"%>

<%
 if(session.getAttribute("admin")!=null)
   { %>

<div>
 <div> <h2>View All Movies</h2></div>
    
            <div>
            <form action="viewMovie.jsp" >
								
				<input type="submit" value="view"><br>

            </form>
            </div>
            </div>




        <div class="container">
            
            
               
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

<%
			}else
				{
				response.sendRedirect("login.jsp");
				
				}
				%>
        

</body>
</html>