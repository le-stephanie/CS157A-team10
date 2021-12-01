<%@ page session="false" %>
<!-- code referenced:
    https://www.studentstutorial.com/java-project/jsp-retrieve-data-using-mysql.php#
    https://www.geeksforgeeks.org/how-to-place-button-in-top-right-corner-using-bootstrap/
    https://agirlandhermac.design/resources/side-side-html-buttons/
    https://www.w3schools.com/html/tryit.asp?filename=tryhtml_table_cellpadding
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

    td {
    padding: 5px;
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
    // set shelter_id as a variable so that this value can persist through html pages
    HttpSession session = request.getSession();
    String shelter_id = session.getAttribute("user_id").toString();

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
    <a href="add_animal.jsp">
    <button class="inline_button">Add a Pet to Shelter</button>
    </a>
    
    <a href="delete_animal.jsp">
    <button class="inline_button">Remove a Pet to Shelter</button>
    </a>

    <a href="updateProcess.jsp">
    <button class="inline_button">Update Animal Details</button>
    </a>

    <!--
    <a href="add_appt.jsp">
    <button class="inline_button">Add an Appointment</button>
    </a>
    -->

    <table border="1">
    <tr>
        <td>Pet ID</td>
        <td>Name</td>
        <td>Age</td>
        <td>Color</td>
        <td>Sex</td>
        <td>Adoption Status</td>
    </tr>

    <%
        out.println("<br/><br/>Existing pets in shelter:<br/>");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM anishell.Animal WHERE shelter_id =" + shelter_id);  
    
        while (rs.next()) { 
        %>
            <!-- name, age, color, sex, adoption status -->
            <tr>
            <td> <%= rs.getInt(1) %> </td>
            <td> <%= rs.getString(3) %> </td>
            <td> <%= rs.getInt(4) %> </td>
            <td> <%= rs.getString(5) %> </td>
            <td> <%= rs.getString(6) %> </td>
            <td> <%= rs.getBoolean(7) %> </td>
            </tr>
    
        <% } %>

        </table> <!--  end of table -->

    <table border="1">
    <tr>
        <td>Date</td>
        <td>Time</td>
        <td>User ID</td>
        <td>Username</td>
        <td>Phone Number</td>
    </tr>

    <%
        out.println("<br/><br/>Upcoming appointments:<br/>");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT date, time, u.user_id, u.user_name, u.contact_info" +
        " FROM Shelter s, Contacts c, User u WHERE u.user_id = c.user_id" +
        " AND s.shelter_id = c.shelter_id AND s.shelter_id =" + shelter_id);  
    
        while (rs.next()) { 
        %>
            <tr>
            <td> <%= rs.getDate(1) %> </td>
            <td> <%= rs.getTime(2) %> </td>
            <td> <%= rs.getInt(3) %> </td>
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
