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
<h1>Update data from database in jsp</h1>
<form method="post" action="updateLastStep.jsp">
<input type="hidden" name="pet_id" value="<%=resultSet.getString("pet_id") %>">
ShelterId:<br>
<input type="text" name="shelter_id" value="<%=resultSet.getString("shelter_id") %>">
<br>
Name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
Age:<br>
<input type="text" name="age" value="<%=resultSet.getString("age") %>">
<br>
Color:<br>
<input type="text" name="color" value="<%=resultSet.getString("color") %>">
<br>
Sex:<br>
<input type="text" name="sex" value="<%=resultSet.getString("sex") %>">
<br>
Adoption Status:<br>
<input type="text" name="adoption_status" value="<%=resultSet.getString("adoption_status") %>">
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
