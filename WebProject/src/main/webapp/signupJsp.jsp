<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>User SignUp</title>
  
</head>
	<style>
body {
  background-color: lightblue;
  font-family: Arial, sans-serif;
}

.signup_container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-container {
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px #ccc;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

label, input[type="submit"] {
  width: 100%;
  text-align: left;
  margin-bottom: 10px;
}

input[type="text"], input[type="password"], input[type="email"] {
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
        border-radius: 5px;
        border: 1px solid #B0C4DE;
       margin-bottom: 20px;
}

input[type="submit"] {
  background-color: steelblue;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.alert {
  background-color: steelblue;
  color: white;
  padding: 20px;
  border-radius: 5px;
  text-align: top;
  margin-bottom: 20px;
}

button a {
  text-decoration: none;
  color: white;
  background-color: steelblue;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  display: inline-block;
}


p {
  text-align: center;
  margin-top: 20px;
  color: red;
}
</style>
<body>

      <div class="signup_container">
      
      
      <div class="alert alert-success center" role="alert">
            <p>${NOTIFICATION}</p>
        </div>
  <div class="form-container">

    <form action="<%= request.getContextPath()%>/signup" method="post" onsubmit="myfunc(event)" >

      <div>
        <label for="">Email</label>
        <input type="text" name="email" id="email">
      </div>


      <div>
        <label for="">Password</label>
        <input type="password" name="password" id="password">
      </div>


      <div>
        <label for="">Confirm Password</label>
        <input type="password" name="confirm_pass" id="confirm_pass">
      </div>

      <div><input type="submit" value="SignUp"></div>
    </form>
				<% String errormessage=(String)request.getAttribute("errormessage"); if(errormessage!=null){ %>
				<p style="color:red">
				<%= errormessage %>
				</p>	
				<%} %>
				<% String err=(String)request.getParameter("id"); if(err!=null){ %>
				<p style="color:red">
				<%= err %>
				</p>	
				<%} %>
    
    
     <div> <button> <a href="login.jsp">Login</a></button> </div>


  </div>
      
      
      </div>
      
      
      
      <script>
      
      
      function myfunc(e)
      {
    	  e.preventDefault();
    	  
    	  
    	  let email=document.getElementById("email").value;
    	  let password=document.getElementById("password").value;
    	  let confirm_pass=document.getElementById("confirm_pass").value;
    	  
    	  if(email===""&&password===""&&confirm_pass==="")
    			  {
    		  alert("Feilds are empty");
    		  return false;
    			  }
    	  else if(password===""||confirm_pass==="")
    		  {
    		  alert("Password field is empty");
    		  return false;
    		  }
    	  else if(password!==confirm_pass)
    		  {
    		  alert("Password and confirm password doesnot!");
    		  return false;
    		  }
    	  else if (!(email==="")) {
    		  console.log("Not empty");
    		    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    		    const isValidEmail = emailRegex.test(email);
    		    if (isValidEmail) {
    		    	document.querySelector("form").submit();
    		        return true;
    		    } else {
    		        alert("Not a valid email address!");
    		        return false;
    		    }
    		}

    		  
    		  
    	return true;		  
    	  
      }
      
      
      
      
      
      
      </script>
      
      
      
</body>

</html>
