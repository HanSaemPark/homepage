<%@page import="java.net.InetAddress"%>
<%@page import="board.BlogBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 강제성을 부여하기 위한 방법 ↓↓↓ -->
<!-- 객체생성 -->
<jsp:useBean id="board" class="board.BlogBoard" scope="page"></jsp:useBean>

<!-- 불러내기 -->
<jsp:setProperty property="bdTitle" name="board" />
<jsp:setProperty property="bdContent" name="board" />
<jsp:setProperty property="bdID" name="board" />


<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delete Action</title>
</head>
<body>
	<%
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			//로그인을 한 상태!!
			userEmail = (String) session.getAttribute("userEmail");
		}
		
		if(userEmail == null){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = '/BLOG/first/login.jsp'");
			script.println("</script>");
			
		}else{		
			
			BlogBoardDAO blogboardDAO = new BlogBoardDAO();
			int result = blogboardDAO.update(board);
			
			if(result == 1){
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정 완료')");
				script.println("location.href = '/BLOG/board/board.jsp'");
				script.println("</script>");
				
			}else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정 실패')");
				script.println("history.back()");
				script.println("</script>");
				
			}
			
			
		}


	%>

</body>
</html>
