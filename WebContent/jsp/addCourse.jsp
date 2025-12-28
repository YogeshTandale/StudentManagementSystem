<jsp:include page="header.jsp" />
<link rel="stylesheet" href="../css/style.css">

<h2>Add Course</h2>
<form action="${pageContext.request.contextPath}/course" method="post">
  <input type="hidden" name="id" value="" />
  <div class="form-group"><label>Code</label><input name="code" required/></div>
  <div class="form-group"><label>Title</label><input name="title" required/></div>
  <div class="form-group"><label>Description</label><textarea name="description"></textarea></div>
  <div class="form-group"><label>Credits</label><input name="credits" value="3"/></div>
  <div class="form-group"><button type="submit">Save</button></div>
</form>
<jsp:include page="footer.jsp" />
