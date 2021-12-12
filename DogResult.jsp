<!-- code referenced:
	https://stackoverflow.com/questions/22369717/how-to-pass-a-value-from-one-jsp-to-another-jsp-page
    https://newbedev.com/how-to-have-two-headings-on-the-same-line-in-html
-->
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<link rel="stylesheet" href=
				"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
			<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    			pageEncoding="ISO-8859-1"%>
			<%@ page import="java.sql.*"%>
			<%@ page session="false" %>
			<title>Dog Search Page</title>
		</head>
		<body>
			<%
			String db = "anishell", 		
			username = "root", 			
			password = "Portal2", //Switch with your own password
			tableOne = "animal",
			tableTwo = "dog";
			
			String dog_breed = request.getParameter("dog_breed"),
			color = request.getParameter("color");
			int age = Integer.parseInt(request.getParameter("age"));
			String trained = request.getParameter("leash_trained");
			String find = "WHERE " + tableOne + ".pet_id" + " = " +tableTwo + ".pet_id";
			if(!dog_breed.equals("null")){
				find += " AND " + "dog_breed = " + "'" + dog_breed + "'";
			}
			if(!color.equals("null")){
				find +=  " AND animal.color = " + "'" + color + "'";
			}
			if(age != -1){
				find +=  " AND animal.age = "+ age;
			}
			if(!trained.equals("null")){
				find += " AND dog.leash_trained = " + Boolean.parseBoolean(trained);
			}
			try {
				java.sql.Connection con;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, username, password);
			%>
			
			<div style="clear: both">
            	<h1 style="float: left">
                	<a href="homepage.jsp" target="_self">AniShell</a>
            	</h1>
            	<h2 style="float: right">
                	<a href="user_profile.jsp" target="_self">User Profile</a>
            	</h2>
        	</div>
        	<br><br><br><br>
        	
        	<a href="SearchDog.jsp">
        		<button type="button">Return to Search Dog</button>
    		</a>
    			
            <table border = "1">
            	<tr>
                	<td>Name</td>
                    <td>Age</td>
                    <td>Sex</td>
                    <td>Color</td>
                    <td>Breed</td>
                    <td>Leash-Trained</td>
                </tr>
                
                <%
				Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT " + tableOne + ".name, " + tableOne + ".age, " +
    			tableOne + ".sex, " + tableOne + ".color, " + tableTwo + ".dog_breed, "+ tableTwo + ".leash_trained " + 
    			"\nFROM " + db + "." + tableOne + ", " + db +"." + tableTwo + "\n " + find + ";");
				while (rs.next()){
				%>
					<tr>
						<td><%=rs.getString("animal.name") %></td>
						<td><%=rs.getInt("animal.age") %></td>
						<td><%=rs.getString("animal.sex") %></td>
						<td><%=rs.getString("animal.color") %></td>
						<td><%=rs.getString("dog.dog_breed") %></td>
						<td><%=rs.getBoolean("dog.leash_trained") %></td>
						 <!--<td> </td> Go to animal details page -->
					</tr>
					
				<%}%>
				</table> <!-- End of Table -->
					
				<% 
				stmt.close();
				con.close();
				rs.close();	
					
				} catch (SQLException e) {
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