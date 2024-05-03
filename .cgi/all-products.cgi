#!"C:\xampp\perl\bin\perl.exe"
use DBI;
use CGI ':standard';

print header;
print "<html lang='en'>";

print "<head>";
print "<link rel='stylesheet' href='../all-products.css'>";
  print "<meta charset='UTF-8'>";
  print "<meta http-equiv='X-UA-Compatible' content='IE=edge'>";
  print "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
  print "<title>All Products</title>";
print "</head>";

print "<body>";
  print "<!-- NAVBAR -->";
	  print "<section class='home-banner'>";
    print "<header>";
      print "<h3 class='logo'>The little things</h3>";
      print "<ul class='navigation'>";
        print "<li><a href='http://localhost:8080/EcommerceSite/index.jsp'>Home</a></li>";
        print "<li><a href='http://localhost/ecommerce-website/cgi/all-products.cgi'>All products</a></li>";
        print "<li><a href='http://localhost:8080/EcommerceSite/my-products.jsp'>My products</a></li>";
        print "<li><a href='http://localhost:8080/EcommerceSite/view-orders.jsp'>View orders</a></li>";
        print "<li><a href='http://localhost:8080/EcommerceSite/add-product.jsp'>Add product</a></li>";
        print "<li><a href='http://localhost:8080/EcommerceSite/profile.jsp'>Profile</a></li>";
        print "<li><a href='http://localhost:8080/EcommerceSite/jsp/logout.jsp'>Logout</a></li>";
      print "</ul>";
    print "</header>";
  print "</section>";

  print "<div class='top-content'>";
    print "<h2 class='products-heading' style='text-align: center;' id='allProducts'>All Products</h2>";
  print "</div>";
  print "<section class='all-products'>";
    print "<div class='grid'>";

    $my_connection = DBI->connect('DBI:mysql:ecommerce_site:localhost', 'root') ;
    $select_query = $my_connection->prepare("SELECT * FROM products");
    $result = $select_query->execute();

    while(($id,$name,$description,$price,$stock,$url,$user_id,$category) = $select_query->fetchrow()){
      print "<div class='grid-item'>";
        print "<div class='card'>";
          print "<img
            src='$url'
            alt='' class='card-img'>";
          print "<div class='card-content'>";
            print "<h1 class='card-header'>$name</h1>";
            print "<p class='card-text'>$description</p>";
            print "<a class='card-btn' href=''>View Product</a>";
          print "</div>";
        print "</div>";
      print "</div>";          
    }

    print "</div>";
  print "<script type='text/javascript' src='../javascript/show-alert.js'></script>";
  print "</section>";
print "</body>";

print "</html>";
