<!-- code referenced:
https://stackoverflow.com/questions/28242661/passing-data-from-jsp-page-to-multiple-jsp-pages
https://stackoverflow.com/questions/4967482/redirect-pages-in-jsp
-->
<!-- redirect to employee home -->
<%
String user_id =  request.getParameter("username");
request.getSession(true).setAttribute("user_id",user_id);
String redirectURL = "http://localhost:8080//employee_home.jsp";
response.sendRedirect(redirectURL);
%>