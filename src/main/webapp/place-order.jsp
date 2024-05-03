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
  <title>Place Order</title>
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
				        <img src="<%= selectQueryResultSet.getString("url") %>" alt="">
				      </div>
				      <form action="./jsp/place-order.jsp" method="post">
				      	<input value="<%= productId %>" type="hidden" name="product_id">
				        <div class="form-control">
				          <label for="">Product name</label><br>
				          <input value="<%= selectQueryResultSet.getString("name") %>" readonly required type="text" name="name" id="name" placeholder="Product name">
				        </div>
				        <div class="form-control">
				          <label for="">Shipping address</label><br>
				          <textarea required name="address" id="address" cols="30" rows="3" placeholder="Shipping address"></textarea>
				        </div>
				        <div class="form-control">
				          <label for="">Price</label><br>
				          <input value="<%= selectQueryResultSet.getString("price") %>" readonly required type="number" name="price" id="price" placeholder="Product price">
				        </div>
				        <div class="form-control">
				          <label for="">Quantity</label><br>
				          <input required type="number" min="1" name="quantity" id="quantity" placeholder="Product quantity">
				        </div>
				        <div class="form-control">
				          <label for="">Total price</label><br>
				          <input readonly required type="test" name="total_price" id="total_price" placeholder="Total price">
				        </div>
				        <div class="form-control">
				          <label for="">Payment method</label><br>
				          <select id="payment_method" name="payment_method">
				            <option value="cod">Cash on Delivery</option>
				          </select>
				        </div>
				        <button type="submit" class="btn">Place order</button>
				      </form>
				    </div>
            	<%
            }
        }
    }catch(SQLException e) {
    	System.out.println(e.getMessage());
    }
    
    %>
    

  </section>

<script type="text/javascript" src="./javascript/place-order.js"></script>
</body>

</html>
