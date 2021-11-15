<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String nickname = (String) request.getAttribute("nickname");
  int res = (int) request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>idCheck.jsp</title>
  <script>
	  function nickCheck() {
		  var nickname = myform.nickname.value;
		  if(nickname=="") {
			  alert("닉네임을 입력하세요!");
			  myform.nickname.focus();
		  }
		  else {
			  myform.submit();
		  }
	  }
	  function sendCheck() {
		  opener.window.document.myform.nickname.value = "<%=nickname%>";
		  opener.window.document.myform.name.focus();
		  window.close();
	  }
  </script>
</head>
<body>
<div class="container">
	<p><br/></p>
<%if(res == 0) { %>
    <h3><%=nickname %>는 이미 사용중인 닉네임 입니다.</h3>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/nickCheck.mem">
      <input type="text" name="nickname"/>
      <input type="button" value="닉네임검색" onclick="nickCheck()"/>
    </form>
<%} else { %>
    <h3><font color='red'><%=nickname%></font> 닉네임은 사용 가능합니다.</h3>
    <p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
<%  } %>
</div>
</body>
</html>