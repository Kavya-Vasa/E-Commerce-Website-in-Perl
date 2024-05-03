<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import = "java.io.*" %>  
<%@page import = "java.sql.*"%>

<html>
<head>
<title>add-product verification</title>
</head>
<body>

<%
  // fetch and store form data -
  String name = request.getParameter("name");
  String description = request.getParameter("description");
  String price = request.getParameter("price");
  String category = request.getParameter("category");
  String url = request.getParameter("url");
  String stock = request.getParameter("stock");
  String userId = session.getAttribute("user_id").toString();
  
  String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  try {
    // make database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(databaseUrl, "root", "");

    // check if the database connection is successful
    if(connection != null) {
   	  String insertQuery = "INSERT INTO products(name, description, price, category, url, stock, user_id) VALUES('" + name + "','" + description + "','" + price + "','" + category + "','" + url + "','" + stock + "','" + userId + "')";
   	  Statement insertStatement = connection.createStatement();
   	  
   	  int result = insertStatement.executeUpdate(insertQuery);
   	  if(result == 1) {
   		%>
	  	<script>
	  		alert('Product added successfully!');
	  	</script>
	  <%
	  	response.sendRedirect("../index.jsp");
   	  }else {
   		%>
	  	<script>
	  		alert('Failed to add product!');
	  		window.location.replace('../index.jsp');
	  	</script>
	  <%
   	  }
    }else {
    	%>
	  	<script>
	  		alert('Failed to connect database!');
	  		window.location.replace('../index.jsp');
	  	</script>
	  <%
    }
  }catch (SQLException e) {
    System.out.println("Error: " + e.getMessage());
  }
%>

</body>
</html>
