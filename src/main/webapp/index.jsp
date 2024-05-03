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
  <link rel="stylesheet" href="./css/home.css">
  <title>Home</title>
</head>

<body>

  <!-- HOME BANNER SCREEN -->
  <section class="home-banner">
    <div class="circle"></div>
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

    <div class="content">
      <div class="textBox">
        <h2>A modern approach to shopping...</h2>
        <p>Little Things is a place where you will find the products you require online. The benefit is that there are no online transactions on our website so online frauds are impossible to take place. Our mission to take satisfy all our customers by fulfilling their demands they make on our contact number given below. And our vision is to go global with our brand. Please do visit again! And if you are a first time comer welcome to our website.</p>
        <a href="#">All Products</a>
      </div>
      <div class="imageBox">
        <img src="./images/banner.png" alt="">
      </div>
    </div>
  </section>

  <!-- ALL PRODUCTS -->
  <h2 class="products-heading">All Products</h2><br>
  <section class="all-products">
    <div class="grid">
    
    <%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM products ORDER BY id DESC LIMIT 8";
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
            
            while(selectQueryResultSet.next()) {
            	%>
            		<div class="grid-item">
				       <div class="card">
				         <img
				           src=<%= selectQueryResultSet.getString("url") %>
				           alt="" class="card-img">
				         <div class="card-content">
				           <h1 class="card-header"><%= selectQueryResultSet.getString("name") %></h1>
				           <p class="card-text"><%= selectQueryResultSet.getString("description") %></p>
				           <a class="card-btn" href="./view-product.jsp?id=<%= selectQueryResultSet.getString("id") %>">View Product</a>
				         </div>
				       </div>
				     </div>
            	<%
            }
        }
        
    }catch(SQLException e) {
    	System.out.println(e.getMessage());
    }
    
    %>

    </div>
  </section>
</body>

</html>
