<%@ page import="com.sms.model.Teacher" %>
<jsp:include page="header.jsp" />
<%
  Teacher t = (Teacher) request.getAttribute("teacher");
%>
<link rel="stylesheet" href="../css/style.css">

<h2>Edit Teacher</h2>
<form action="${pageContext.request.contextPath}/teacher" method="post">
  <input type="hidden" name="id" value="<%=t.getId()%>" />
  <div class="form-group"><label>Emp No</label><input name="emp_no" value="<%=t.getEmpNo()%>" required/></div>
  <div class="form-group"><label>Name</label><input name="name" value="<%=t.getName()%>" required/></div>
  <div class="form-group"><label>Email</label><input name="email" value="<%=t.getEmail()%>" type="email"/></div>
  <div class="form-group"><label>Phone</label><input name="phone" value="<%=t.getPhone()%>"/></div>
  <div class="form-group"><label>Department</label><input name="department" value="<%=t.getDepartment()%>"/></div>
  <div class="form-group"><button type="submit">Update</button></div>
</form>
<jsp:include page="footer.jsp" />
