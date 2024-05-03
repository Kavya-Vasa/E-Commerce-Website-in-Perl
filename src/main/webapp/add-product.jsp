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
  <title>Add Product</title>
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
        <li><a href="./view-product.jsp">View orders</a></li>
        <li><a href="./add-product.jsp">Add product</a></li>
        <li><a href="./profile.jsp">Profile</a></li>
        <li><a href="./jsp/logout.jsp">Logout</a></li>
      </ul>
    </header>

    <div class="content">
      <div class="imageBox">
        <img src="./images/banner.png" alt="">
      </div>
      <form action="./jsp/add-product.jsp" method="post">
        <div class="form-control">
          <label for="">Enter product name</label><br>
          <input required type="text" name="name" id="name" placeholder="Product name">
        </div>
        <div class="form-control">
          <label for="">Enter product description</label><br>
          <textarea required name="description" id="description" cols="30" rows="3"
            placeholder="Product description"></textarea>
        </div>
        <div class="form-control">
          <label for="">Enter product price</label><br>
          <input required type="number" name="price" id="price" placeholder="Product price">
        </div>
        <div class="form-control">
          <label for="">Product url</label><br>
          <input required type="text" name="url" id="url" placeholder="Product url">
        </div>
        <div class="form-control">
          <label for="">Available stock</label><br>
          <input required type="number" name="stock" id="stock" placeholder="Available stock">
        </div>
        <div class="form-control">
          <label for="">Select category</label><br>
          <select id="category" name="category">
            <option value="trending">Trending</option>
            <option value="new_arrival">New Arrival</option>
            <option value="most_popular">Most Popular</option>
          </select>
        </div>
        <button type="submit" class="btn">Submit</button>
      </form>
    </div>
  </section>

</body>

</html>
