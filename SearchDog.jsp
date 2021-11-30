<%@ page session="false" %>
<!-- code referenced:
    https://stackoverflow.com/questions/22369717/how-to-pass-a-value-from-one-jsp-to-another-jsp-page
    https://newbedev.com/how-to-have-two-headings-on-the-same-line-in-html
    https://www.tutorialspoint.com/jsp/jsp_form_processing.htm
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
			password = "Turtle_1960",
			tableOne = "animal",
			tableTwo = "dog"; 		 		
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
            	<a href="SearchBird.jsp">
            		<button type="button">Search Bird</button> 
            	</a>
            	<a href="SearchBunny.jsp">
            		<button type="button">Search Bunny</button>
            	</a>
        	</div>
        	<br>
        	
        	<!-- Columns -->
        	<div class = "container">
        	<div class="row">
        	<!-- Left Column; Search checklist -->
            	<div class="column">
            		<form action= "DogResult.jsp" method = "POST">
            			<label for="age">Age(years): </label><br>
            			<select name="age" id="age">
            				<option value="-1">Default</option>
            				<option value= "0">0</option>
            				<option value= "1">1</option>
            				<option value= "2">2</option>
            				<option value= "3">3</option>
            				<option value= "4">4</option>
            				<option value= "5">5</option>
            				<option value= "6">6</option>
            				<option value= "7">7</option>
            				<option value= "8">8</option>
            				<option value= "9">9</option>
            				<option value= "10">10</option>
            			</select>
            			<br><br>
            			
            			<label for="color">Color:</label><br>
            			<select name="color" id="color">
            				<option value= "null">Default</option>
            				<option value="Gold">Gold</option>
            				<option value="Black">Black</option>
            				<option value="Brown">Brown</option>
            				<option value="White">White</option>
            				<option value="Red">Red</option>
            			</select>
            			<br><br>
            			
            			<label for="dog_breed">Breed:</label><br>
            			<select name="dog_breed" id="dog_breed">
            				<option value= "null">Default</option>
            				<option value="Bulldog">Bulldog</option>
            				<option value="Weiner dog">Weiner Dog</option>
            				<option value="Bloodhound">Blood Hound</option>
            				<option value="Golden Retriever">Golden Retriever</option>
            				<option value="Marmaduke">Marmaduke</option>
            				<option value="English Sheepdog">English Sheepdog</option>
            				<option value="Dalmation">Dalmation</option>
            				<option value="Giant">Giant</option>
            				<option value="English Sheepdog">English Sheepdog</option>
            				<option value="Husky">Husky</option>
            			</select>
            			<br><br>
            			
            			<label for="leash_trained">Leash Training:</label><br>
            			<select name="leash_trained" id="leash_trained">
            				<option value= "null">Default</option>
            				<option value= "true">Yes</option>
            				<option value= "false">No</option>
            			</select>
            			<br><br>
            			
            			<input type="submit" value="Find">
            			
            		</form>
            		<br>
            </div>
            <!-- Right Column, All Dog Table -->
            <div class="column">
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
					"FROM " + db + "." + tableOne + ", " + db +"." + tableTwo + " WHERE " + tableOne + ".pet_id" + " = " +
					tableTwo + ".pet_id;");
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