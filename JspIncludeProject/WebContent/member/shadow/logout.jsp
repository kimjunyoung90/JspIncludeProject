<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // session�� ���� 
    session.invalidate();
    // main���� �̵� 
    response.sendRedirect("../main/main.jsp");
%>