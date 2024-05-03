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
  <link rel="stylesheet" href="./css/view-orders.css">
  <title>View Orders</title>
</head>

<body>

  <!-- HOME BANNER SCREEN -->
  <section class="home-banner">
    <div class="circle"></div>
    <header>
      <h3 class="logo">The little things</h3>
      <ul class="navigation">
        <li><a href="./index.jsp">Home</a></li>
        <li><a href="http://localhost/ecommerce-website/cgi/all-products.cgi">All products</a></li>
        <li><a href="./my-products.jsp">My products</a></li>
        <li><a href="./view-orders.jsp">View orders</a></li>
        <li><a href="./add-product.jsp">Add product</a></li>
        <li><a href="./profile.jsp">Profile</a></li>
        <li><a href="./jsp/logout.jsp">Logout</a></li>
      </ul>
    </header>
  </section>

  <!-- ALL PRODUCTS -->
  <h2 class="products-heading">My ordered products</h2><br>
  <section class="all-products">
    <div class="grid">
    
    <%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
    String userId = session.getAttribute("user_id").toString();
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM user_products WHERE user_id = '" + userId + "'";
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();

            
            while(selectQueryResultSet.next()) {
            	String productId = selectQueryResultSet.getString("product_id");
            	String orderId = selectQueryResultSet.getString("order_id");
            	
            	String selectProductQuery = "SELECT * FROM products WHERE id = '" + productId + "'";
            	String selectOrderQuery = "SELECT * FROM orders WHERE id = '" + orderId + "'";
            	
            	PreparedStatement selectProductPrepareStatement = connection.prepareStatement(selectProductQuery);
            	PreparedStatement selectOrderPrepareStatement = connection.prepareStatement(selectOrderQuery);
            	
            	ResultSet selectProductResultSet = selectProductPrepareStatement.executeQuery();
            	ResultSet selectOrderResultSet = selectOrderPrepareStatement.executeQuery();
            	
            	
            	if(selectProductResultSet.next() && selectOrderResultSet.next()) {
            		%>
            		<div class="grid-item">
				        <div class="card">
				          <img
				            src="<%= selectProductResultSet.getString("url") %>"
				            alt="" class="card-img">
				          <div class="card-content">
				            <h1 class="card-header"><%= selectProductResultSet.getString("name") %></h1>
				            <h3>Quantity: <%= selectOrderResultSet.getString("quantity") %></h3>
				            <h3>Price: <%= selectProductResultSet.getString("price") %></h3>
				            <h3>Total price: <%= selectOrderResultSet.getString("total_price") %></h3>
				            <h3>Payment method: <%= selectOrderResultSet.getString("payment_method") %></h3>
				          </div>
				        </div>
				      </div>
            	<%
            	}
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
