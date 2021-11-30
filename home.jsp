<%@ page session="false" %>
<!-- code referenced:
    https://www.studentstutorial.com/java-project/jsp-retrieve-data-using-mysql.php#
    https://www.geeksforgeeks.org/how-to-place-button-in-top-right-corner-using-bootstrap/
    https://agirlandhermac.design/resources/side-side-html-buttons/
    https://www.w3schools.com/howto/howto_website.asp
-->

<!doctype html>
<html lang="en">
  <head>
    <title> Home Page</title>
    <%@ page import="java.sql.*" %>

    <!-- Custom styles for this template -->
    <link rel="stylesheet"
          href=
"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
    <style>
    .inline_button {
        display: inline-block;
        margin: 5px; /* space between buttons */
        background-color: #60cadd;
        color:rgb(0, 0, 0);
        border-color: #233b4b;
    }
    .inline_button:hover, .inline_button:focus, .inline_button:active, .inline_button.active, .open .dropdown-toggle.inline_button {
        background-color: #224257;
        color:#FFF;
        border-color: #31347B;
    }
    </style>
    
  </head>
  <body class="py-4">
    
  <div class="container">
    <h1>
        <span> Home Page </span>
        <!-- sign out button goes back to login.jsp-->
        <a href="login.jsp">
            <button class='btn btn-success pull-right'>Sign Out</button>
        </a>
	
	<br>
        <a href="user_profile.jsp">
            <button class='btn btn-success pull-right'>User Profile</button>
        </a>
    </h1>
    
    
    
    <section class="" style="max-width:600px">
  	<h2 class="w3-wide">Welcome to AniShell</h2>
  	<p class="w3-justify">Please Click on an Animal to get started </p>
	</section>
	
    <!-- Navigate to Search for Dogs, Cats, Birds, or Rabbits -->
    <a href="SearchDog.jsp">
    <button class="inline_button">Dogs</button>
    </a>
    <a href="SearchCat.jsp">
    <button class="inline_button">Cats</button>
    </a>
     <a href="SearchBird.jsp">
    <button class="inline_button">Birds</button>
    </a>
     <a href="SearchBunny.jsp">
    <button class="inline_button">Rabbits</button>
    </a>

    <br/>
    <a href="adopt1.jsp">
    <button class="inline_button">Adopt an Animal</button>
    </a>
       
</body>
</html>