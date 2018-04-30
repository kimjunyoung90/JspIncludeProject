<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*,java.io.*"%>
<%
    String fn=request.getParameter("fn");
    String path="c:\\download";
    // header => 실제데이터 전송전에 보내야할 데이터 
    File f=new File(path+"\\"+fn);
    response.setContentLength((int)f.length());
    response.setHeader("Content-Disposition", "attachment;filename="
    		 +URLEncoder.encode(fn,"UTF-8"));
    try
    {
    	BufferedInputStream bis=
    		new BufferedInputStream(new FileInputStream(f));
    	// 서버에 존재하는 파일
    	BufferedOutputStream bos=
    		new BufferedOutputStream(response.getOutputStream());
    	// 요청한 클라이언트로 전송 
    	int i=0;
    	byte[] buffer=new byte[1024];
    	while((i=bis.read(buffer, 0, 1024))!=-1)
    	{
    		
    	}
    }catch(Exception ex)
    {
    	System.out.println(ex.getMessage());
    }
    
%>






