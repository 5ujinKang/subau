<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter"%>
 
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_nname" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>수정바다 유리병 :: 환영해요!!</title>
  <link rel="stylesheet" href="welcome.css">
</head>
<body width="100%" height="100%">

	<!-- 로그인 된 사람은 로그인 정보 표시 -->
	<%
		String user_id =null;
		String user_nname = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String) session.getAttribute("user_id");
			user_nname = (String) session.getAttribute("user_nname");
		}
	%>
	
  <nav>
    <div class="floating_bar">수정바다 유리병</div>
    <ul class="fake_btn">
      <div></div>
      <div></div>
      <div></div>
    </ul>

	<%
    		if (user_id == null) {
    			PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
    		}
    	%>

    <ul class="floating_bar_menu">
      <li><a href="..." class="floating_bar_item">메인</a></li>
      <li><a href="..." class="floating_bar_item">소개</a></li>
      <li><a href="..." class="floating_bar_item">로그아웃</a></li>
    </ul>

  </nav>

 <div id ="content">
         <!--환영메시지-->
        <div class="ment">
          
            <p class="site"><img src="sea-waves.png" style="width:4%; height:4%; margin-right:10px; display:float;">수정바다 유리병</p>

           <p class="nickName"><%=user_nname %></p>
            <p class="welcome">님, 안녕하세요!</p>
            <img src="crystal-ball.png" style="width:4%; height:4%; margin-left:10px; display:float;">
        </div>

        <!--구분 가로선-->
        <hr width = "80%" color = "white" size = "3px" >

        <!--이동버튼들-->
        <div id = "goto">
            <block> 
                <a href="write.jsp"><img src="mail-send.png"> </a>
                <p class="explain">메일보내기</p>
            </block>
            
            <block>
                <a href="mailBox.jsp"><img src="mailbox.png"> </a>
                <p class="explain">받은 메일함</p>
            </block>

            <block style="display:block">
                <a href="howToUse.jsp"><img src="questions.png"> </a>
                <p class="explain">소개 및 사용 방법</p>
            </block>
        </div>

        <!--탈퇴버튼-->
        <div id = "byebye">
            <button onclick="location='byebye.jsp'">탈퇴하기</button>
        </div>
    </div>

  <footer>
    <div class="footer"></div>
  </footer>

</body>