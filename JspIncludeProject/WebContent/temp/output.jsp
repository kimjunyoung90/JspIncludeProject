<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id=request.getParameter("id");
	String mode=request.getParameter("mode");
	int no=Integer.parseInt(mode);
	if(no==1)
	{
		response.sendRedirect("result.jsp");
		//result�� �̵��ϸ� output�� �޸𸮿��� ����(request�� �ʱ�ȭ)
	}
	else if(no==2)
	{
		
		/*
			pageContext.forward("result.jsp");
			�������� �������� �����Ҷ� ���� Ŭ���� ->pageContext
		*/
%>
		<jsp:forward page="result.jsp"/>
<%
	}
%>