<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login </title>
  
</head>
<style>
   .login_container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
   }
   
   form {
      background-color: white;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 2px 2px 10px lightgray;
      display: flex;
      flex-direction: column;
      align-items: center;
   }
   
   label {
      font-weight: bold;
      margin-top: 1rem;
   }
   
   input[type="email"],
   input[type="password"] {
      width: 100%;
      padding: 0.5rem;
      margin-top: 0.5rem;
      border-radius: 5px;
      border: 1px solid lightgray;
      font-size: 1rem;
   }
   
   input[type="submit"] {
      width: 100%;
      padding: 0.75rem;
      margin-top: 1rem;
      border-radius: 5px;
      background-color: royalblue;
      color: white;
      font-size: 1.25rem;
      cursor: pointer;
   }
</style>

<body>

  <div class="login_container">
    <div>

        <form action="<%= request.getContextPath()%>/login" method="POST">

            <div>
                <label for="">Email</label>
                <input type="email" name="email" >
            </div>


            <div>
                <label for="">Password</label>
                <input type="password" name="password" >
            </div>
				
				<% String errormessage=(String)request.getAttribute("errormessage"); if(errormessage!=null){ %>
				<p style="color:red">
				<%= errormessage %>
				</p>	
				<%} %>

            <div><input type="submit" value="Login"></div>
        </form>


    </div>
  
  </div>

</body>

</html>
