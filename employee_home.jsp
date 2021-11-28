<!-- code referenced:
    https://www.studentstutorial.com/java-project/jsp-retrieve-data-using-mysql.php#
    https://www.geeksforgeeks.org/how-to-place-button-in-top-right-corner-using-bootstrap/
    https://agirlandhermac.design/resources/side-side-html-buttons/
-->

<!doctype html>
<html lang="en">
  <head>
    <title>Employee Home Page</title>
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
        <span> Employee Home Page </span>
        <!-- sign out button goes back to login.jsp-->
        <a href="login.jsp">
            <button class='btn btn-success pull-right'>Sign Out</button>
        </a>
    </h1>

    <% 
    String db = "anishell";
    String user = "root";
    String password = "Turtle_1960";
    %>
    
    <%
    // gets the string input from login page "username" 
    // as a String variable to use in SQL query
    String shelter_id = request.getParameter("username"); 

    try { 
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
        // out.println(db + " database successfully opened.<br/><br/>");
   
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM anishell.Shelter WHERE shelter_id =" + shelter_id);  // run SQL query
    
        while (rs.next()) { 
        %>
            <h2 class="mt-4"> You are signed into Shelter: <%= rs.getString(2) %> </h2>
        <% } %>
        

    <!-- REPLACE LINKS WITH ACTUAL ADD/DELETE PAGES -->
    <a href="employee_home.jsp">
    <button class="inline_button">Add a Pet to Shelter</button>
    </a>
    <a href="employee_home.jsp">
    <button class="inline_button">Remove a Pet to Shelter</button>
    </a>

    <table border="1">
    <tr>
        <td>Shelter_ID</td>
        <td>Name</td>
        <td>Address</td>
        <td>Phone Number</td>
    </tr>

    <%
        out.println("<br/><br/>Existing pets in Shelter:<br/>");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM anishell.Shelter");  
    
        while (rs.next()) { 
        %>
            <tr>
            <td> <%= rs.getInt(1) %> </td>
            <td> <%= rs.getString(2) %> </td>
            <td> <%= rs.getString(3) %> </td>
            <td> <%= rs.getString(4) %> </td>
            </tr>
    
        <% } %>

        </table> <!--  end of table -->
        
        <%
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
    %>

    <script src=
    "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
  </body>
</html>
