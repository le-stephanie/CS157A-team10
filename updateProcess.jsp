<%@ page session="false" %>
<!-- Code referenced: https://www.studentstutorial.com/java-project/jsp-update-data.php -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String db = "anishell";
String userid = "root";
String password = "Turtle_1960";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<html>
<body>
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
<h1>Retrieve data from database</h1>
<table border="1">
<tr>
<td>petId</td>
<td>shelterID</td>
<td>name</td>
<td>age</td>
<td>color</td>
<td>sex</td>
<td>adoption status</td>
</tr>
<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",userid, password); //this part will need to change depending on your database
Statement st=con.createStatement();
String sql ="select * from Animal";
ResultSet resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("pet_id") %></td>
<td><%=resultSet.getString("shelter_id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("color") %></td>
<td><%=resultSet.getString("sex") %></td>
<td><%=resultSet.getString("adoption_status") %></td>
<td><a href="update.jsp?id=<%=resultSet.getString("pet_id")%>">update</a></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
    <br/>
    <a href="employee_home.jsp">
    <button class="inline_button">Return to Employee Home</button>
    </a>
</body>
</html>