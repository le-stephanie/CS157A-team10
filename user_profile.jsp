<!-- code referenced:
    https://www.studentstutorial.com/java-project/jsp-retrieve-data-using-mysql.php#
    https://www.geeksforgeeks.org/how-to-place-button-in-top-right-corner-using-bootstrap/
    https://agirlandhermac.design/resources/side-side-html-buttons/
    https://www.w3schools.com/html/tryit.asp?filename=tryhtml_table_cellpadding
-->

<!doctype html>
<html lang="en">
  <head>
    <title>User Profile</title>
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

    td {
    padding: 5px;
    }
    </style>
    
  </head>
  <body class="py-4">
    
  <div class="container">
    <h1>
        <span> User Profile </span>
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
    // gets the string input from login.jsp page "username" 
    // as a String variable to use in SQL query
    String user_id = request.getParameter("username"); 

    try { 
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
        // out.println(db + " database successfully opened.<br/><br/>");
   
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT user_name FROM anishell.User WHERE user_id =" + user_id);  // run SQL query
    
        while (rs.next()) { 
        %>
            <h2 class="mt-4"> You are signed in as: <%= rs.getString(1) %> </h2>
        <% } %>
        

    <!-- REPLACE LINKS WITH ACTUAL ADD/DELETE PAGES -->
    <a href="home.jsp">
    <button class="inline_button">Go Back to Home</button>
    </a>

    <table border="1">
    <tr>
        <td>Shelter Name</td>
        <td>Animal Name</td>
        <td>Animal Age (years)</td>
        <td>Animal Color</td>
        <td>Animal Sex</td>
    </tr>

    <%
        out.println("<br/><br/>Pet(s) you applied for:<br/>");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT s.name, a.name, a.age, a.color, a.sex" +
        " FROM Animal a, User u, Adopt_Surrender ads, Shelter s" +      
        " WHERE u.user_id = ads.user_id AND ads.pet_id = a.pet_id AND a.shelter_id = s.shelter_id" +
        " AND ads.status = \"adopt\" AND ads.user_id = " + user_id);  
    
        while (rs.next()) { 
        %>
            <tr>
            <td> <%= rs.getString(1) %> </td>
            <td> <%= rs.getString(2) %> </td>
            <td> <%= rs.getInt(3) %> </td>
            <td> <%= rs.getString(4) %> </td>
            <td> <%= rs.getString(5) %> </td>
            </tr>
    
        <% } %>

        </table> <!--  end of table -->

    <table border="1">
    <tr>
        <td>Date</td>
        <td>Time</td>
        <td>Shelter Name</td>
        <td>Shelter Address</td>
        <td>Shelter Phone Number</td>
    </tr>

    <%
        out.println("<br/><br/>Upcoming appointments:<br/>");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT date, time, s.name, s.address, s.phone_number" +
        " FROM Shelter s, Contacts c, User u WHERE u.user_id = c.user_id" +
        " AND s.shelter_id = c.shelter_id AND u.user_id =" + user_id);  
    
        while (rs.next()) { 
        %>
            <!-- date, time, shelter name, shelter addr, shelter phone# -->
            <tr>
            <td> <%= rs.getDate(1) %> </td>
            <td> <%= rs.getTime(2) %> </td>
            <td> <%= rs.getString(3) %> </td>
            <td> <%= rs.getString(4) %> </td>
            <td> <%= rs.getString(5) %> </td>
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
