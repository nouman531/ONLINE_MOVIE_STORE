<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Movie</title>
<style type="text/css">
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  .container {
    width: 80%;
    margin: 0 auto;
    text-align: center;
  }

  h1 {
    font-size: 36px;
    margin-top: 40px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  th, td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: left;
  }

  th {
    background-color: #ddd;
    font-size: 24px;
  }

  td {
    font-size: 20px;
  }
</style>
</head>
<body>

<% String errormessage=(String)request.getAttribute("errormessage"); if(errormessage!=null){ %>
				<p style="color:red">
				<%= errormessage %>
				</p>	
				<%} %>


<div class="container">
  <h1>Movie Details</h1>
  <table>
    <tr>
      <th>Name</th>
      <td><%= (String)request.getAttribute("name") %></td>
    </tr>
    <tr>
      <th>Rating</th>
      <td><%= (String)request.getAttribute("rating") %></td>
    </tr>
    <tr>
      <th>Director</th>
      <td><%= (String)request.getAttribute("dname") %></td>
    </tr>
    <tr>
      <th>Genre</th>
      <td><%= (String)request.getAttribute("genre") %></td>
    </tr>
    <tr>
      <th>Release Date</th>
      <td><%= (String)request.getAttribute("rdate") %></td>
    </tr>
    <tr>
      <th>Reviews</th>
      <td><%= (String)request.getAttribute("reviews") %></td>
    </tr>
  </table>
</div>
</body>
</html>
