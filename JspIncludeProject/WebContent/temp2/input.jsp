<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form method=post action="output.jsp">
	  <table border=1 width=350>
	    <tr>
	      <td width=25%>�̸�</td>
	      <td width=75%><input type=text name=name size=10></td>
	    </tr>
	    <tr>
	      <td width=25%>����</td>
	      <td width=75%><input type=text name=sex size=10></td>
	    </tr>
	    <tr>
	      <td width=25%>����</td>
	      <td width=75%><input type=text name=age size=10></td>
	    </tr>
	    <tr>
	      <td width=25%>�ּ�</td>
	      <td width=75%><input type=text name=addr size=20></td>
	    </tr>
	    <tr>
	      <td width=25%>��ȭ</td>
	      <td width=75%><input type=text name=tel size=15></td>
	    </tr>
	    <tr>
	      <td colspan=2 align=center>
	        <input type=submit value=����>
	      </td>
	    </tr>
	  </table>
	  </form>
	</center>
</body>
</html>