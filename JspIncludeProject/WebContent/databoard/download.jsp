<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*,java.io.*"%>
<%
    String fn=request.getParameter("fn");
    String path="c:\\download";
    // header => ���������� �������� �������� ������ 
    File f=new File(path+"\\"+fn);
    response.setContentLength((int)f.length());
    response.setHeader("Content-Disposition", "attachment;filename="
    		 +URLEncoder.encode(fn,"UTF-8"));
    try
    {
    	BufferedInputStream bis=
    		new BufferedInputStream(new FileInputStream(f));
    	// ������ �����ϴ� ����
    	BufferedOutputStream bos=
    		new BufferedOutputStream(response.getOutputStream());
    	// ��û�� Ŭ���̾�Ʈ�� ���� 
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






