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
  String id = request.getParameter("id");
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
   	  String updateQuery = "UPDATE products SET name='" + name + "',description='" + description + "',price='" + price + "',category='" + category + "',url='" + url + "',stock='" + stock + "' WHERE id = " + id;
   	  Statement updateStatement = connection.createStatement();
   	  out.println(updateQuery);
   	  
   	  int result = updateStatement.executeUpdate(updateQuery);
   	  if(result == 1) {
   		%>
	  	<script>
	  		alert('Product updated successfully!');
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
