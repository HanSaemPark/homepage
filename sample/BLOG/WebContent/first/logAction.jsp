<%@page import="member.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
%>
<!-- member가 id 즉 패키지이름 -->
<jsp:useBean id="member" class="member.BlogMB" scope="page"/>
<jsp:setProperty property="userEmail" name="member"/>
<jsp:setProperty property="userPassword" name="member"/>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Action</title>
</head>
<body>





	<% 
		String userEmail = null;
		if(session.getAttribute("userEmail") !=null){
			userEmail = (String)session.getAttribute("userEmail");
		}
		
		if(userEmail != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 접속중이면서...')");
			script.println("location.href = '/BLOG/main.jsp'");
			script.println("</script>");
		}
		// 로그인이 되는 이메일과 비밀번호를 받아야함.
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.login(member.getUserEmail(), member.getUserPassword());
		
		if(result == 1 ){ // 정상적으로 로그인이됨.
			session.setAttribute("userEmail", member.getUserEmail());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = '/BLOG/main.jsp'");
			script.println("</script>");
			
			if (request.getParameter("saveID") != null) {
				Cookie cookie = new Cookie("cookieID", member.getUserEmail());
				cookie.setMaxAge(6000);
				response.addCookie(cookie); //사용자 PC로 전송
			}else {
				Cookie cookie = new Cookie("cookieID", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie); //사용자 PC로 전송
				
			} 
			
		}else if(result == 0){ // 로그인 실패
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일 혹은 비밀번호가 틀렷어염...')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result == -2){ // DB오류
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터가 오류낫어욤...')");
			script.println("history.back()");
			script.println("</script>");
		}
	
	%>


</body>
</html>
