<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
 <title> Add an Appointment</title>

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
        <span> Add an Animal </span>
        <!-- sign out button goes back to Employee Account.jsp-->
        <a href="employee_home.jsp">
            <button class='btn btn-success pull-right'>Return to Employee Account</button>
        </a>
</h1>

<body>
<form>
shelter_id:<br>
<input type="text" name="petId">
<br>
user_id:
<br>
<input type="text" name="user_id">
<br>
date (format: YYYY-MM-DD):<br>
<input type="text" name="date">
<br>
time (24 Hours):<br>
<input type="text" name="time">
<br>
<input type="submit" value="submit">
</form>
</body>

<%
HttpSession session = request.getSession();
String shelter_id = session.getAttribute("user_id").toString();
String user_id=request.getParameter("user_id");
String date=request.getParameter("date");
String time=request.getParameter("time");

String db = "anishell";
String user = "root";
String password = "Turtle_1960";

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password); //this part will need to change depending on your database
Statement st=con.createStatement();

int i=st.executeUpdate("insert into Contacts(shelter_id, user_id, date, time)values('"+shelter_id+"','"+user_id+"','"+date+"','"+time+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</html>