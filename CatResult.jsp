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
			<title>Cat Result Page</title>
		</head>
		<body>
			<%
			String db = "anishell", 		
			username = "root", 			
			password = "Portal2",
			tableOne = "animal",
			tableTwo = "cat";
			
			String cat_breed = request.getParameter("cat_breed"),
			color = request.getParameter("color");
			int age = Integer.parseInt(request.getParameter("age"));
			String indoor_outdoor = request.getParameter("indoor_outdoor");
			String litter_trained = request.getParameter("litter_trained");
			
			String find = " WHERE " + tableOne + ".pet_id" + " = " +tableTwo + ".pet_id";
			if(!cat_breed.equals("null")){
				find += " AND "+ tableTwo + ".Cat_breed = " + "'" + cat_breed + "'";
			}
			if(!color.equals("null")){
				find += " AND animal.color = " + "'" + color + "'";
			}
			if(age != -1){
				find += " AND animal.age = "+ age;
			}
			if(!litter_trained.equals("null")){
				find += " AND cat.leash_trained = " + Boolean.parseBoolean(litter_trained);
			}
			if(!indoor_outdoor.equals("null")){
				find +=  " AND cat.indoor_outdoor = " + "'" + indoor_outdoor + "'";
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
        	
            <table border = "1">
            	<tr>
                	<td>Name</td>
                    <td>Age</td>
                  	<td>Sex</td>
                  	<td>Color</td>
                    <td>Breed</td>
                    <td>Litter-Trained</td>
                    <td>Indoor/Outdoor</td>
                </tr>
                
                <%
				Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT " + tableOne + ".name, " + tableOne + ".age, " + 
    			tableOne + ".sex, " + tableOne + ".color, " + tableTwo + ".Cat_breed, "+ tableTwo + 
    			".litter_trained, " + tableTwo + ".indoor_outdoor " + "FROM " + db + "." + tableOne + 
    			", " + db +"." + tableTwo + find + ";");
				while (rs.next()){
				%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getInt(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getBoolean(6) %></td>
						<td><%=rs.getString(7) %></td>
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
				<a href="CatSearch.jsp">
        			<button type="button">Return to Search Cat</button>
    			</a>
            
        <script src=
    		"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    	</script>
   	 	<script src=
    		"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
    	</script>
	</body>
</html>