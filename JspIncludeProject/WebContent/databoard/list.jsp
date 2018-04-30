<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.databoard.dao.*" %>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"/>
<%--
      Class.forName("com.sist.databoard.dao.DataBoardDAO");
      id : ��ü��
      class : �޸� �Ҵ��� Ŭ������ ==> ���÷���
      
      DataBoardDAO dao=new DataBoardDAO();
 --%>
<%
     String strPage=request.getParameter("page");
     if(strPage==null)
    	  strPage="1";
     
     int curpage=Integer.parseInt(strPage);
     ArrayList<DataBoardVO> list=dao.boardListData(curpage);
     
     int totalpage=dao.databoardTotalPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
a{
    color: black;
    text-decoration: none;
}
a:hover {
	color: green;
	text-decoration: underline;
}
</style>
</head>
<body>
  <section>
	<header>
	 <h2>�ڷ��</h2>
	</header>
	<table class="table table-striped">
	  <tr>
	   <td class="text-left">
	     <a href="main.jsp?mode=4&dno=2" class="btn btn-sm btn-success" style="color:black">����</a>
	   </td>
	  </tr>
	</table>
	<table class="table table-striped">
	 <tr class="danger">
	  <th width=10% class="text-center">��ȣ</th>
	  <th width=45% class="text-center">����</th>
	  <th width=15% class="text-center">�̸�</th>
	  <th width=20% class="text-center">�ۼ���</th>
	  <th width=10% class="text-center">��ȸ��</th>
	 </tr>
	 
	 <%
	      int i=0;
	      String color="";
	      for(DataBoardVO vo:list)
	      {
	    	  i=i%2;
	    	  if(i==0)
	    		  color="";
	    	  else
	    		  color="warning";
	 %>
	          <tr class="<%=color%>">
	           <td width=10% class="text-center"><%=vo.getNo() %></td>
			   <td width=45% class="text-left">
			    <a href="main.jsp?mode=4&dno=1&no=<%=vo.getNo()%>&page=<%=curpage%>"><%=vo.getSubject() %></a>
			   </td>
			   <td width=15% class="text-center"><%=vo.getName() %></td>
			   <td width=20% class="text-center"><%=vo.getRegdate().toString() %></td>
			   <td width=10% class="text-center"><%=vo.getHit() %></td>
	          </tr>
	 <%
	    	  i++;
	      }
	 %>
	</table>
	<table class="table table-striped">
	  <tr>
	   <td class="text-right">
	     <a href="main.jsp?mode=4&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-success">����</a>
	     <a href="main.jsp?mode=4&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-info">����</a>
	     &nbsp;&nbsp;
	     <%= curpage %> page / <%=totalpage %> pages
	   </td>
	  </tr>
	</table>
  </section>
</body>
</html>










