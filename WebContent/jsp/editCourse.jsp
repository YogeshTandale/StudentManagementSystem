<%@ page import="com.sms.model.Course" %>
<jsp:include page="header.jsp" />
<%
  Course c = (Course) request.getAttribute("course");
%>
<link rel="stylesheet" href="../css/style.css">

<h2>Edit Course</h2>
<form action="${pageContext.request.contextPath}/course" method="post">
  <input type="hidden" name="id" value="<%=c.getId()%>" />
  <div class="form-group"><label>Code</label><input name="code" value="<%=c.getCode()%>" required/></div>
  <div class="form-group"><label>Title</label><input name="title" value="<%=c.getTitle()%>" required/></div>
  <div class="form-group"><label>Description</label><textarea name="description"><%=c.getDescription()%></textarea></div>
  <div class="form-group"><label>Credits</label><input name="credits" value="<%=c.getCredits()%>"/></div>
  <div class="form-group"><button type="submit">Update</button></div>
</form>
<jsp:include page="footer.jsp" />
