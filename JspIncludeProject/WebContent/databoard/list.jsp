<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.databoard.dao.*" %>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"/>
<%--
      Class.forName("com.sist.databoard.dao.DataBoardDAO");
      id : 객체명
      class : 메모리 할당할 클래스명 ==> 리플렉션
      
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
	 <h2>자료실</h2>
	</header>
	<table class="table table-striped">
	  <tr>
	   <td class="text-left">
	     <a href="main.jsp?mode=4&dno=2" class="btn btn-sm btn-success" style="color:black">새글</a>
	   </td>
	  </tr>
	</table>
	<table class="table table-striped">
	 <tr class="danger">
	  <th width=10% class="text-center">번호</th>
	  <th width=45% class="text-center">제목</th>
	  <th width=15% class="text-center">이름</th>
	  <th width=20% class="text-center">작성일</th>
	  <th width=10% class="text-center">조회수</th>
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
	     <a href="main.jsp?mode=4&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-success">이전</a>
	     <a href="main.jsp?mode=4&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-info">다음</a>
	     &nbsp;&nbsp;
	     <%= curpage %> page / <%=totalpage %> pages
	   </td>
	  </tr>
	</table>
  </section>
</body>
</html>










