<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import = "java.io.*" %>  
<%@page import = "java.sql.*"%>

<html>
<head>
<title>sign-up verification</title>
</head>
<body>

<%
  // fetch and store form data -
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  
  String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  try {
    // make database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(databaseUrl, "root", "");

    // check if the database connection is successful
    if(connection != null) {
      String selectQuery = "SELECT * FROM users WHERE email = ?";
      PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
      selectQueryPreparedStatement.setString(1, email);

      ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
      
      // if the resultSet value is true, email already exists
      if(selectQueryResultSet.next()) {
    	  if(selectQueryResultSet.getString("password").equals(password)) {
    		  String currentUserId = selectQueryResultSet.getString("id");
    		  Cookie userCookie = new Cookie("user_id", currentUserId);
    		  userCookie.setMaxAge(60*60*24);
    		  
    		  session.setAttribute("user_id", Integer.parseInt(currentUserId));
    		  
    		  response.addCookie(userCookie);
    		  
    		  response.sendRedirect("../index.jsp");
    	  }else {
    		  %>
    		  	<script>
    		  		alert('Invalid email or password!');
    		  		window.location.replace('../sign-in.html');
    		  	</script>
    		  <%
    	  }
      } else {
    	  %>
  	  	<script>
  	  		alert('Invalid email or password!');
  	  		window.location.replace('../sign-in.html');
  	  	</script>
  	  <%
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
