<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Student Management</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">Student Management</div>
    <div class="menu">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="students.jsp">Students</a>
        <a href="teachers.jsp">Teachers</a>
        <a href="courses.jsp">Courses</a>
        <a href="<%=request.getContextPath()%>/logout">Logout</a>
    </div>
</div>

<!-- Main Container -->
<div class="container">

    <h2>Welcome, <%= session.getAttribute("user") %></h2>

    <div class="card-grid">

        <div class="card">
            <h3>Students</h3>
            <p>Manage student records</p>
            <a class="btn" href="students.jsp">View</a>
        </div>

        <div class="card">
            <h3>Teachers</h3>
            <p>Manage teachers</p>
            <a class="btn" href="teachers.jsp">View</a>
        </div>

        <div class="card">
            <h3>Courses</h3>
            <p>Manage courses</p>
            <a class="btn" href="courses.jsp">View</a>
        </div>

    </div>
</div>

<!-- Footer -->
<div class="footer">
    © 2025 Student Management - Built by Yogesh Tandale
</div>

</body>
</html>
