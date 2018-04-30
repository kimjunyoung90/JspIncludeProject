<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=request.getParameter("id");
	String mode=request.getParameter("mode");
	int no=Integer.parseInt(mode);
	if(no==1)
	{
		response.sendRedirect("result.jsp");
		//result로 이동하면 output는 메모리에서 해제(request가 초기화)
	}
	else if(no==2)
	{
		
		/*
			pageContext.forward("result.jsp");
			페이지와 페이지를 연결할때 쓰는 클래스 ->pageContext
		*/
%>
		<jsp:forward page="result.jsp"/>
<%
	}
%>