<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
<title>AniShell Connection Example</title> <%//This changes the name of the tab above %>
</head>
<body>
	<h1>AniShell Connection Example</h1>	<%//This changes the name of bold header %>

	<%
	String db = "testProjectSchema", 		//For hw1, this is your last name
			username = "group10", 			//By default, this should be root
			password = "@n1shell"; 	//This PW was defined when you set up MySQL
			//table = "AniShell";		 		//For hw1, this is hw1

	try {
		/*
			The code below is how we are conneceting to the MySQL databse.
			The mysql-connector-java.jar file uploaded earlier gives us the
			ability to talk/connect to a specified database (with the right
			credentials), and then modify the data as needed.
		*/
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, username, password);
		out.println("*" + db + "* database successfully opened.");
	%>
	
	 <table border="1">
      <tr>
        <td>Age</td>
        <td>Name</td>
        <td>Breed</td>
        <td>Color</td>
        <td>Location</td>
        <td>Adoption Status</td>
        <td>Animal Shelter</td>
        <td>Shelter ID</td>
		</tr>
	</table>
	
	<%
		/*
			This code gathers, and then displays the information retreived 
			from the specified database.
			
			Notice however, that this code can retrieve 3 different items in the
			sequence int, string, string
		*/
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from " + db + ".Cats");
		while (rs.next())
			out.println("<br>" + rs.getInt(1) + " | " + rs.getString(2) + " | " + rs.getString(3)+ " | " 
			+ rs.getString(4)+ " | " + rs.getString(5) + " | " + rs.getString(6)+ " | " + rs.getString(7)
			+ " | " + rs.getInt(8));
		%>
		
		 <table border="1">
	      <tr>
	        <td>Age</td>
	        <td>Name</td>
	        <td>Breed</td>
	        <td>Color</td>
	        <td>Location</td>
	        <td>Adoption Status</td>
	        <td>Animal Shelter</td>
	        <td>Shelter ID</td>
			</tr>
		</table>
		<%
		
		rs = stmt.executeQuery("select * from " + db + ".Dogs");
		while (rs.next())
			out.println("<br>" + rs.getInt(1) + " | " + rs.getString(2) + " | " + rs.getString(3)+ " | " 
			+ rs.getString(4)+ " | " + rs.getString(5) + " | " + rs.getString(6)+ " | " + rs.getString(7)
			+ " | " + rs.getInt(8));
		%>
		<table border="1">
	      <tr>
	        <td>Name</td>
	        <td>Location</td>
	        <td>Shelter Id</td>
			</tr>
		</table>
		<%
		rs = stmt.executeQuery("select * from " + db + ".Shelters");
		while (rs.next())
			out.println("<br>" + rs.getString(1) + " | " + rs.getString(2) + " | " + rs.getInt(3));
		
		
		
		%>
		<table border="1">
	      <tr>
	        <td>User Id</td>
	        <td>First Name</td>
	        <td>Last Name</td>
			</tr>
		</table>
		<%
		
		rs = stmt.executeQuery("select * from " + db + ".Users");
		while (rs.next())
			out.println("<br>" + rs.getInt(1) + " | " + rs.getString(2) + " | " + rs.getString(3));
		
		
		con.close();

	} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
	%>

</body>
</html>