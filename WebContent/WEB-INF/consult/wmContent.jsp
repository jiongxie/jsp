<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmContent.jsp</title>
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
  <table class="table">
    <tr>
      <td style="width:20%;">보내는 사람</td>
      <td style="width:80%;">${vo.sendId}</td>
    </tr>
    <tr>
      <td>받는 사람</td>
      <td>${vo.receiveId}</td>
    </tr>
    <tr>
      <td>메세지 제목</td>
      <td>${vo.title}</td>
    </tr>
    <tr>
      <td>메세지 내용</td>
      <td>${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
      <td colspan=2 style="text-align:center;">
      	<input type="button" value="답장쓰기" onclick="location.href='${contextPath}/webMessage.ct?msw=0&receiveId=${vo.sendId}';"/> &nbsp;
      	<c:if test="${receiveSw != 'g' && msw == 3}">
      		<input type="button" value="삭제" onclick="location.href='webDeleteCheck.ct?idx=${vo.idx}&msw=${msw}&mflag=${msw}';"/>
      	</c:if>
      	<c:if test="${receiveSw != 'g' && msw == '6'}">
      		<input type="button" value="삭제" onclick="location.href='webDeleteCheck.ct?idx=${vo.idx}&msw=${msw}&mflag=6';"/>
      	</c:if>
<%-- 
      	<c:if test="${receiveSw == 'g'}">
      		<input type="button" value="휴지통비우기" onclick="location.href='webDeleteCheck.ct?idx=${vo.idx}&msw=${msw}&mflag=${msw}';"/>
      	</c:if>
 --%>      	
      </td>
    </tr>
  </table>
</div>
</body>
</html>