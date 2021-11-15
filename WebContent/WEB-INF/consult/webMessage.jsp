<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
	  <meta content="width=device-width,initial-scale=1" name="viewport">
	  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="./assets/favicon.ico" rel="icon">

  <title>webMessage.jsp</title>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
  <style>
    .leftwin {
      float : left;
      width : 25%;
      text-align : center;
      background-color: #ddd;
    }
    .rightwin {
      float : left;
      width : 75%;
      text-align : left;
      background-color: #eee;
    }
  </style>
</head>
<body>
<%@ include file="/include/sCheck.jsp" %>
<%@ include file="/include/navhome.jsp" %>
<p><br/></p>
<div class="container">
  <div>
    <h2>메세지 관리</h2>(현재접속자:<font color='red'>${smid}</font>)
  </div>
  <br/>
  <div class="leftwin">
    <p><a href="${contextPath}/components.jsp">MyPage</a></p>
    <p><a href="${contextPath}/webMessage.ct?msw=0">메세지작성</a></p>
    <p><a href="${contextPath}/webMessage.ct?msw=1">받은메세지</a></p>
    <p><a href="${contextPath}/webMessage.ct?msw=2">새메세지</a></p>
    <p><a href="${contextPath}/webMessage.ct?msw=3">보낸메세지</a></p>
    <p><a href="${contextPath}/webMessage.ct?msw=4">수신확인</a></p>
<%--     <p><a href="${contextPath}/webMessage.ct?msw=5">휴지통</a></p> --%>
<%--     <p><a href="${contextPath}/webMessage.ct?msw=6">휴지통비우기</a></p> --%>
  </div>
  <div class="rightwin">
    <p>
      <c:if test="${msw == 0}">  <!-- 메세지 작성 -->
        <h3 style="text-align:center;">메세지 작성</h3>
        <jsp:include page="wmInput.jsp"/>
      </c:if>
      <c:if test="${msw == 1}">  <!-- 받은 메세지-->
        <h3 style="text-align:center;">받은 메세지</h3>
        <jsp:include page="wmList.jsp"/>
      </c:if>
      <c:if test="${msw == 2}">  <!-- 새메세지 -->
        <h3 style="text-align:center;">새 메세지</h3>
        <jsp:include page="wmList.jsp"/>
      </c:if>
      <c:if test="${msw == 3}">  <!-- 보낸 메세지 -->
        <h3 style="text-align:center;">보낸 메세지</h3>
        <jsp:include page="wmList.jsp"/>
      </c:if>
      <c:if test="${msw == 4}">  <!-- 수신 확인 -->
        <h3 style="text-align:center;">수신 확인</h3>
        <jsp:include page="wmList.jsp"/>
      </c:if>
      <c:if test="${msw == 5}">  <!-- 휴지통 목록 -->
        <h3 style="text-align:center;">휴지통 목록</h3>
        <jsp:include page="wmList.jsp"/>
      </c:if>
		  <c:if test="${msw == 6}">  <!-- 메세지 내용보기 -->
        <h3 style="text-align:center;">메세지 내용</h3>
        <jsp:include page="wmContent.jsp"/>
      </c:if> 
    </p>
  </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>