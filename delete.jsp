<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!-- NOTE: 
1. use this to create a test table into your AniShell DB
			use AniShell;
		CREATE TABLE testingAni(
	pet_id int,
	shelter_id int ,
	name CHAR(30),
	age INT,
	color CHAR(30),
	sex CHAR(1), 
	adoption_status BOOLEAN,
	PRIMARY KEY(pet_id, shelter_id)
);
 


2. in line 49 there's a note regarding chan  -->

<!DOCTYPE html>
<html>
 <title> Delete an Animal</title>

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
<h1>
        <span> Delete an Animal </span>
        <!-- sign out button goes back to Employee Account.jsp-->
        <a href="employee_home.jsp">
            <button class='btn btn-success pull-right'>Return to Employee Account</button>
        </a>
</h1>

<body>
<form>
pet_id:<br>
<input type="text" name="petId">
<br>
shelter_id
<br>
<input type="text" name="shelId">
<br>
name:<br>
<input type="text" name="name">
<br>
age:<br>
<input type="text" name="age">
<br>
color:<br>
<input type="text" name="color">
<br>
sex (M or F):<br>
<input type="text" name="sex">
<br>
status (0: for unadopted || 1: for adopted):<br>
<input type="text" name="status">
<input type="submit" value="submit">
</form>
</body>

<%
String petId=request.getParameter("petId");
String shelId=request.getParameter("shelId");
String name=request.getParameter("name");
String age=request.getParameter("age");
String color=request.getParameter("color");
String sex=request.getParameter("sex");
String status=request.getParameter("status");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AniShell", "group10", "@n1shell"); //this part will need to change depending on your database
Statement st=conn.createStatement();

int i=st.executeUpdate("DELETE FROM testingAni WHERE pet_id="+petId); //this is the part i'm stuck at 
out.println("Data is successfully deleted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</html>
