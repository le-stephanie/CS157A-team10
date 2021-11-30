<%@ page session="false" %>
<!-- Code referenced: https://www.studentstutorial.com/java-project/jsp-update-data.php -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "AniShell";
String userid = "group10";
String password = "@n1shell";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from testingAni where pet_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
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
<body>
<h1>Updating data from database</h1>
<form method="post" action="adopt3.jsp">
<input type="hidden" name="pet_id" value="<%=resultSet.getString("pet_id") %>" readonly>
ShelterId:<br>
<input type="text" name="shelter_id" value="<%=resultSet.getString("shelter_id") %>" readonly>
<br>
Name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>"readonly>
<br>
Age:<br>
<input type="text" name="age" value="<%=resultSet.getString("age") %>"readonly>
<br>
Color:<br>
<input type="text" name="color" value="<%=resultSet.getString("color") %>"readonly>
<br>
Sex:<br>
<input type="text" name="sex" value="<%=resultSet.getString("sex") %>"readonly>
<br>
Adoption Status: please change to 1 <br>
<input type="text" name="adoption_status" value="<%=resultSet.getString("adoption_status") %>">
<br>

Insert your User ID <br>
<input type="text" name="user_id">
<br>
	
	
<br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
