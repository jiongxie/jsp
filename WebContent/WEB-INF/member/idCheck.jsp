<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = (String) request.getAttribute("mid");
  int res = (int) request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>idCheck.jsp</title>
  <script>
	  function idCheck() {
		  var mid = myform.mid.value;
		  if(mid=="") {
			  alert("아이디를 입력하세요!");
			  myform.mid.focus();
		  }
		  else {
			  myform.submit();
		  }
	  }
	  function sendCheck() {
		  opener.window.document.myform.mid.value = "<%=mid%>";
		  opener.window.document.myform.pwd.focus();
		  window.close();
	  }
  </script>
</head>
<body>
<div class="container">
	<p><br/></p>
<%-- <%if(!mid.equals("")) { %> --%>
<%if(res == 0) { %>
    <h3><%=mid %>는 이미 사용중인 아이디 입니다.</h3>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/idCheck.mem">
      <input type="text" name="mid"/>
      <input type="button" value="아이디검색" onclick="idCheck()"/>
    </form>
<%} else { %>
    <h3><font color='red'><%=mid%></font> 아이디는 사용 가능합니다.</h3>
    <p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
<%  } %>
</div>
</body>
</html>