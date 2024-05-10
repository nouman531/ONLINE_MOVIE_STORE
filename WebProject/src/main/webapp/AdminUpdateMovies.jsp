<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Movie</title>
</head>
<style>
body {
    background-color: lightblue;
    text-align: center;
}

.alert {
    display: inline-block;
    padding: 20px;
    margin: 20px;
    background-color: skyblue;
    color: white;
    border-radius: 10px;
}

form {
    background-color: white;
    display: inline-block;
    padding: 20px;
    margin: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
}

label {
    font-weight: bold;
    margin-right: 20px;
}

input[type="text"], input[type="date"] {
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 10px;
    border: none;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
}

input[type="submit"] {
    padding: 10px 20px;
    background-color: skyblue;
    color: white;
    border-radius: 10px;
    border: none;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: royalblue;
}

h1{color:red}
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
                <h3>Update Movie</h3>
            </div>
            <div>
                <form action="<%= request.getContextPath()%>/update" method="post">

                    <div>
                        <label>Name:</label>
                        <input type="text" name="name" required>
                    </div>

                    <div>
                        <label>New Rating:</label>
                        <input type="text" name="rating" required>

                    </div>

                    <div>
                        <label>Update Directors Name:</label>
                        <input type="text" name="dname" required>
                    </div>

                    <div>
                        <label> Update Genre:</label>
                        <input type="text" name="genre" required>
                    </div>

                    <div>
                        <label> Update Date:</label>
                        <input type="date" name="date" required>
                    </div>

                    <div> <input type="submit" value="Upadte"></div>
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