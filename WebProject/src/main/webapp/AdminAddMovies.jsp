<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movies</title>
</head>

<style>
  body {
    background-color: lightblue;
    font-family: Arial, sans-serif;
    padding: 20px;
  }

  h3 {
    text-align: center;
    color: darkblue;
  }

  form {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px 0 lightgrey;
    margin: 0 auto;
    width: 500px;
  }

  label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: darkblue;
  }

  input[type="text"],
  input[type="date"],
  textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid lightgrey;
  }

  input[type="submit"] {
    background-color: darkblue;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }

  .alert {
    background-color: lightgrey;
    color: darkblue;
    padding: 20px;
    border-radius: 10px;
    width: 500px;
    margin: 20px auto;
    text-align: center;
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

<div class="alert alert-success center" role="alert">
            <p>${NOTIFICATION}</p>
        </div>

        <div>
            <div>
               <h3> Add Movie</h3>
            </div>

            <div>
                <form action="<%= request.getContextPath()%>/add" method="post">

                    <div>
                        <label>Name</label>
                        <input type="text" name="name" required>
                    </div>

                    <div>
                        <label>Rating:</label>
                        <input type="text" name="rating"required>
                    </div>

                    <div>
                        <label>Director Name</label>
                        <input type="text" name="dname"required>
                    </div>


                    <div>
                        <label>Genre:</label>
                        <input type="text" name="genre"required>
                    </div>

                    <div>
                        <label>Date:</label>
                        <input type="date" name="date"required>
                    </div>

                    <div>
                        <label>Reviews</label><br>
                        <textarea name="reviews" cols="30" rows="10" placeholder="Enter your text"></textarea>
                    </div>
                    <div> <input type="submit" value="Add"></div>
                </form>
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