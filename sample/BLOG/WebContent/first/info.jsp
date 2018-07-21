<%@page import="member.BlogMB"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
 </script>
<title>회원정보</title>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
</head>
</head>
<body>
<%
	MemberDAO memberDAO = new MemberDAO();
	String userEmail = null;
	
	if(session.getAttribute("userEmail") != null){
		userEmail = (String)session.getAttribute("userEmail");
		
	}
	BlogMB m1 = memberDAO.info(userEmail);
	String nn = m1.getUserID();
	String gg = m1.getUserNickname();
	String aa = m1.getUserAddress();
	
	
%>


<div id="jquery-script-menu">
<div class="jquery-script-center">
<ul>
<li><a href="https://www.jqueryscript.net/form/Powerful-Form-Validation-Plugin-For-jQuery-Bootstrap-3.html"></a></li>
<li><a href="https://www.jqueryscript.net/"></a></li>
</ul>
<div class="jquery-script-ads"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript" src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
<div class="jquery-script-clear"></div>
</div>
</div>
<div class="container" style="margin-top:150px;">
<div class="row"> 


<!-- form: -->
<section>
<div class="col-lg-8 col-lg-offset-2">
<div class="page-header">
<h2 style="text-align:center">회원정보</h2>
</div>
<form method="post" class="form-horizontal" action="/BLOG/main.jsp">
<div class="form-group">

<label class="col-lg-3 control-label">E-mail</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userEmail" value="<%=userEmail %>">
</div>
</div>

<div class="form-group">
<label class="col-lg-3 control-label">아이디</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userID" value="<%=nn %>">
</div>
</div>

<div class="form-group">
<label class="col-lg-3 control-label">닉네임</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userNickname" value="<%=gg %>"> 
</div>
</div>
<div class="form-group">
<label class="col-lg-3 control-label">주소</label>
<div class="col-lg-5">
<input type="text" class="form-control" name="userAddress" value="<%=aa %>">
</div>
</div>

<div class="form-group">
<div class="col-lg-9 col-lg-offset-3">
<button type="submit" class="btn btn-primary" value="성공이네욥.">나가기</button>

<button type = "button" onclick="showPopup();" class="btn btn-primary">회원탈퇴</button>
<script>
function showPopup() { 
 window.open("bye.jsp", "a", "width=400, height=300, left=100, top=50");
 }
</script>



</div>
</div>
</form>
</div>
</section>
</body>
</html>
<!-- :form --> 

