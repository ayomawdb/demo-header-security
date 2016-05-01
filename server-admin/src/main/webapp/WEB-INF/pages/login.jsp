<%@page import="org.owasp.encoder.Encode"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="css/login.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
</head>
<body>
	<div class="login-page">
		<div class="form">
			<form class="login-form" action="login" method="POST">
				<div><%=request.getParameter("msg")==null?"":request.getParameter("msg") %></div>
				<%-- <div><%=Encode.forHtml(request.getParameter("msg")==null?"":request.getParameter("msg"))%></div> --%>
				<div style="margin-top:10px;">
					<input name="username" type="text" placeholder="username" />
					<input name="password" type="password" placeholder="password" />
					<button type="submit" value="Login">Login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>