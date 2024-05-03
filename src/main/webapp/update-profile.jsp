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
  <meta charset="utf-8">
  <title>Update Profile</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

  <style type="text/css">
    body {
      margin-top: 10px;
    }

    .avatar {
      width: 200px;
      height: 200px;
    }

    button {
      margin-left: 50%;
      width: 150px;
      height: 50px;
      border: 1px solid;
      border-color: white;
      border-radius: 10px;
    }

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
      background-color: #fff;
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
  </section><br><br>

  <div class="container bootstrap snippets bootdey">
    <h1 class="text-primary">Edit Profile</h1>
    <hr>
    <div class="alert alert-info alert-dismissable">
      <a class="panel-close close" data-dismiss="alert">×</a>
      <i class="fa fa-coffee"></i>
      <center>This is an <strong>alert</strong> for the user to display the important messages.</center>
    </div><br>
    <h3>Personal info</h3>
    <div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="https://az-pe.com/wp-content/uploads/2018/05/kemptons-blank-profile-picture.jpg"
            class="avatar img-circle img-thumbnail" alt="avatar">
        </div>
      </div>

      <!-- edit form column -->

      <div class="col-md-9 personal-info">
      	
      	<%
    String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
    String id = session.getAttribute("user_id").toString();
    	
    try {
    	// make database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(databaseUrl, "root", "");
        
        if(connection != null) {
        	String selectQuery = "SELECT * FROM users WHERE id = " + id;
            PreparedStatement selectQueryPreparedStatement = connection.prepareStatement(selectQuery);
            ResultSet selectQueryResultSet = selectQueryPreparedStatement.executeQuery();
            
            while(selectQueryResultSet.next()) {
            	
            	%>
            		<form class="form-horizontal" role="form" method="POST" action="./jsp/update-profile.jsp">
			          <div class="form-group">
			            <label class="col-lg-3 control-label">Username :</label>
			            <div class="col-lg-8">
			              <input required value="<%= selectQueryResultSet.getString("name") %>" class="form-control" name="name" type="text" placeholder="Enter your Username Here"><br>
			            </div>
			            <div class="form-group">
			              <label class="col-lg-3 control-label">Email:</label>
			              <div class="col-lg-8">
			                <input required readonly value="<%= selectQueryResultSet.getString("email") %>" name="email" class="form-control" type="text" placeholder=" Enter your Email Here">
			              </div>
			            </div>
			          </div>
			          <button type="submit" style="background-color:#ADD8E6"> Save Changes </button>
			        </form>
            	<%
            }
        }
    }catch(SQLException e) {
    	System.out.println(e.getMessage());
    }
    
    %>
      
      </div>
    </div>
    <hr>
  </div>

</body>

</html>
