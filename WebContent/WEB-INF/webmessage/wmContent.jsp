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
      <td>금액(원화)</td>
      <td>${vo.title}</td>
    </tr>
    <tr>
      <td>내용</td>
      <td>${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
      <td colspan=2 style="text-align:center;">
      <c:if test="${smid == 'admin'}">
      	<input type="button" value="체결처리" onclick="location.href='${contextPath}/upMoney.mem?su=${vo.title }&mid=${vo.sendId }';"/> &nbsp;
      	<%-- 
      	<input type="button" value="고객회신" onclick="location.href='${contextPath}/webMessage.wm?msw=0&receiveId=${vo.sendId}';"/> &nbsp;
      	 --%>
	   	<c:if test="${receiveSw != 'g'}">
	   		<input type="button" value="삭제" onclick="location.href='webDeleteCheck.wm?idx=${vo.idx}&msw=${msw}&mflag=${msw}';"/>
	   	</c:if>
      </c:if>
      </td>
    </tr>
  </table>
</body>
</html>