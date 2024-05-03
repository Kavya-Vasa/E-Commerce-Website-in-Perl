<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import = "java.io.*" %>  
<%@page import = "java.sql.*"%>

<html>
<head>
<title>Place order verification</title>
</head>
<body>

<%
  // fetch and store form data -
  String userId = session.getAttribute("user_id").toString();
  String productId = request.getParameter("product_id");
  String address = request.getParameter("address");
  String quantity = request.getParameter("quantity");
  String totalPrice = request.getParameter("total_price");
  String paymentMethod = request.getParameter("payment_method");
  
  String databaseUrl = "jdbc:mysql://localhost:3306/ecommerce_site";
  try {
    // make database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(databaseUrl, "root", "");

    // check if the database connection is successful
    if(connection != null) {
    	String insertOrderQuery = "INSERT INTO orders(address, quantity, total_price, product_id, payment_method, user_id) VALUES('" + address + "','" + quantity + "','" + totalPrice + "','" + productId + "','" + paymentMethod + "','" + userId + "')";
    	Statement insertOrderStatement = connection.createStatement();
    	int insertOrderResult = insertOrderStatement.executeUpdate(insertOrderQuery);
    	
    	if(insertOrderResult == 1) {
    		String selectOrderId = "SELECT * FROM orders WHERE user_id = '" + userId + "' and product_id = '" + productId + "'";
   			PreparedStatement selectOrderIdPreparedStatement = connection.prepareStatement(selectOrderId);
            ResultSet selectOrderIdResultSet = selectOrderIdPreparedStatement.executeQuery();
            
            while(selectOrderIdResultSet.next()) {
            	String orderId = selectOrderIdResultSet.getString("id");
            	
            	String insertUserProductQuery = "INSERT INTO user_products(user_id, product_id, order_id) VALUES('" + userId + "','" + productId + "','" + orderId + "')";
            	Statement insertUserProductStatement = connection.createStatement();
            	int insertUserProductResult = insertUserProductStatement.executeUpdate(insertUserProductQuery);
            	
            	if(insertUserProductResult == 1) {
            		%>
            			<script>
            				window.location.replace("../index.jsp");
            			</script>
            		<%
            	}else {
            		%>
            	  	<script>
            	  		alert('Something went wrong while storing user products!');
            	  		window.location.replace('../index.jsp');
            	  	</script>
            	  <%
            	}
            }
    	}
    }
  }catch (SQLException e) {
	  System.out.println(e.getMessage());
  }
  
  %>

</body>
</html>
