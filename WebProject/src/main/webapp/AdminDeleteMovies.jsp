<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Movies</title>
</head>

<style>
    .center {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .alert {
        background-color: #ADD8E6;
        color: black;
        padding: 20px;
        border-radius: 5px;
        text-align: center;
        margin-bottom: 20px;
    }
    form {
        background-color: #F0F8FF;
        padding: 20px;
        border-radius: 5px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 0 0 10px #B0C4DE;
    }
    input[type="text"], input[type="date"], textarea {
        width: 60%;
        padding: 12px 20px;
        margin: 8px 0;
        box-sizing: border-box;
        border-radius: 5px;
        border: 1px solid #B0C4DE;
    }
    input[type="submit"] {
        background-color: #87CEFA;
        color: white;
        padding: 12px 20px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #708090;
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
        <h3>Delete Movie</h3>
    </div>

    <div>
        <form action="<%= request.getContextPath()%>/delete" method="post">

            <div>
                <label>Name</label>
                <input type="text" name="name" required>
            </div>

            <div>
                <label>Director Name</label>
                <input type="text" name="dname" required>
            </div>

            <div> <input type="submit" value="Delete"></div>
        </form>
    </div>

</div>
<% 
   }else
   {
	   response.sendRedirect("login.jsp");
		return;
   }
%>


</body>
</html>