<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.simple.rdb.family_tree.OJDBCAdapter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Main CSS -->
<link rel="stylesheet" type="text/css" media="screen" href=css/main.css />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<h2>Hello World!</h2>
		<p class="test-red">CSS test</p>
		<button type="button" class="btn btn-outline-primary">Bootstrap
			4 test</button>
		<p><br></p>
		<%
			if (OJDBCAdapter.verifyDriver()) {
		%>
			<p>Driver verified!</p>
		<% 
			} else {
		%>
			<p>Cannot find OJDBC!</p>
		<%
			}
		%>
	</div>
</body>
</html>
