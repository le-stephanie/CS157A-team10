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
			 <link rel="stylesheet"href=
				"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
			<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    			pageEncoding="ISO-8859-1"%>
			<%@ page import="java.sql.*"%>
			<%@ page session="false" %>
			<title>Cat Search Page</title>
		</head>
		<body>
			<%
			String db = "anishell", 		
			username = "root", 			
			password = "Portal2",
			tableOne = "animal",
			tableTwo = "cat";
			
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
        	
        	<!-- Buttons to go to other Search Pages  -->
        	<div>
        		<a href="SearchDog.jsp">
        			<button type="button">Search Dog</button>
        		</a>
            	<a href="SearchBird.jsp">
            		<button type="button">Search Bird</button> 
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
            		<form action="CatResult.jsp" method = "Post">
            			<label for="age">Age(years): </label><br>
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
            			
            			<label for="cat_breed">Breed:</label><br>
            			<select name="cat_breed" id ="cat_breed">
            				<option value= "null">Default</option>
            				<option value="American Shorthair">American Shorthair</option>
            				<option value="Persian">Persian</option>
            				<option value="Bengal">Bengal</option>
            				<option value="Rag Doll">Rag Doll</option>
            			</select>
            			<br><br>
            			
            			<label for="color">Color:</label><br>
            			<select name="color" id="color">
            				<option value ="null">Default</option>
            				<option value="yellow">Yellow</option>
            				<option value="black">Black</option>
            				<option value="brown">Brown</option>
            				<option value="white">White</option>
            				<option value="orange">Orange</option>
            				<option value="tan">Tan</option>
            				<option value="blue">Blue</option>
            				<option value="orange">Orange</option>
            				<option value="grey">Grey</option>
            				<option value="red merle">Red Merle</option>
            			</select>
            			<br><br>
            			
            			<label for="indoor_outdoor">Indoor or Outdoor:</label><br>
            			<select name="indoor_outdoor" id="indoor_outdoor">
            				<option value="null">Default</option>
            				<option value="indoor">Indoor</option>
            				<option value="outdoor">Outdoor</option>
            			</select>
            			<br><br>
            			
            			<label for="litter_trained">Litter Trained:</label><br>
            			<select name="litter_trained" id="litter_trained">
            				<option value= "null">Default</option>
            				<option value="true">Yes</option>
            				<option value="false">No</option>
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
                        	<td>Breed</td>
                        	<td>Litter-Trained</td>
                        	<td>Indoor/Outdoor</td>
                        	<td>Link</td>
                    	</tr>
                    <%
					Statement stmt = con.createStatement();
                 	ResultSet rs = stmt.executeQuery("SELECT " + tableOne + ".name, " + tableOne + ".age, " + 
					tableOne + ".sex, " + tableOne + ".color, " + tableTwo + ".Cat_breed, "+ tableTwo + 
					".litter_trained, " + tableTwo + ".indoor_outdoor " + "FROM " + db + "." + tableOne + 
					", " + db +"." + tableTwo + " WHERE " + tableOne + ".pet_id" + " = " + tableTwo + ".pet_id;");
					while (rs.next()){
					%>
						<tr>
							<td><%=rs.getString("animal.name") %></td>
							<td><%=rs.getInt("animal.age") %></td>
							<td><%=rs.getString("animal.sex") %></td>
							<td><%=rs.getString("animal.color") %></td>
							<td><%=rs.getString("cat.cat_breed") %></td>
							<td><%=rs.getBoolean("cat.litter_trained") %></td>
							<td><%=rs.getString("indoor_outdoor") %></td>
						</tr>
					
				<%  } %>
					
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