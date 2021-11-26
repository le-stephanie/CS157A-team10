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

    <h2 class="mt-4">You are signed in as: Employee# <%= request.getParameter("username")%></h2>
    
    <!-- REPLACE LINKS WITH ACTUAL ADD/DELETE PAGES -->
    <a href="employee_home.jsp">
    <button class="inline_button">Add a Pet to Shelter</button>
    </a>
    <a href="employee_home.jsp">
    <button class="inline_button">Remove a Pet to Shelter</button>
    </a>

    <% 
    String db = "le";
    String user = "root";
    String password = "Turtle_1960";
    %>

    <table border="1">
    <tr>
        <td>SJSU_ID</td>
        <td>Name</td>
        <td>Major</td>
    </tr>

    <%
    try { 
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
        // out.println(db + " database successfully opened.<br/><br/>");
        
        out.println("Existing pets in Shelter: <br/>");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM le.HW1");  
    
        while (rs.next()) { 
        %>
            <tr>
            <td> <%= rs.getString(1) %> </td>
            <td> <%= rs.getString(2) %> </td>
            <td> <%= rs.getString(3) %> </td>
            </tr>
        <%
        } 
        rs.close();
        stmt.close();
        con.close();
        } catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }
    %>
        </table>

    <script src=
    "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
  </body>
</html>
