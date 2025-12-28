<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Login - Student Management</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<link rel="stylesheet" href="../css/style.css">

<body>
  <div class="login-center">
    <div class="login-card">
      <h2>Sign in</h2>
      <form action="${pageContext.request.contextPath}/auth" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit" class="btn-primary">Login</button>
      </form>
      <div class="error">${requestScope.error}</div>
    </div>
  </div>
</body>
</html>