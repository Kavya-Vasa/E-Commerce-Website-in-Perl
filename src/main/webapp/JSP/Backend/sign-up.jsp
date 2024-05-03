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
  String name = request.getParameter("name");
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
    	  %>
    	  	<script>
    	  		alert('Email already exists');
    	  		window.location.replace('../sign-up.html');
    	  	</script>
    	  <%
    	  return;
      }else {
    	  String insertQuery = "INSERT INTO users(name, email, password) VALUES('"+name+"','"+email+"','"+password+"')";
    	  out.println(insertQuery + "\n");
    	  Statement insertStatement = connection.createStatement();
    	  
    	  int result = insertStatement.executeUpdate(insertQuery);
    	  if(result == 1) {
    		  String selectCurrentUser = "SELECT * FROM users WHERE email = ?";
    		  selectQueryPreparedStatement = connection.prepareStatement(selectCurrentUser);
    	      selectQueryPreparedStatement.setString(1, email);
    	      
    	      selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
    	      if(selectQueryResultSet.next()) {
    	    	  String currentUserId = selectQueryResultSet.getString("id");
    	    	  Cookie cookieUserId = new Cookie("user_id", currentUserId);
    	    	  cookieUserId.setMaxAge(60*60*24);
    	    	  
    	    	  session.setAttribute("user_id", Integer.parseInt(currentUserId));
    	    	  
    	    	  response.addCookie(cookieUserId);
    	    	  response.sendRedirect("../index.jsp");
    	      }
    	  }else {
    		  %>
	      	  	<script>
	      	  		alert('Something went wrong at our side. Try again!');
	      	  		window.location.replace('../sign-up.html');
	      	  	</script>
	      	  <%
    	  }
      }
	
    }else {
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
