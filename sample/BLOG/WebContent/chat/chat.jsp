<%@page import="email.EmailMain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device=-width, initial-scale=1">

<!-- bootstrap file -->
<link rel="stylesheet" href="/BLOG/css/bootstrap.css">
<link rel="stylesheet" href="/BLOG/css/custom.css">

<!-- google jquery file -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/BLOG/js/bootstrap.js"></script>

<title>Insert title here</title>
</head>

<body>

		<%-- <%
		
			EmailMain em = new EmailMain();
		
		%> --%>
		
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/BLOG/main.jsp"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="/BLOG/main.jsp"></a></li>
				<li class="nav-item"><a class="nav-link" href="/BLOG/board/board.jsp"></a></li>
			</ul>
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"></a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/BLOG/member/login.jsp"></a> 
						<a class="dropdown-item" href="/BLOG/member/join.jsp"></a> 
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<br>

		
		
		<div class="container">
		<div class="row">
			<!-- 12개의 칼럼 -->
			<div class="col-lg-2">

				<img src="" height="450">

			</div>
			<div class="col-lg-8">
				
					<table class="table table-striped"
						style="border: 1px solid #dddddd">
						<thead>
							<tr>
								<th>하고싶은 말 보내세요</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="메일 제목을 입력하세요" name="mailname" maxlength="50"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="받으시는분 주소를 입력해주세엽" name="mailaddr" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="작성할내용"
										name="bdContent" maxlength="2048" style="height: 350px;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-primary float-right" type="button" onclick="showPopup();">
						메일보내기</button>
						<script>
						
				 function showPopup() { 
				 window.open("chat2.jsp", "a", "width=400, height=300, left=100, top=50");
				 
		 		}
				 
				</script>
			</div>
			
				<div class="col-lg-2">
         
         			<img src ="" height="450">
         
        		 </div>
		</div>
	</div>

        <!-- <input type="text" name="mail"><br> 
		<button type = "button" onclick="showPopup();" class="btn btn-primary">메일보내기</button>
		
		<script>
				 function showPopup() { 
				 window.open("chat2.jsp", "a", "width=400, height=300, left=100, top=50");
		 }
		</script>
		 -->



</body>

</html>