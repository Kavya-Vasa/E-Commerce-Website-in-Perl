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
  <link rel="stylesheet" href="./css/view-product.css">
  <title>View Product</title>
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
    
    <%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  	
  	if(request.getParameter("id") == null) {
  		response.sendRedirect("./index.jsp");
  		return;
  	}
  	
  	String productId = request.getParameter("id").toString();
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM products WHERE id = " + productId;
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
            
            while(selectQueryResultSet.next()) {
           		String available = Integer.parseInt(selectQueryResultSet.getString("stock")) > 0 ? "Yes" : "No";
            	
            	%>
            		<div class="content">
				      <div class="imageBox">
				        <img src="<%= selectQueryResultSet.getString("url")%>" alt="">
				      </div>
				      <div class="product-content">
				      	<div class="form-control">
				          <label for="">Product name</label><br>
				          <h4><%= selectQueryResultSet.getString("name")%></h3>
				        </div>
				        <div class="form-control">
				          <label for="">Product description</label><br>
				          <p><%= selectQueryResultSet.getString("description")%></p>
				        </div>
				        <div class="form-control">
				          <label for="">Product price</label><br>
				          <h4><%= selectQueryResultSet.getString("price")%></h3>
				        </div>
				        <div class="form-control">
				          <label for="">Available</label><br>
				          <h4><%= available%></h3>
				        </div>
				        <div class="form-control">
				          <label for="">Category</label><br>
				          <h4><%= selectQueryResultSet.getString("category")%></h3>
				        </div>
				        <a type="submit" href="./place-order.jsp?id=<%= productId %>" class="btn">Checkout</a>
				      </div>
				    </div>
            	<%
            }
        }
    }catch(SQLException e) {
    	System.out.println(e.getMessage());
    }
    
    %>
    
  </section>

</body>

</html>
