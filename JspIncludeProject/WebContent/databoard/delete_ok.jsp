<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,com.sist.databoard.dao.*"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"></jsp:useBean>
<%
	String strNo=request.getParameter("no");
	String strPage=request.getParameter("page");
	String pwd=request.getParameter("pwd");
	
	DataBoardVO vo=dao.databoardFileInfo(Integer.parseInt(strNo));
	boolean bCheck=dao.databoardDelete(Integer.parseInt(strNo), pwd);
	
	if(bCheck==true)
	{
		//파일 삭제 후 list로 이동
		if(vo.getFilesize()>0)
		{
		File f=new File("c:\\download\\"+vo.getFilename());
		f.delete();
		}
		
		response.sendRedirect("../main/main.jsp?mode=4&page="+strPage);
	}
	else
	{
%>
		<script>
		alert("비밀번호가 틀립니다.");
		history.back();
		</script>
	

<%
	}
%>