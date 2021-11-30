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
			<title>Bird Result Page</title>
		</head>
		<body>
			<%
			String db = "anishell", 		
			username = "root", 			
			password = "Turtle_1960",
			tableOne = "animal",
			tableTwo = "bird";
			
			String color = request.getParameter("color"), 
			bird_species = request.getParameter("species"), 
			handling = request.getParameter("handling"); 
			int age = Integer.parseInt(request.getParameter("age"));
			String find = " WHERE " + tableOne + ".pet_id" + " = " + tableTwo + ".pet_id";
			if(!color.equals("null")){
				find += " AND " + tableOne + ".color = " + "'" + color + "'";
			}
			if(!bird_species.equals("null")){
				find += " AND "+ tableTwo + ".bird_species = " + "'" + bird_species + "'";
			}
			if(!handling.equals("null")){
				find += " AND" + tableTwo + ".handling = " + "'" + handling + "'";
			}
			if(age != -1){
				find +=  " AND " + age + " = " + tableOne + ".age";
			}
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
                	<a href="user_profile.jsp" target="_self">Profile</a>
            	</h2>
        	</div>
        	<br><br><br><br>
        	
        	<a href="SearchBird.jsp">
        			<button type="button">Return to Search Bird</button>
    		</a>
    			
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
        		"FROM " + db + "." + tableOne + ", " + db +"." + tableTwo + find + ";");
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