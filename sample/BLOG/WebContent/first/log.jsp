<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="vierport" content="width=device=-width, initial-scale=1">
<!-- bootstrap file -->

<link rel="stylesheet" href="/BLOG/css/bootstrap.css">
<link rel="stylesheet" href="/BLOG/css/custom.css">

<script src="/BLOG/js/bootstrap.js"></script>
<!-- google jquery file -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>LOGIN</title>
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

/* 메뉴전체크기 조정 */
html, body {
	color: #555;
	font-family: 'Open Sans', sans-serif;
	font-size: 12px;
	font-weight: normal;
	margin: 0 auto;
	overflow-X: hidden;
	overflow-Y: auto;
	padding: 0;
}

*, *::after, *::before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

* {
	margin: 0;
	padding: 0;
}

a, a:active, a:hover {
	color: inherit;
	text-decoration: none;
}

ul, li {
	display: block;
	list-style: none;
}

ul {
	margin: 10px 5px 15px;
	padding: 5px;
}

li {
	margin: 2px 0;
	padding: 6px 8px;
}

p {
	line-height: 1.5;
	margin: 10px;
	padding: 5px 5px 15px;
	text-align: justify;
}

img {
	display: block;
	width: 100%;
}

h1, h2, h3, h4, h5, h6 {
	color: #555;
	padding: 5px 10px 10px;
}

header {
	background: #FF5B06;
	border-bottom: 1px solid #DF4C00;
	box-shadow: 1px 0 2px rgba(0, 0, 0, .5);
	color: #FFF;
	display: flex;
	justify-content: space-between;
	padding: 10px 10px;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	vertical-laign: middle;
	z-index: 9;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

header [class*="menu-"] {
	cursor: pointer;
	font-size: 20px;
	height: initial;
	padding: 5px;
	width: initial;
}

header h1 {
	color: #FFF;
	font-size: 24px;
	font-weight: 100;
	padding: 0;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .5);
}

.intro {
	margin: 57px auto 0px;
	padding: 0;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

section, article, div, .box {
	overflow: hidden;
	position: relative;
}

section {
	margin: 20px auto 40px;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

/********************* 
  여기에서 메뉴 색 변경가능
 *********************/

/* 메뉴바 넓이 설정 */
[id*="menu-"] {
	background: #120000;
	bottom: 0;
	color: #F5DA81;
	height: 100%;
	position: fixed;
	top: 0;
	width: 200px;
	z-index: 99;
}

[id*="menu-"] .box {
	height: 100%;
	margin: 0;
	padding: 0;
	overflow: auto;
}

[id*="menu-"] .box::-webkit-scrollbar {
	height: 4px;
	width: 4px;
}

[id*="menu-"] ul {
	margin: 0;
	padding: 0;
}

/***************
    메뉴 라인 + 카테고리 항목 사이즈 조절
  ***************/
[id*="menu-"] li {
	border-bottom: 1px solid #F5DA81;
	font-size: 15px;
	line-height: 30px;
	margin: 0;
	overflow: hidden;
	padding: 5px;
	position: relative;
}

[id*="menu-"] li:last-child {
	border: 0;
}

#menu-push {
	border-right: 1px solid #F5DA81;
	left: -205px;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

#menu-push .profile {
	background: #222;
	border-bottom: 5px solid #F5DA81;
	padding: 8px 5px;
}

#menu-push .profile  img {
	border: 1px solid #111;
	border-radius: 5px;
	display: inline-block;
	height: 35px;
	vertical-align: middle;
	width: 35px;
}

/*******************
    왼쪽 컨텐츠 색상변경
  *******************/
#menu-push .content {
	position: relative;
	height: initial;
	width: 100%;
}

#menu-push .content  h5 {
	background: #353535;
	color: #EEE;
	font-weight: 400;
}

#menu-push .content .fa {
	padding: 0 8px 0 4px;
}

#menu-push .content ul:last-child {
	color: #F5DA81;
}

#menu-push .content ul:last-child .fa {
	color: #F5DA81;
}

#menu-overlay li  img {
	border: 1px solid #F5DA81;
	border-radius: 5px;
	display: inline-block;
	height: 32px;
	vertical-align: middle;
	width: 32px;
}

#menu-push .profile span, #menu-overlay li span {
	*font-weight: bold;
	padding-left: 8px;
}

#menu-overlay li span {
	font-size: 12px;
}

#menu-overlay li span:before {
	background: transparent;
	border: 1px solid #F5DA81;
	border-radius: 100%;
	box-shadow: inset 0 2px 5px #F5DA81;
	content: "";
	margin-top: -4px;
	padding: 6px;
	position: absolute;
	top: 50%;
	right: 10px;
}

#menu-overlay li span.active:before {
	background: #00CC0B;
}

#menu-overlay li span.so-active:before {
	background: #FF5B06;
}

#menu-overlay li span.no-active:before {
	background: transparent;
	border: 0;
	box-shadow: none;
}

#menu-overlay {
	border-left: 1px solid #F5DA81;
	top: 57px;
	right: 0;
	width: 205px;
	-webkit-transform: translate3d(205px, 0, 0);
	-moz-transform: translate3d(205px, 0, 0);
	transform: translate3d(205px, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

#menu-overlay.active {
	right: 0;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

section.active, header.active, .intro.active, #menu-push.active, footer.active
	{
	-webkit-transform: translate3d(205px, 0, 0);
	-moz-transform: translate3d(205px, 0, 0);
	transform: translate3d(205px, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

#footer.active {
	-webkit-transform: translate3d(205px, 0, 0);
	-moz-transform: translate3d(205px, 0, 0);
	transform: translate3d(205px, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

section, article {
	background: inherit;
	overflow: hidden;
	position: relative;
	text-align: center;
	width: initial;
}

article img {
	display: block;
	width: 100%
}

article:nth-child(2n) {
	-webkit-transform: rotate3d(0, 1, 0, 180deg);
	-moz-transform: rotate3d(0, 1, 0, 180deg);
	transform: rotate3d(0, 1, 0, 180deg);
}

article:nth-child(2n) .box .feed {
	-webkit-transform: rotate3d(0, 1, 0, 180deg);
	-moz-transform: rotate3d(0, 1, 0, 180deg);
	transform: rotate3d(0, 1, 0, 180deg);
}

article .box:before {
	background: #FFF;
	content: "";
	margin-top: -10px;
	position: absolute;
	width: 20px;
	height: 20px;
	top: 50%;
	left: -10px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	transform: rotate(45deg);
}

.box .feed {
	height: 100%;
	overflow: hidden;
	padding: 0 10px;
	position: relative;
	width: initial;
}

.box .feed h2 {
	color: #FF5B06;
	font-weight: 400;
	letter-spacing: 1px;
}

.box .feed p {
	color: #555;
	letter-spacing: 1px;
	line-height: 22px;
}

footer {
	background: inherit;
	position: relative;
	text-align: center;
	z-index: 2;
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: all 500ms ease-in-out;
	-moz-transition: all 500ms ease-in-out;
	transition: all 500ms ease-in-out;
}

footer h2 {
	margin: 60px 10px 20px;
}

footer p {
	color: #656565;
	margin: 10px auto 50px;
	text-align: center;
	max-width: 500px;
}

footer .footer, .footer-02 {
	height: 100%;
	padding: 40px 10px 20px;
}

footer .footer {
	background: #111;
}

footer .footer-02 {
	background: #000;
}

footer .container {
	background: #050505;
	height: 100%;
	overflow: hidden;
	position: relative;
	width: 100%;
}

/*-------------------------------*/
/* CSS @media screen responsive
/*-------------------------------*/
@media only screen and (min-width: 240px) {
	article .box .feed p {
		font-size: 13px;
	}
}

@media only screen and (min-width: 320px) {
	article .box .feed p {
		font-size: 13px;
	}
}

@media only screen and (min-width: 480px) {
	article .box .feed p {
		font-size: 14px;
	}
}

@media only screen and (min-width: 528px) {
	article .box, footer .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 11px;
		line-height: 16px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (min-width: 640px) {
	article .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 13px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (min-width: 768px) {
	article .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 15px;
		line-height: 24px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (min-width: 992px) {
	article .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 15px;
		line-height: 24px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (min-width: 1200px) {
	article .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 15px;
		line-height: 24px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (min-width: 767px) and (max-width: 991px) {
	article .box {
		display: inline-block;
		margin: 0 -2px;
		vertical-align: middle;
		width: 50%;
	}
	article .box .feed p {
		font-size: 15px;
		line-height: 24px;
	}
	footer .box {
		height: 100%;
	}
}

@media only screen and (max-width: 528px) {
	article .box .feed {
		margin: 15px 0 25px;
	}
	article .box:before {
		content: "";
		margin-top: 0;
		margin-left: -10px;
		position: absolute;
		width: 20px;
		height: 20px;
		top: -10px;
		left: 50% !important;
		right: auto;
		-webkit-transform: rotate(45deg);
		-moz-transform: rotate(45deg);
		transform: rotate(45deg);
	}
}

@media only screen and (max-width: 240px) {
	.intro {
		display: none
	}
	section {
		margin-top: 57px
	}
	article .box .feed p {
		font-size: 12px;
	}
}
</style>
</head>

<!-- https://www.jqueryscript.net/menu/Off-Canvas-Push-Overlay-Menus.html -->


<header> <span class="menu-push"><i
	class="fa fa-navicon"></i></span>
<div>
	<h1></h1>
</div>
<span class="menu-overlay"><i class="fa fa-list-ul"></i></span> </header>
<div id="menu-push">
	<div class="box">
		<div class="profile">
			<img src="image/fork.jpg" alt="" /><span>오늘도 가즈아</span>
		</div>
		<div class="content">
			<h5>
				<i class="fa fa-lock">여! 히사시부리</i>
			</h5>
			<ul>
				<li><a href="login.html"><i class="fa fa-newspaper-o"></i>로그인</a></li>
				<li><a href="회원가입.html"><i class="fa fa-calendar"></i> 회원가입</a></li>
			</ul>

			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>
			<h5>☞☞ 카테고리 ☜☜</h5>
			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>
			<h5>♪♪ 여행 슝슝 ♪♪</h5>
			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>
			<div style="overflow-y: scroll; height: 40px;">
				<h5>TRAVEL</h5>
				<ul>
					<li><a href="메인여행\map1.jsp"><i class="fa fa-image"></i>제주도
							여행</a></li>
					<li><a href="메인여행\map2.jsp"><i class="fa fa-image"></i>강원도
							강릉 여행</a></li>
					<li><a href="메인여행\map3.jsp"><i class="fa fa-image"></i>전라도
							군산 여행</a></li>
					<li><a href="메인여행\map6.jsp"><i class="fa fa-image"></i>한겨울의
							피난</a></li>
				</ul>
			</div>

			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>

			<div style="overflow-y: scroll; height: 40px;">
				<h5>EATING</h5>
				<ul>
					<!-- fa fa-lock-->
					<li><a href="메인여행\map4.jsp"><i class="fa fa-image"></i>전라도
							여행</a></li>
					<li><a href="메인여행\map5.jsp"><i class="fa fa-image"></i>대만
							타이페이 여행</a></li>
					<!--  <li><a href=""><i class="fa fa-cog"></i></a></li> -->
					<li><a href="https://www.instagram.com/dr.milmyun/"><i
							class="fa fa-image"></i>부산밀면맛집</a></li>

				</ul>
			</div>

			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>
			<h5>♬♬ 우걱우걱 ♬♬</h5>
			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>
			<div style="overflow-y: scroll; height: 40px;">
				<h5>매일매일</h5>
				<ul>
					<li><a href="메인요리\map7.html"><i class="fa fa-newspaper-o"></i>다같이
							맛점!!</a></li>
					<li><a href="메인요리\map8.html"><i class="fa fa-newspaper-o"></i>술안주엔
							이게 딱!!</a></li>
					<li><a href="메인요리\map9.html"><i class="fa fa-newspaper-o"></i>점심도시락</a></li>

				</ul>
			</div>

			<ul>
				<li><a href=""><i class=""></i></a></li>
			</ul>

			<div style="overflow-y: scroll; height: 40px;">
				<h5>WHAT?</h5>
				<ul>
					<li><a
						href="https://www.youtube.com/results?search_query=%EC%A7%A0%EB%82%B4%ED%8A%B8%EB%A6%BD"><i
							class="fa fa-lock"></i>딩고 트래블(짠내트립)</a></li>
					<li><a
						href="https://www.youtube.com/channel/UCh5VQv8pJfy4my9vs9Xb6tw"><i
							class="fa fa-lock"></i>리얼 먹방 여행</a></li>

				</ul>
			</div>

		</div>
	</div>
</div>
<div id="menu-overlay">
	<div class="box">
		<ul>
			<li><a href="https://www.instagram.com/explore/tags/여행에미치다/"><img
					src="image/여행에미치다.jpg" alt="" /><span class="active">여행에
						미치다 </span></a></li>
			<li><a
				href="https://www.youtube.com/channel/UCh5VQv8pJfy4my9vs9Xb6tw"><img
					src="image/딩고.png" alt="" /><span class="active">딩고 트래블 </span></a></li>
			<li><a href="https://www.airasia.com/kr/ko/home.page?cid=1"><img
					src="image/에어아.png" alt="" /><span class="so-active">에어아시아
				</span></a></li>
			<li><a href="https://blog.naver.com/logenjjem"><img
					src="image/블로그.png" alt="" /><span class="active">여행 블로그</span></a></li>
			<li><a
				href="https://www.google.co.kr/maps/@35.1550067,129.0618476,15z"><img
					src="image/지도.jpg" alt="" /><span class="no-active">지도</span></a></li>
		</ul>
	</div>
</div>

<!--******************************************************************************************************************** -->

<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="advanced.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	
	

	<%
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
	%>
	
	
	<% 
	// 2. 쿠키 확인
	String cookieID = null;
	
	// 쿠키가 여러개일 가능성
	 Cookie[] cookies = request.getCookies();
	
	for(Cookie c : cookies){
		System.out.println("쿠키아이디: " + c.getValue());
		if(c.getName().equals("cookieID")){
			// Element를 찾아서 넣어주면됨.
			cookieID = c.getValue();
		}
		
	 }
     %>
	
	
	<form class="form-signin" action="/BLOG/first/logAction.jsp"
		method="post">
		<img src="image/img.png" width="300" height="280"> <img
			class="mb-4" src="D:\workspace\boot\css/bootstrap-solid.svg" alt=""
			width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">
			<span>어서와~!!</span>
		</h1>
		
		<%
			if (cookieID != null) {
		%>

		<label for="inputEmail" class="sr-only">Email address></label>
		<input id="id" value="<%=cookieID %>" type="email" class="form-control" name="userEmail"
			placeholder="Your Email" required autofocus> 

		<%
			} else {
		%>

		<!-- <label for="inputEmail" class="sr-only">Email address></label> -->
		<input type="email" class="form-control" name="userEmail"
			placeholder="Your Email" required autofocus> 


		<%
			}
		%>
		
			
	    <!-- <label for="inputPassword" class="sr-only">Password</label>  -->
        <input type="password" class="form-control" name="userPassword"
			placeholder="Your Password" required>

		<div class="checkbox mb-3">
			<label> <input type="checkbox" name="saveID"
				value="remember-me"> 아이디 저장
			</label><br>
		</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">들어오세욥.</button>
		<p class="mt-5 mb-3 text-muted">&copy;로그인 해주세요.</p>
	</form>
</body>


</html>
