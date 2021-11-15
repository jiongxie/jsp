<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String nickname = (String)request.getAttribute("nickname");
	int res = (int)request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>nickNameCheck.jsp</title>
	<script>
		function nickNameCheck()
		{
			var nickname = myform.nickname.value;
			
			if(nickname=="")
			{
				alert("별명을 입력하세요");
				myform.nickname.focus();
			}
			else
			{
				myform.submit();
			}
		}
		
		function useNickName()
		{
			var nickname = "<%=nickname%>";
			window.close();//이부분 순서중요
			opener.window.document.myform.nickname.value = nickname;
			opener.window.document.myform.name.focus();
		}
		
		//입력도중 창을 닫기시 별명값 초기화 
		function winClose()
		{
			opener.window.document.myform.nickname.value = "";
			opener.window.document.myform.nickname.focus();
		}
	</script>
</head>
<body onbeforeunload="winClose()">
	<div class="container" style="margin-top:30px;">
		<p><br/></p>
		
		<%
		if(res == 1)
		{
		%>
			<p>이미 사용중인 별명 입니다.</p>
			<form name="myform" method="post" action="<%=request.getContextPath()%>/nickNameCheck.mem">
				<input type="text" name="nickname"/>
				<input type="button" value="별명검색" onclick="nickNameCheck()"/>
			</form>	
		<% 
		}
		else if(res == 0)
		{
		%>
			<p><font color="red"> 입력하신  "<%=nickname%>" 는 사용가능합니다</font></p>
			<p>
				<input type="button" value="별명사용하기" onclick="useNickName()"/>
			</p>
		<%
		}
		%>
	</div>
</body>
</html>