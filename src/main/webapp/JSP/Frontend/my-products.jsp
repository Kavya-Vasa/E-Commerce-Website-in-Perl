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
  <link rel="stylesheet" href="./css/all-products.css">
  <title>All Products</title>
</head>

<body>
  <!-- NAVBAR -->
	<%@ include file="./navbar.html" %>

  <h2 class="products-heading">My Products</h2>

  <section class="all-products">
    <div class="grid">

      <%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        String userId = session.getAttribute("user_id").toString();
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM products WHERE user_id = ? ORDER BY id DESC LIMIT 8";
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            selectQueryPreparedStatement.setString(1, userId);
            
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
				           <div class="card-options">
				           	<a class="card-btn-edit" href="./edit-product.jsp?id=<%= selectQueryResultSet.getString("id") %>">Edit</a>
				           	<a class="card-btn-delete" href="./jsp/delete-product.jsp?id=<%= selectQueryResultSet.getString("id")%>">Delete</a>
				           </div>
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
