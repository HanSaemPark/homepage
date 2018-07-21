<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	request.setCharacterEncoding("UTF-8");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content ="width=device=-width, initial-scale=1">

<!-- bootstrap file -->
<link rel = "stylesheet" href = "/BLOG/css/bootstrap.css">
<link rel = "stylesheet" href = "/BLOG/css/custom.css">

<!-- google jquery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src = "/BLOG/js/bootstrap.js"></script>

<title>Insert title here</title>
</head>
<body>
<% 
		String userEmail = null;
		if(session.getAttribute("userEmail") !=null){
			userEmail = (String)session.getAttribute("userEmail");
		}
%>

	<% 
		session.invalidate(); // 세션 무효화
	%>	
	<script>
		location.href = '/BLOG/main.jsp';
	</script>
</body>
</html>