<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.databoard.dao.*"%>
<jsp:useBean id="dao" class="com.sist.databoard.dao.DataBoardDAO"/>
<%--
   main.jsp?mode=4&dno=1&no=<%=vo.getNo()%>&page=<%=curpage%>"
 
   mode
   dno ===> ȭ�� ���� 
   fno ===> �����Խ���
   hno ===> ���� 
 --%>
<%
    
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
    
    DataBoardVO vo=dao.databoardDetailData(
    		Integer.parseInt(strNo));
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').click(function(){
		var txt=$('#delBtn').text();
		if(txt=='����')
			{
				$('#del').show();
				$('#delBtn').text("���");
			}
		else{
				$('#del').hide();
				$('#delBtn').text("����");
			}
	})
	
})
</script>
</head>
<body>
  <section>
	<header>
	 <h2>���뺸��</h2>
	</header>
	<table class="table table-hover">
        <tr>
         <td width=20% class="text-center success">��ȣ</td>
         <td width=30% class="text-center"><%=vo.getNo() %></td>
         <td width=20% class="text-center success">�ۼ���</td>
         <td width=30% class="text-center"><%=vo.getRegdate().toString() %></td>
        </tr>
        <tr>
         <td width=20% class="text-center success">�̸�</td>
         <td width=30% class="text-center"><%=vo.getName() %></td>
         <td width=20% class="text-center success">��ȸ��</td>
         <td width=30% class="text-center"><%=vo.getHit() %></td>
        </tr>
        
        <tr>
         <td width=20% class="text-center success">����</td>
         <td colspan="3" class="text-left"><%=vo.getSubject() %></td>
        </tr>
        <%
           if(vo.getFilesize()>0)
           {
        %>
             <tr>
               <td width=20% class="text-center success">÷������</td>
               <td colspan="3" class="text-left">
                <a href="../databoard/download.jsp?fn=<%=vo.getFilename()%>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>Bytes)
               </td>
             </tr>
        <%
           }
        %>
        <tr>
         <td colspan="4" class="text-left" valign="top" height="200"><%=vo.getContent() %></td>
        </tr>
      </table>
      <table class="table">
        <tr>
         <td class="text-right">
          <a href="main.jsp?mode=4&dno=3" class="btn btn-sm btn-primary">����</a>
          <a href="#" class="btn btn-sm btn-success">����</a>
          <a href="main.jsp?mode=4&page=<%=strPage %>" class="btn btn-sm btn-info">���</a>
         </td>
        </tr>
        <tr id="del" style="display:none"></tr>
        <tr>
        	<td class="text-right">
        	<form action="../databoard/delete_ok.jsp">
        	��й�ȣ:<input type="password" name=pwd size=10 required>
        	<input type=hidden name=no value="<%=strNo%>">
        	<input type=hidden name=page value="<%=strPage%>">
        	<input type=submit value="����" class="btn btn-sm btn-danger">
        	</form>
        	</td>
        </tr>
      </table>
  </section>
</body>
</html>







