

<%@ page import="com.sms.dao.StudentDAO"%>
<%@ page import="com.sms.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />

<link rel="stylesheet" href="../css/style.css">

<%
  StudentDAO dao = new StudentDAO();
  java.util.List<Student> list = dao.getAll();
%>
<h2>Students <a class="btn" href="<%=request.getContextPath()%>/student?action=new">+ Add</a></h2>
<table class="table">
  <thead><tr><th>ID</th><th>Reg No</th><th>Name</th><th>Email</th><th>Course</th><th>Actions</th></tr></thead>
  <tbody>
    <% for(Student s : list) { %>
      <tr>
        <td><%=s.getId()%></td>
        <td><%=s.getRegNo()%></td>
        <td><%=s.getFirstName()%> <%=s.getLastName()%></td>
        <td><%=s.getEmail()%></td>
        <td><%= s.getCourseId() == null ? "-" : s.getCourseId() %></td>
        <td>
          <a href="<%=request.getContextPath()%>/student?action=edit&id=<%=s.getId()%>">Edit</a> |
          <a onclick="return confirm('Delete this student?')" href="<%=request.getContextPath()%>/student?action=delete&id=<%=s.getId()%>">Delete</a>
        </td>
      </tr>
    <% } %>
  </tbody>
</table>
<jsp:include page="footer.jsp" />
