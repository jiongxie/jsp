<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 

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
  <form name="myform" method="post" action="${contextPath}/wmInputOk.wm">
    <table class="table">
      <tr>
        <td>발신</td>
        <td><input type="text" name="sendId" value="${smid}" readonly/></td>
      </tr>
      <tr>
        <td>수신</td>
		<c:if test="${smid != 'admin'}">
        	<td><input type="text" name="receiveId" value="admin" readonly/>관리자</td>
		</c:if>
		<c:if test="${smid == 'admin'}">
        	<td><input type="text" name="receiveId" value="${param.receiveId}" placeholder="받는사람 아이디"/></td>
		</c:if>  
      </tr>
      <tr>
        <c:if test="${smid != 'admin'}">
        	<td>신청금액(원화)</td>
        	<td><input type="number" name="title" size="68" placeholder="신청희망하는 금액을 입력하세요"/></td>
        </c:if>
        <c:if test="${smid == 'admin'}">
        	<td>메세지</td>
        	<td><input type="text" name="title" size="68" placeholder=""/></td>
        </c:if>
      </tr>
      <tr>
        <td>내용</td>
        <c:if test="${smid != 'admin'}">
        	<td><textarea rows="6" cols="70" name="content" value="" >위험중립형 금액(원화) 작성후 입금바람.환매신청시 "-" 기재바람  &#13;계좌:신한은행 110-436-****** 올웨더 일임투자 주식회사  &#13; 입금확인시 거래체결</textarea></td>
        </c:if>
        <c:if test="${smid == 'admin'}">
        	<td><textarea rows="6" cols="70" name="content" placeholder="거래체결 확인/"></textarea></td>
        </c:if>	
      </tr>
      <tr>
        <td colspan=2 style="text-align:center;">
        <c:if test="${smid != 'admin'}">
        	<input type="button" value="매매신청" onclick="fCheck()"/> &nbsp;
        </c:if>
        <c:if test="${smid == 'admin'}">
        	<input type="button" value="고객회신" onclick="fCheck()"/> &nbsp;
        </c:if>
        	<input type="reset" value="다시쓰기"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>