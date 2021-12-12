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
			<title>Bunny Search Page</title>
		</head>
		<body>
			<%
				String db = "anishell", 		
				username = "root", 			
				password = "Portal2",
				tableOne = "animal",
				tableTwo = "bunny"; 		 		

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
        		<a href="SearchCat.jsp">
        			<button type="button">Search Cat</button>
        		</a>
            	<a href="SearchBird.jsp">
            		<button type="button">Search Bird</button> 
            	</a>
            	<a href="SearchDog.jsp">
            		<button type="button">Search Dog</button>
            	</a>
        	</div>
        	<br>
        	
        	<!-- Columns -->
        	<div class="row">
        	<!-- Left Column; Search checklist -->
            	<div class="column">
            		<form action="BunnyResult.jsp">
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
            			</select>
            			<br><br>
            			
            			<label for="color">Color:</label><br>
            			<select name="color" id="color">
            				<option value="null">Default</option>
            				<option value="black">Black</option>
            				<option value="brown">Brown</option>
            				<option value="white">White</option>
            				<option value="tan">Tan</option>
            				<option value="grey">Grey</option>
            				<option value="brindle">Brindle</option>
            				<option value="blue merle">Blue Merle</option>
            				<option value="red merle">Red Merle</option>
            			</select>
            			<br><br>
            			
            			<label for="bunny_breed">Breed:</label><br>
            			<select name="bunny_breed" id="bunny_breed">
            				<option value="null">Default</option>
            				<option value="Holland Lop">Holland Lop</option>
            				<option value="Dutch">Dutch</option>
            			</select>
            			<br><br>
            			
            			<input type="submit" value="Find">
            		</form>
            </div>
            <!-- Right Column, Search Result -->
            <div class="container">
            <div class="column">
                <table border = "1">
                    <tr>
                        <td>Name</td>
                        <td>Age</td>
                        <td>Sex</td>
                        <td>Color</td>
                        <td>Breed</td>
                    </tr>
                 <%
					Statement stmt = con.createStatement();
                 	ResultSet rs = stmt.executeQuery("SELECT " + tableOne + ".name, " + tableOne + ".age, " + 
					tableOne + ".sex, " + tableOne + ".color, " + tableTwo + ".bunny_breed "+ " FROM " + db + "." +
                 	tableOne + ", " + db +"." + tableTwo + " WHERE " + tableOne + ".pet_id" + " = " + tableTwo + ".pet_id;");
					while (rs.next()){
						%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getInt(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
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