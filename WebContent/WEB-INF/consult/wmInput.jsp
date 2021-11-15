<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmInput.jsp</title>
  <script>
    function fCheck() {
    	var receiveId = myform.receiveId.value;
    	var title = myform.title.value;
    	var content = myform.content.value;
    	
    	if(receiveId == "") {
    		alert("받는 사람 아이디를 입력하세요!");
    		myform.receiveId.focus();
    	}
    	else if(title == "") {
    		alert("메세지 제목을 입력하세요!");
    		myform.title.focus();
    	}
    	else if(content == "") {
    		alert("메세지 내용을 입력하세요!");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
  <style>
    table {
      margin : 0px auto;
      width : 650px;
      border-collapse: collapse;
    }
    td {
      border : 1px solid #ccc;
      background-color: #ddd;
    }
  </style>
</head>
<body>
<%@ include file="/include/sCheck.jsp" %>
<div class="container">
  <form name="myform" method="post" action="${contextPath}/wmInputOk.ct">
    <table class="table">
      <tr>
        <td>보내는 사람</td>
        <td><input type="text" name="sendId" value="${smid}" readonly/></td>
      </tr>
      <tr>
        <td>받는 사람</td>
        <td><input type="text" name="receiveId" value="${param.receiveId}" value="받는사람 아이디"/>관리자아이디(admin)</td>
      </tr>
      <tr>
        <td>메세지 제목</td>
        <td><input type="text" name="title" size="68" placeholder="메세지 제목 입력란..."/></td>
      </tr>
      <tr>
        <td>메세지 내용</td>
        <td><textarea rows="7" cols="70" name="content"></textarea></td>
      </tr>
      <tr>
        <td colspan=2 style="text-align:center;">
        	<input type="button" value="메세지 전송" onclick="fCheck()"/> &nbsp;
        	<input type="reset" value="다시쓰기"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>