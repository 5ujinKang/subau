<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="mail.MailDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mail" class="mail.Mail" scope="page" />
<jsp:setProperty name="mail" property="content" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편지쓰기</title>
</head>
<body>
	<%
		String user_id = null;

		if(session.getAttribute("user_id") != null){
			user_id = (String) session.getAttribute("user_id");
		}
		
		if(mail.getContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			 	MailDAO mailDAO = new MailDAO();
			 	int result = mailDAO.write(user_id, mail.getRecver(), mail.getContent());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("유리병을 띄웠습니다!");
					script.println("</script>");
				}
				
			}
	%>
</body>
</html>