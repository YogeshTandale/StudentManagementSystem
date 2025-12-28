<%@ page import="com.sms.dao.TeacherDAO"%>
<%@ page import="com.sms.model.Teacher"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="../css/style.css">

<%
  TeacherDAO dao = new TeacherDAO();
  java.util.List<Teacher> list = dao.getAll();
%>
<h2>Teachers <a class="btn" href="<%=request.getContextPath()%>/teacher?action=new">+ Add</a></h2>
<table class="table">
  <thead><tr><th>ID</th><th>Emp No</th><th>Name</th><th>Email</th><th>Phone</th><th>Dept</th><th>Actions</th></tr></thead>
  <tbody>
    <% for(Teacher t : list) { %>
      <tr>
        <td><%=t.getId()%></td>
        <td><%=t.getEmpNo()%></td>
        <td><%=t.getName()%></td>
        <td><%=t.getEmail()%></td>
        <td><%=t.getPhone()%></td>
        <td><%=t.getDepartment()%></td>
        <td>
          <a href="<%=request.getContextPath()%>/teacher?action=edit&id=<%=t.getId()%>">Edit</a> |
          <a onclick="return confirm('Delete this teacher?')" href="<%=request.getContextPath()%>/teacher?action=delete&id=<%=t.getId()%>">Delete</a>
        </td>
      </tr>
    <% } %>
  </tbody>
</table>
<jsp:include page="footer.jsp" />
