<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("user");
%>
<link rel="stylesheet" href="../css/style.css">

<div class="topbar">
  <div class="logo"><a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Student Management</a></div>
  <div class="nav">
    <% if(user != null) { %>
      <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Dashboard</a>
      <a href="${pageContext.request.contextPath}/jsp/students.jsp">Students</a>
      <a href="${pageContext.request.contextPath}/jsp/teachers.jsp">Teachers</a>
      <a href="${pageContext.request.contextPath}/jsp/courses.jsp">Courses</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    <% } %>
  </div>
</div>
