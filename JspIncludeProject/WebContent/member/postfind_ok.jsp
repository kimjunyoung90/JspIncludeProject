<%@page import="com.sist.member.dao.ZipcodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.sist.member.dao.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String dong=request.getParameter("dong");
	int count=dao.postfindCount(dong);
	ArrayList<ZipcodeVO> list=null;
	
	if(count>0)
	{
		list=dao.postfind(dong);
		
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function ok(zip,addr)
{
	parent.frm.post1.value=zip.substring(0,3);
	parent.frm.post1.value=zip.substring(4,7);
	parent.frm.addr1.value=addr;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
<%
	if(count==0)
	{
%>
	<table class="table table-hover">
		<tr class="success">
			<td class="text-center">
			�˻��� ����� �����ϴ�.
			</td>
		</tr>
	</table>
<%		
	}
	else
	{
%>

	<table class="table table-hover">
		<tr class="success">
			<th width=20% class="text-center">������ȣ</th>
			<th width=80% class="text-center">�ּ�</th>
		</tr>
		<%
			for(ZipcodeVO vo:list)
			{
		%>
			<tr>
				<td width=20% class="text-center"><%=vo.getZipcode() %></td>
				<td width=80% class="text-left"><a href="javascript:ok('<%=vo.getZipcode()%>','<%=vo.getAddr()%>')"><%=vo.getAddr() %></a></td>
			</tr>
		<%		
			}
		%>
	</table>
<%
	}
%>	
</body>
</html>