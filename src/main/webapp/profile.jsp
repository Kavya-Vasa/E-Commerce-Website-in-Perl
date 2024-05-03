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
  <title>Profile</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
}

/* NAVIGATION */
.home-banner {
  position: relative;
  width: 100%;
  min-height: 10vh;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.home-banner header {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  padding: 20px !important;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header .logo {
  font-size: 24px;
  font-weight: 600;
  color: white;
  padding: 15px;
  border-radius: 50%;
  background: black;
}

header .navigation {
  position: relative;
  display: flex;
}

header .navigation li {
  list-style: none;
}

header .navigation li a {
  display: inline-block;
  color: #000;
  font-weight: 500px;
  text-decoration: none;
  margin-left: 20px;
  font-size: 18px;
}
.card {
  max-width: 340px;
  overflow-y: auto;
  position: relative;
  z-index: 1;
  overflow-x: hidden;
  background-color: rgba(255, 255, 255, 1);
  display: flex;
  transition: 0.3s;
  flex-direction: column;
  border-radius: 10px;
  box-shadow: 0 0 0 8px rgba(255, 255, 255, 0.2);
  margin-top: 80px;
  margin-left: 35%;
}

.title {
  color: grey;
  font-size: 18px;
}

.update-profile-btn {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
body
{
 background: url('./images/profile-bg.jpg');
 background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  display: flex;
  flex-wrap: wrap;
  padding: 20px;
  text-align: center;
}
</style>
</head>

<body>
  <!-- NAVBAR -->
  <section class="home-banner">
    <header>
      <h3 class="logo">The Little Things</h3>
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
  </section>
<div class="card">
  <img src="https://az-pe.com/wp-content/uploads/2018/05/kemptons-blank-profile-picture.jpg" alt="William Forbes" style="height:250px">
  <%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  	String userId = session.getAttribute("user_id").toString();
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM users WHERE id = " + userId;
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
            
            while(selectQueryResultSet.next()) {
            	%>
            		<h1><%= selectQueryResultSet.getString("name") %></h1>
  					<p class="title">Email: <%= selectQueryResultSet.getString("email") %></p>
            	<%
            }
        }
    }catch(SQLException e) {
    	System.out.println(e.getMessage());
    }
    
    %>
  <div style="margin: 24px 0;">
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
  </div>
  <p><a href="./update-profile.jsp" class="update-profile-btn">Update Profile</a></p>
</div>
</body>

</html>
