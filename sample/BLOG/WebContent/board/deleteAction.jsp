<%@page import="java.net.InetAddress"%>
<%@page import="board.BlogBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

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
		
		if (userEmail == null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = '/BLOG/first/login.jsp'");
			script.println("</script>");

		} else {

			// bdID로 식별
			int bdID = 0;
			
			if (request.getParameter("bdID") != null) {

				bdID = Integer.parseInt(request.getParameter("bdID"));

			}

			BlogBoardDAO blogboardDAO = new BlogBoardDAO();
			// delete 함수 구현하기
			int result = blogboardDAO.delete(bdID);

			if (result == 1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('헉..글이 삭제됬네염.ㅎㅎ')");
				script.println("location.href = '/BLOG/board/board.jsp'");
				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 사라지지 않았어여...')");
				// 그전의 상태로 되돌리기.
				script.println("history.back()");
				script.println("</script>");

			}
		}
	%>

</body>
</html>
