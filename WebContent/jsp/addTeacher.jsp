<jsp:include page="header.jsp" />
<h2>Add Teacher</h2>
<link rel="stylesheet" href="../css/style.css">

<form action="${pageContext.request.contextPath}/teacher" method="post">
  <input type="hidden" name="id" value="" />
  <div class="form-group"><label>Emp No</label><input name="emp_no" required/></div>
  <div class="form-group"><label>Name</label><input name="name" required/></div>
  <div class="form-group"><label>Email</label><input name="email" type="email"/></div>
  <div class="form-group"><label>Phone</label><input name="phone"/></div>
  <div class="form-group"><label>Department</label><input name="department"/></div>
  <div class="form-group"><button type="submit">Save</button></div>
</form>
<jsp:include page="footer.jsp" />
