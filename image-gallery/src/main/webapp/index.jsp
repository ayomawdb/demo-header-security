<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Gallery</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link href="bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript">
		 $.ajax({
			type : 'GET',
			url : 'http://wso2test1.com:8080/server-admin/home',
			//xhrFields: { withCredentials: true }, 
			success : function(data, textStatus, request) {
				console.log(data);
			},
			error : function(request, textStatus, errorThrown) {
			}
		}); 
	</script>
	<div style="position: absolute; left: 10px; top: 10px; padding-top: 20px; font-weight: 800;">Image Gallery</div>  
	<div style="position: absolute; left: 10px; top: 70px;">
	  <img src="Java-Colombo.jpg" width="1000px">
	</div>
	<a style="position: absolute; left: 64px; top: 685px; color: red; font-weight: bold;" class="btn btn-default">Next</a>
	<a style="position: absolute; left: 246px; top: 685px; color: red; font-weight: bold;"  class="btn btn-default">Previous</a>
	<iframe src="https://javacolombo.duckdns.org/server-admin" width="800" height="800" scrolling="no" style="opacity: 0;"></iframe>
</body>
</html>