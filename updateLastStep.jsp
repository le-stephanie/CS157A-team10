<%@ page session="false" %>
<!-- Code referenced: https://www.studentstutorial.com/java-project/jsp-update-data.php -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/AniShell";%>
<%!String user = "group10";%>
<%!String psw = "@n1shell";%>
<%
String petId = request.getParameter("pet_id");
String shelterId=request.getParameter("shelter_id");
String name=request.getParameter("name");
String age=request.getParameter("age");
String color=request.getParameter("color");
String sex=request.getParameter("sex");
String adoptionStatus=request.getParameter("adoption_status");
if(petId != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(petId);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update testingAni set pet_id=?,shelter_id=?,name=?,age=?,color=?,sex=?,adoption_status=? where pet_id="+petId;
ps = con.prepareStatement(sql);
ps.setString(1,petId);
ps.setString(2, shelterId);
ps.setString(3, name);
ps.setString(4, age);
ps.setString(5, color);
ps.setString(6, sex);
ps.setString(7, adoptionStatus);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
%>
 <a href="employee_home.jsp">
 <button class="inline_button">Return to Employee Home</button>
