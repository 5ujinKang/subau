<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="write.css">

<title>수정바다 유리병 :: 편지쓰기</title>
</head>
<body>
	<!-- 로그인 된 사람은 로그인 정보 표시 -->
	<%
		String user_id =null;
		String user_nname = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String) session.getAttribute("user_id");
			user_nname = (String) session.getAttribute("user_nname");
		}
	%>
	<body width="100%" height="100%">
	<nav>
    <div class="floating_bar"> 수정바다 유리병</div>
    <ul class="fake_btn">
      <div></div>
      <div></div>
      <div></div>
    </ul>
		<ul class="floating_bar_menu">
      		<li><a href="..." class="floating_bar_item">메인</a></li>
      		<li><a href="..." class="floating_bar_item">소개</a></li>
      		<li><a href="..." class="floating_bar_item">로그아웃</a></li>
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
 
    <form action="WebSendMail" method="post" enctype="multipart/form-data">
    <div id="content">
    	<div class="ment">
            <block class="site">편지쓰기<img src=letter.png style="width:7%; height:7%; margin-left:10px;"></block>
            <block class="fromto">
                <li><span style="margin-right:4%;">보내는 수정</span>:<span class="nickName"><%=user_nname %></span></li>
                <li><span style="margin-right:8%;">받는 수정</span>:<span class="nickName">멋쟁이수룡이</span></li></block>
        </div>

        <!--구분 가로선-->
        <hr width = "80%" color = "white" size = "3px" >

        <!--편지 내용 입력-->
        <div class="typo">
        	<div>
                <block class="left">제목</block>
                <textarea size="40" name="subject" id= "subject" style="width: 300pt; margin-left: 50px;" required oninvalid="this.setCustomValidity('제목을 입력해주세요!')"
  oninput="this.setCustomValidity('')"></textarea>
            </div>
            <div style="margin-bottom:10px;">
                <block class="left">글쓰기</block>
                <textarea size = "1000" name="body" id = "content" style="width: 950pt; height: 200pt; margin-right: 50px;" required oninvalid="this.setCustomValidity('내용을 입력해주세요!')"
  oninput="this.setCustomValidity('')"></textarea>
            </div>
            <div>
                <block class="left">첨부파일</block>
                <block><input type="file" name="attachment" id="FileOpenInput"></input>
            </div>
        </div>

        <!--전송버튼-->
        <div id = "submit">
          <input type="submit" value="유리병을 띄운다"></input><br>
        </div>
    </div>
    </form>
    <script src="https://code.jquery.com/jquery-1.11.3.js" integrity="sha256-IGWuzKD7mwUnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0=" crossorigin="anonymous"></script>
    <script> src="https://maxcdn.bootstrapcdn.com.bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfulWVxZxUPnCJA712mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="write.js"></script>
    			
	
</body>
</html>