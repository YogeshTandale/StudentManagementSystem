<%@ page import="com.sms.model.Student" %>
<jsp:include page="header.jsp" />
<%
  Student s = (Student) request.getAttribute("student");
%>
<link rel="stylesheet" href="../css/style.css">

<h2>Edit Student</h2>
<form action="${pageContext.request.contextPath}/student" method="post">
  <input type="hidden" name="id" value="<%=s.getId()%>" />
  <div class="form-group"><label>Reg No</label><input name="reg_no" value="<%=s.getRegNo()%>" required/></div>
  <div class="form-group"><label>First Name</label><input name="first_name" value="<%=s.getFirstName()%>" required/></div>
  <div class="form-group"><label>Last Name</label><input name="last_name" value="<%=s.getLastName()%>"/></div>
  <div class="form-group"><label>Email</label><input name="email" value="<%=s.getEmail()%>" type="email"/></div>
  <div class="form-group"><label>Phone</label><input name="phone" value="<%=s.getPhone()%>"/></div>
  <div class="form-group"><label>DOB</label><input type="date" name="dob" value="<%=s.getDob()%>"/></div>
  <div class="form-group"><label>Gender</label>
    <select name="gender">
      <option value="">Select</option>
      <option <%= "Male".equals(s.getGender()) ? "selected":"" %>>Male</option>
      <option <%= "Female".equals(s.getGender()) ? "selected":"" %>>Female</option>
      <option <%= "Other".equals(s.getGender()) ? "selected":"" %>>Other</option>
    </select>
  </div>
  <div class="form-group"><label>Address</label><textarea name="address"><%=s.getAddress()%></textarea></div>
  <div class="form-group"><label>Course ID</label><input name="course_id" value="<%=s.getCourseId()==null?"":s.getCourseId()%>"/></div>
  <div class="form-group"><button type="submit">Update</button></div>
</form>
<jsp:include page="footer.jsp" />
