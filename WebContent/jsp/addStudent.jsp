<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" />
<h2>Add Student</h2>
<link rel="stylesheet" href="../css/style.css">

<form action="${pageContext.request.contextPath}/student" method="post">
  <input type="hidden" name="id" value="" />
  <div class="form-group"><label>Reg No</label><input name="reg_no" required/></div>
  <div class="form-group"><label>First Name</label><input name="first_name" required/></div>
  <div class="form-group"><label>Last Name</label><input name="last_name"/></div>
  <div class="form-group"><label>Email</label><input name="email" type="email"/></div>
  <div class="form-group"><label>Phone</label><input name="phone"/></div>
  <div class="form-group"><label>DOB</label><input type="date" name="dob"/></div>
  <div class="form-group"><label>Gender</label>
    <select name="gender"><option value="">Select</option><option>Male</option><option>Female</option><option>Other</option></select>
  </div>
  <div class="form-group"><label>Address</label><textarea name="address"></textarea></div>
  <div class="form-group"><label>Course ID</label><input name="course_id" /></div>
  <div class="form-group"><button type="submit">Save</button></div>
</form>
<jsp:include page="footer.jsp" />
