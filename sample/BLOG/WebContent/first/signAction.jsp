<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% 
request.setCharacterEncoding("UTF-8"); 
%>
<!-- member가 id 즉 패키지이름 -->
<jsp:useBean id="member" class="member.BlogMB" scope="page" />
<jsp:setProperty name="member" property="userEmail" />
<jsp:setProperty name="member" property="userID" />
<jsp:setProperty name="member" property="userPassword" />
<jsp:setProperty name="member" property="userNickname" />
<jsp:setProperty name="member" property="userAddress" />
<!-- memPW SHA1, MD5 로 DB저장 시켜야함. -->
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Action</title>
</head>
<body>
<%
	String userEmail = null;
	if(session.getAttribute("userEmail") != null){
		//로그인이 되어있다.
		userEmail = (String) session.getAttribute("userEmail");
	}
	
	if(userEmail != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = '/BLOG/main.jsp'");
		script.println("</script>");
	}
	
	//입력되지 않은 사항이 있는 체크
	if(member.getUserEmail()== null || 
	   member.getUserID() == null ||
	   member.getUserPassword() == null ||
	   member.getUserNickname() == null ||
	   member.getUserAddress() == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.sign(member); //회원가입 DB메서드
		System.out.println("sign : "+result);
		
		if(result == -1){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 메일입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			
			session.setAttribute("getUserEmail", member.getUserEmail());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href = '/BLOG/main.jsp'");
			script.println("</script>");
			
		}
	}
%>
</body>
</html>
