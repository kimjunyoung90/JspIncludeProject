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
		<!-- Logo �� -->
		
		
		<!-- �޴� ��-->
			<nav id="nav">
				<a href="main.jsp?mode=1">ȸ������</a>
				<a href="main.jsp?mode=2">����</a>
				<a href="main.jsp?mode=3">�����Խ���</a>
				<a href="main.jsp?mode=4">�ڷ��</a>
				<a href="main.jsp?mode=5">��������</a>
				<a href="main.jsp?mode=6">��������</a>
			</nav>
		<!-- �޴� �� ��-->
	</header>

<!-- �α��� �κ�-->
	<%if(id==null) 
	{
	%>
		<form method="post" action="../member/login_ok.jsp">
			<div style="float:right;">
		          <label style="color:white">ID:</label><input type="text" name="id" size=10>
		          <label style="color:white">PW:</label><input type="password" name="pwd" size=10>
		             <input type="submit" value="�α���" class="btn btn-sm btn-success">                
		    </div>
		 </form>
    	
		
	<%}
	else
	{%>
		<form method="post" action="../member/login_ok.jsp">
		<div style="float:right; color:white;">
		  <%=session.getAttribute("name") %>�α��� �Ǿ����ϴ�.
		  <input type="submit" value="�α׾ƿ�" class="btn btn-sm btn-success">                
		</div>
		</form>
	<%} %>
<!-- �α��� �κ� ��-->
	
</body>
</html>