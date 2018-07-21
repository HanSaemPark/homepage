<%@page import="java.net.InetAddress"%>
<%@page import="board.BlogBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- member가 id 즉 패키지이름 -->
<jsp:useBean id="board" class="board.BlogBoard" scope="page" />

<!-- 
	useBean은 1. page import = "board.Board"
			 2. Board board = new Board();
			 3. scope 결정해줌.
 -->

<jsp:setProperty name="board" property="bdTitle" />
<jsp:setProperty name="board" property="bdContent" />

<!-- 
	setProperty 는 1. Board클래스에 set 함수를 호출해줌.
				  2. Board클래스에 변수를 property에 적어주면됨.
				  3. request로 넘어오는 name값을 호출해줌.
				  
		board.setBdTitle(request.getParameter("bdTitle")); 
		==> 함수를 자동으로 찾아줌.
 -->

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
			//board 객체에 어떤 데이터가 담겨있나?
			board.setUserEmail(userEmail);
			if (board.getBdTitle() == null || board.getBdContent() == null || board.getBdTitle().equals("")
					|| board.getBdContent().equals("")) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				System.out.println("IP주소: " + request.getRemoteAddr());
				String getIP = "";
				if (request.getRemoteAddr().equals("192.168.0.1")

						|| request.getRemoteAddr().equals("127.0.0.1")) {

					getIP = InetAddress.getLocalHost().getHostAddress();

				} else {

					getIP = request.getRemoteAddr();

				}

				board.setBdIP(getIP);

				BlogBoardDAO blogboardDAO = new BlogBoardDAO();
				// write 함수 호출 int result 값만 받으면 됨.
				int result = blogboardDAO.write(board);
				// 1은 정상, -2는 DB오류
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글이 입력되었습니다.')");
					script.println("location.href = '/BLOG/board/board.jsp'");
					script.println("</script>");

				}

			}
		}
	%>


</body>
</html>
