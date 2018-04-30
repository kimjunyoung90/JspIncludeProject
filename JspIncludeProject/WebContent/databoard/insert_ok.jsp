<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.databoard.dao.*"%>
<%-- DAO 메모리 할당 --%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"/>
<%
    request.setCharacterEncoding("EUC-KR");
    String path="c:\\download";
    int size=1024*1024*100;
    String enctype="EUC-KR";
    MultipartRequest mr=
    		new MultipartRequest(request,path,size,enctype,
    				new DefaultFileRenamePolicy());//DefaultFileRenamePolicy() => 파일명 바꿔주는 것
    // 데이터받기
    String name=mr.getParameter("name");
    String subject=mr.getParameter("subject");
    String content=mr.getParameter("content");
    String pwd=mr.getParameter("pwd");
    String filename=mr.getOriginalFileName("upload");
    DataBoardVO vo=new DataBoardVO();
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);
    
    // 업로드가 없는 경우
    if(filename==null)
    {
    	vo.setFilename("");
    	vo.setFilesize(0);
    }
    // 업로드된 상태 
    else
    {
    	vo.setFilename(filename);
    	File f=new File(path+"\\"+filename);
    	vo.setFilesize((int)f.length());
    }
    
    // DB연동 
    
    dao.databoardInsert(vo);
    response.sendRedirect("../main/main.jsp?mode=4");
    
%>








