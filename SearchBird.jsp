<%@ page session="false" %>
<!-- code referenced:
    https://www.studentstutorial.com/java-project/jsp-retrieve-data-using-mysql.php#
    https://www.geeksforgeeks.org/how-to-place-button-in-top-right-corner-using-bootstrap/
    https://agirlandhermac.design/resources/side-side-html-buttons/
    https://www.w3schools.com/howto/howto_website.asp
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
			<title>Bird Search Page</title>
		</head>
		<body>
			<%
			String db = "anishell", 		
			username = "root", 			
			password = "Turtle_1960",
			tableOne = "animal",
			tableTwo = "bird";	 		
			try {
				java.sql.Connection con;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, username, password);
			%>
			
			<div style="clear: both">
            	<h1 style="float: left">
                	<a href="home.jsp" target="_self">AniShell</a>
            	</h1>
            	<h2 style="float: right">
                	<a href="login.jsp" target="_self">Sign Out</a>
            	</h2>
        	</div>
        	<br><br><br><br>
        	
        	<!-- Buttons to go to other Search Pages  -->
        	<div>
        		<a href="SearchCat.jsp">
        			<button type="button">Search Cat</button>
        		</a>
            	<a href="SearchDog.jsp">
            		<button type="button">Search Dog</button> 
            	</a>
            	<a href="SearchBunny.jsp">
            		<button type="button">Search Bunny</button>
            	</a>
        	</div>
        	<br>
        	
        	<!-- Columns -->
        	<div class="container">
        	<div class="row">
        	<!-- Left Column; Search checklist -->
            	<div class="column">
            	<form action="BirdResult.jsp" method = "POST">
            			<label for="age">Age: </label><br>
            			<select name="age" id="age">
            				<option value="-1">Default</option>
            				<option value="0">0</option>
            				<option value="1">1</option>
            				<option value="2">2</option>
            				<option value="3">3</option>
            				<option value="4">4</option>
            				<option value="5">5</option>
            				<option value="6">6</option>
            				<option value="7">7</option>
            				<option value="8">8</option>
            				<option value="9">9</option>
            				<option value="10">10</option>
            				<option value="11">11</option>
            				<option value="12">12</option>
            				<option value="13">13</option>
            				<option value="14">14</option>
            				<option value="15">15</option>
            				<option value="16">16</option>
            			</select>
            			<br><br>
            			
            			<label for="color">Color:</label><br>
            			<select name="color" id="color">
            				<option value="null">Default</option>
            				<option value="Yellow">Yellow</option>
            				<option value="Black">Black</option>
            				<option value="Brown">Brown</option>
            				<option value="White">White</option>
            				<option value="Red">Red</option>
            				<option value="Green">Green</option>
            				<option value="Blue">Blue</option>
							<option value="Grey">Grey</option>
                            <option value="Purple">Purple</option>
            			</select>
            			<br><br>
            			
            			<label for="species">Species:</label><br>
            			<select name="species" id="species">
            				<option value="null">Default</option>
            				<option value="Angry Bird">Angry Bird</option>
            				<option value="Woodpecker">Woodpecker</option>
            				<option value="Mc Awk">Mc Awk</option>
            				<option value="Parrot">Parrot</option>
            				<option value="Parakeet">Parakeet</option>
            			</select>
            			<br><br>
            			
            			<label for="handling">Handling:</label><br>
            			<select name="handling" id="handling">
            				<option value="null">Default</option>
            				<option value="Trained">Trained</option>
            				<option value="Angry">Angry</option>
            				<option value="Legendary">Legendary</option>
            				<option value="Exotic">Exotic</option>
            				<option value="Wild">Wild</option>
            				<option value="Friendly">Friendly</option>
            			</select>
            			<br><br>
            			
            			<input type="submit" value="Find">
            		</form>
            </div>
            <!-- Right Column, Search Result -->
            <div class="column">
                <table border = "1">
                    <tr>
                        <td>Name</td>
                        <td>Age</td>
                        <td>Sex</td>
                        <td>Color</td>
                        <td>Species</td>
                        <td>Handling</td>
                    </tr>
                <%
					Statement stmt = con.createStatement();
                	ResultSet rs = stmt.executeQuery("SELECT " + tableOne + ".name, " + tableOne + ".age, " + tableOne + ".sex, " 
    				+ tableOne + ".color, " + tableTwo + ".bird_species, "+ tableTwo + ".handling " + 
    				"FROM " + db + "." + tableOne + ", " + db +"." + tableTwo + " WHERE " + tableOne + ".pet_id" + " = " +
    				tableTwo + ".pet_id");
					while (rs.next()){
						%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getInt(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6) %></td>
						</tr>
					
					<%}%>
					
					</table>
					
					<% 
					stmt.close();
					con.close();
					rs.close();	
					
					} catch (SQLException e) {
						out.println("SQLException caught: " + e.getMessage());
					}
					%>
            </div>
        </div>
        </div>
        <script src=
    "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    </script>
		</body>
	</html>