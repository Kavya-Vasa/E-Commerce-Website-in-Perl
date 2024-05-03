<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import = "java.io.*" %>  
<%@page import = "java.sql.*"%>

<html>
<head>
<title>delete-product</title>
</head>
<body>

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
      String deleteQuery = "DELETE FROM products WHERE id = " + id;
      Statement deleteStatement = connection.createStatement();
      int result = deleteStatement.executeUpdate(deleteQuery);
      if(result == 1) {
    	  %>
    	  	<script>
    	  		alert("Product has been deleted!");
    	  	</script>
    	  <%
    	  response.sendRedirect("../index.jsp");
      }else {
    	  %>
  	  	<script>
  	  		alert('Failed to delete product!');
  	  	</script>
  	  <%
  	  response.sendRedirect("../index.jsp");
      }
    } else {
    	%>
	  	<script>
	  		alert('Failed to connect database!');
	  		window.location.replace('../sign-up.html');
	  	</script>
	  <%
    }
  }catch (SQLException e) {
    System.out.println("Error: " + e.getMessage());
  }
%>

</body>
</html>
