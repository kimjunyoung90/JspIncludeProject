<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.dao.*"%>

<jsp:useBean id="dao" class="com.sist.member.dao.MemberDAO">

</jsp:useBean>
<%

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");

	String res=dao.isLogin(id, pwd);
	
	if(res.equals("NOID"))
	{
%>
	<script>
	alert("ID does not exist");
	history.back();
	</script>

<%	
	}else if(res.equals("NOPWD"))
	{
	%>
		<script>
		alert("wrong password");
		history.back();
		</script>

	<%	
	}
	else
	{
		//���ǿ� ����
		session.setAttribute("id", id);
		session.setAttribute("name", res);
		//main �̵�
		response.sendRedirect("../main/main.jsp");
	}
	
%>

