<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import = "java.io.*" %>  
<%@page import = "java.sql.*"%>

<%
	if(session.getAttribute("user_id") == null) {
		%>
			<script>
				alert("Please login to get access!");
				window.location.replace('./sign-in.html');
			</script>
		<%
	}
	
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/add-product.css">
  <title>Edit Product</title>
</head>

<body>

  <!-- HOME BANNER SCREEN -->
  <section class="home-banner">
    <header>
      <h3 class="logo">The little things</h3>
      <ul class="navigation">
        <li><a href="./index.jsp">Home</a></li>
        <li><a href="./all-products.jsp">All products</a></li>
        <li><a href="./my-products.jsp">My products</a></li>
        <li><a href="./view-orders.jsp">View orders</a></li>
        <li><a href="./add-product.jsp">Add product</a></li>
        <li><a href="./profile.jsp">Profile</a></li>
        <li><a href="./jsp/logout.jsp">Logout</a></li>
      </ul>
    </header>
    
    <%
  // fetch and store form data -
  String id = request.getParameter("id");
  
  String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  try {
    // make database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(databaseUrl, "root", "");

    // check if the database connection is successful
    if(connection != null) {
      String selectQuery = "SELECT * FROM products WHERE id = " + id;
      PreparedStatement selectPrepareStatement = connection.prepareStatement(selectQuery);
      ResultSet selectResultSet = selectPrepareStatement.executeQuery();
      
      if(selectResultSet.next()) {
    	  %>
    	  	<div class="content">
			      <div class="imageBox">
			        <img src="./images/banner.png" alt="">
			      </div>
			      <form action="./jsp/edit-product.jsp?id=<%= id%>" method="post">
			        <div class="form-control">
			          <label for="">Enter product name</label><br>
			          <input value="<%= selectResultSet.getString("name")%>" required type="text" name="name" id="name" placeholder="Product name">
			        </div>
			        <div class="form-control">
			          <label for="">Enter product description</label><br>
			          <textarea required name="description" id="description" cols="30" rows="3"
			            placeholder="Product description"><%= selectResultSet.getString("description")%></textarea>
		        </div>
		        <div class="form-control">
		          <label for="">Enter product price</label><br>
		          <input value="<%= selectResultSet.getString("price")%>" required type="number" name="price" id="price" placeholder="Product price">
		        </div>
		        <div class="form-control">
		          <label for="">Product url</label><br>
		          <input value="<%= selectResultSet.getString("url")%>" required type="text" name="url" id="url" placeholder="Product url">
		        </div>
		        <div class="form-control">
		          <label for="">Available stock</label><br>
		          <input value="<%= selectResultSet.getString("stock")%>" required type="number" name="stock" id="stock" placeholder="Available stock">
		        </div>
		        <div class="form-control">
		          <label for="">Select category</label><br>
		          <select id="category" name="category">
		            <option value="tending">Trending</option>
		            <option value="new_arrival">New Arrival</option>
		            <option value="moat_popular">Most Popular</option>
		          </select>
		        </div>
		        <button type="submit" class="btn">Submit</button>
		      </form>
		    </div>
    	  <%
      }else {
    	  %>
	  	  	<script>
	  	  		alert('Update operation failed!');
	  	  		window.location.replace('./index.jsp');
	  	  	</script>
	  	  <%
      }
    } else {
    	%>
	  	<script>
	  		alert('Failed to connect database!');
	  		window.location.replace('./sign-up.html');
	  	</script>
	  <%
    }
	  }catch (SQLException e) {
	    System.out.println("Error: " + e.getMessage());
	  }
	%>
</section>
</body>

</html>
