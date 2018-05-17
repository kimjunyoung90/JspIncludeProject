<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String id=(String)session.getAttribute("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  
  <header id="header" class="container">
		<!-- Logo -->
			<h1><a href="main.jsp" id="logo">SIST Food Center</a></h1>
		<!-- Logo 끝 -->
		
		
		<!-- 메뉴 바-->
			<nav id="nav">
				<a href="main.jsp?mode=1">회원가입</a>
				<a href="main.jsp?mode=2">맛집</a>
				<a href="main.jsp?mode=3">자유게시판</a>
				<a href="main.jsp?mode=4">자료실</a>
				<a href="main.jsp?mode=5">지역맛집</a>
				<a href="main.jsp?mode=6">맛집예약</a>
			</nav>
		<!-- 메뉴 바 끝-->
	</header>

<!-- 로그인 부분-->
	<%if(id==null) 
	{
	%>
		<form method="post" action="../member/login_ok.jsp">
			<div style="float:right;">
		          <label style="color:white">ID:</label><input type="text" name="id" size=10>
		          <label style="color:white">PW:</label><input type="password" name="pwd" size=10>
		             <input type="submit" value="로그인" class="btn btn-sm btn-success">                
		    </div>
		 </form>
    	
		
	<%}
	else
	{%>
		<form method="post" action="../member/login_ok.jsp">
		<div style="float:right; color:white;">
		  <%=session.getAttribute("name") %>로그인 되었습니다.
		  <input type="submit" value="로그아웃" class="btn btn-sm btn-success">                
		</div>
		</form>
	<%} %>
<!-- 로그인 부분 끝-->
	
</body>
</html>