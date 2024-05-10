<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Movie Details</title>

    </head>
    <style>
    h2 {
        text-align: center;
        color: blue;
    }
    
    div {
         position:centre;
        display: inline-block;
        margin: 20px;
        text-align: center;
        right: 50px;
    }
    
    button {
        padding: 10px 20px;
        border-radius: 5px;
        background-color: blue;
        color: white;
        border: none;
    }
    
    button:hover {
        background-color: #800000;
        /* color: skyblue; */
        cursor: pointer;
    }
    
    a {
        text-decoration: none;
        color: white;
    }
    
    h1
    {
    color:red;
    }
</style>
    
 
    <body>
    
    
    <%
 if(session.getAttribute("admin")!=null)
   { %>
        <h2>Welcome Admin</h2>
      

		
			<div>


				<button><a href="AdminAddMovies.jsp"><h4>Add Movies</h4></a></button>

			</div>			
		

			<div>


				<button><a href="AdminUpdateMovies.jsp"><h4>Update Movies</h4></a></button>

			</div>		

			<div>


				<button><a href="AdminDeleteMovies.jsp"><h4>Delete Movies</h4></a></button>

			</div>			

			<div>


				<button><a href="AdminmovieView.jsp"><h4>View Movies</h4></a></button>

			</div>			
			
			
			<div style="position:absolute; right:100px; bottom :100px;"> 
			
			<form action="<%= request.getContextPath()%>/adminlogout" method="post">
			
			<button>Logout</button>
			
			</form>
			</div>
			<%
			}else
				{
				 request.getRequestDispatcher("login.jsp").forward(request,response);
				
				}
				%>

    </body>

    </html>