<%@ page import="com.sms.dao.CourseDAO"%>
<%@ page import="com.sms.model.Course"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="../css/style.css">

<%
  CourseDAO dao = new CourseDAO();
  java.util.List<Course> list = dao.getAll();
%>
<h2>Courses <a class="btn" href="<%=request.getContextPath()%>/course?action=new">+ Add</a></h2>
<table class="table">
  <thead><tr><th>ID</th><th>Code</th><th>Title</th><th>Credits</th><th>Actions</th></tr></thead>
  <tbody>
    <% for(Course c : list) { %>
      <tr>
        <td><%=c.getId()%></td>
        <td><%=c.getCode()%></td>
        <td><%=c.getTitle()%></td>
        <td><%=c.getCredits()%></td>
        <td>
          <a href="<%=request.getContextPath()%>/course?action=edit&id=<%=c.getId()%>">Edit</a> |
          <a onclick="return confirm('Delete this course?')" href="<%=request.getContextPath()%>/course?action=delete&id=<%=c.getId()%>">Delete</a>
        </td>
      </tr>
    <% } %>
  </tbody>
</table>
<jsp:include page="footer.jsp" />
