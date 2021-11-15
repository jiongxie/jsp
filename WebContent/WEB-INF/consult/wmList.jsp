<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmList.jsp</title>
  <script>
    function msgDel(idx) {
    	var ans = confirm("메세지를 삭제하시겠습니까?");
    	if(ans)
    		alert("삭제처리합니다.");
    }
  </script>
</head>
<body>
<%@ include file="/include/sCheck.jsp" %>
<div class="container">
  <table class="table" style="width:100%; margin:0px">
    <tr style="background-color:#ccc;">
      <td>
        <c:if test="${msw==1 || msw==2 || msw==5}">보낸사람</c:if>
        <c:if test="${msw==3 || msw==4}">받은사람</c:if>
      </td>
      <td>메세지 제목</td>
      <td>받은날짜</td>
    </tr>
    <c:forEach var="vo" items="${vos}">
      <tr>
        <td>
          <c:if test="${msw==1 || msw==2 || msw==5}">${vo.sendId}</c:if>
        	<c:if test="${msw==3 || msw==4}">${vo.receiveId}</c:if>
        </td>
        <td>
          <c:if test="${msw != 5}">
	          <a href="${contextPath}/webMessage.ct?idx=${vo.idx}&msw=6">${vo.title}</a>
	          <c:if test="${vo.receiveSw=='n'}"><img src="${contextPath}/images/new.gif"/></c:if>
	        </c:if>
          <c:if test="${msw == 5}">
            <a href="javascript:msgDel(${vo.idx})">${vo.title}(삭제)</a>   <!-- 이곳 할차례....... -->
          </c:if>
        </td>
        <td>${vo.receiveDate}</td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>