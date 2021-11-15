<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/include/sCheck.jsp" %>
<%@ include file="/include/navhome.jsp" %>
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
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>svContent.jsp</title>
  <link href="./main.a3f694c0.css" rel="stylesheet">
  <script>
    function svDelCheck() {
    	var ans = confirm("삭제 하시겠습니까?");
    	if(ans)
    		location.href="svDelete.su?idx=${vo.idx}&sdate=${vo.sdate}";
    }
  </script>
  <style>
  
  </style>
</head>
<body>


<c:if test="${empty smenu}">
</c:if>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${contextPath}/svUpdateOk.su">
    <br/>
    <table class="table">
      <tr>
        <th>설문시작일</th>
        <td>${fn:substring(vo.sdate,0,10)}</td>
      </tr>
      <tr>
        <th>분류</th>
        <td>${vo.kwajung}</td>
      </tr>
      <tr>
        <th>상품명</th>
        <td><input type="text" name="kwamok" value="${vo.kwamok}" size="70" autofocus/></td>
      </tr>
      <tr>
        <th>설문단위코드</th>
        <td><input type="text" name="kcode" value="${vo.kcode}" size="70"/></td>
      </tr>
      <tr>
        <th>설문단위명</th>
        <td><input type="text" name="danwi" value="${vo.danwi}" size="70"/></td>
      </tr>
      <tr>
        <th>설문종료일</th>
        <td><input type="text" name="wdate" value="${vo.wdate}" size="70"/></td>
      </tr>
    </table>
    <br/>
    <table class="table">
      <tr>
        <th>문항1</th>
        <td><input type="text" name="question1" size="70" value="${vo.question1}"/></td>
      </tr>
      <tr>
        <th>문항2</th>
        <td><input type="text" name="question2" size="70" value="${vo.question2}"/></td>
      </tr>
      <tr>
        <th>문항3</th>
        <td><input type="text" name="question3" size="70" value="${vo.question3}"/></td>
      </tr>
      <tr>
        <th>문항4</th>
        <td><input type="text" name="question4" size="70" value="${vo.question4}"/></td>
      </tr>
      <tr>
        <th>문항5</th>
        <td><input type="text" name="question5" size="70" value="${vo.question5}"/></td>
      </tr>
      <tr>
        <th>문항6</th>
        <td><input type="text" name="question6" size="70" value="${vo.question6}"/></td>
      </tr>
      <tr>
        <th>문항7</th>
        <td><input type="text" name="question7" size="70" value="${vo.question7}"/></td>
      </tr>
      <tr>
        <th>문항8</th>
        <td><input type="text" name="question8" size="70" value="${vo.question8}"/></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;">
          <c:if test="${slevel == 0}">
	          <input type="submit" value="수정"/> &nbsp;
	          <input type="button" value="삭제" onclick="svDelCheck()"/> &nbsp;
	          <input type="reset" value="다시입력"/> &nbsp;
          </c:if>
          <input type="button" value="메뉴로 이동" onclick="location.href='svList.su?sdate=${vo.sdate}';"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}"/>
    <input type="hidden" name="sdate" value="${vo.sdate}"/>
  </form>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>