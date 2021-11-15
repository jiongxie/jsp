<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>svAnswerTotalPrint.jsp</title>
  <style>
    body {
      width : 100%;
      margin : 0px auto;
    }
    table, h2 {
      width: 800px;
      margin : 0px auto;
      border-collapse: collapse;
      text-align: center;
    }
    th, td {
      border: 1px solid #ccc;
      padding: 15px;
    }
    .tblleft {text-align:left;}
  </style>
</head>
<body>
<c:if test="${slevel != 0}">
	<%@ include file="/include/sCheck.jsp" %>
	<%@ include file="/include/nav.jsp" %>
</c:if>
<br/>
<div class="container">
  <form name="myform" method="post">
    <c:set var="cnt" value="1"/>
    <c:forEach var="vo" items="${vos}">
      <c:set var="answer1" value="${vo.answer1}"/>
	    <c:set var="answer2" value="${vo.answer2}"/>
	    <c:set var="answer3" value="${vo.answer3}"/>
	    <c:set var="answer4" value="${vo.answer4}"/>
	    <c:set var="answer5" value="${vo.answer5}"/>
	    <c:set var="answer6" value="${vo.answer6}"/>
	    <c:set var="answer7" value="${vo.answer7}"/>
	    <c:set var="answer8" value="${vo.answer8}"/>
	    <h2>능력단위 종료 및 평가 만족도 설문</h2>
	    <br/>
	    <table class="table">
	      <tr>
	        <th>과정 시작일</th>
	        <td class="tblleft">${fn:substring(sdate,0,10)}</td>
	      </tr>
	      <tr>
	        <th>과 정 명</th>
	        <td style="text-align:left;">${vo.kwajung}</td>
	      </tr>
	      <tr>
	        <th>과 목 명</th>
	        <td style="text-align:left;">${vo.kwamok}</td>
	      </tr>
	      <tr>
	        <th>능력단위명</th>
	        <td style="text-align:left;">${vo.kcode} ${vo.danwi}</td>
	      </tr>
	      <tr>
	        <th>평가일시</th>
	        <%-- <td style="text-align:left;">${fn:substring(vo.wdate,0,10)}</td> --%>
	        <td style="text-align:left;">${vo.wdate}</td>
	      </tr>
	    </table>
	    <table class="table">
	      <tr style="background-color:orange;">
	        <td rowspan="2"></td>
	        <td colspan="5">점수배점</td>
	      </tr>
	      <tr style="background-color:yellow;">
	        <td>매우만족(5)</td>
	        <td>만족(4)</td>
	        <td>보통(3)</td>
	        <td>불만(2)</td>
	        <td>매우불만(1)</td>
	      </tr>
	      <tr style="height:60px;">
	        <td>${vo.question1}</td>
	        <td>${answer1 == '5' ? '○' : ''}</td>
	        <td>${answer1 == '4' ? '○' : ''}</td>
	        <td>${answer1 == '3' ? '○' : ''}</td>
	        <td>${answer1 == '2' ? '○' : ''}</td>
	        <td>${answer1 == '1' ? '○' : ''}</td>
	      </tr>
	      <tr>
	        <td>${vo.question2}</td>
	        <td><c:if test="${answer2 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer2 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer2 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer2 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer2 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td>${vo.question3}</td>
	        <td><c:if test="${answer3 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer3 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer3 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer3 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer3 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td>${vo.question4}</td>
	        <td><c:if test="${answer4 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer4 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer4 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer4 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer4 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td style="text-align:left;vertical-align:top">${vo.question5}</td>
	        <td><c:if test="${answer5 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer5 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer5 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer5 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer5 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td>${vo.question6}</td>
	        <td><c:if test="${answer6 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer6 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer6 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer6 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer6 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td>${vo.question7}</td>
	        <td><c:if test="${answer7 eq '5'}">○</c:if></td>
	        <td><c:if test="${answer7 eq '4'}">○</c:if></td>
	        <td><c:if test="${answer7 eq '3'}">○</c:if></td>
	        <td><c:if test="${answer7 eq '2'}">○</c:if></td>
	        <td><c:if test="${answer7 eq '1'}">○</c:if></td>
	      </tr>
	      <tr>
	        <td class="tblleft">${vo.question8}</td>
	        <td colspan="5">
	          <textarea rows="8" cols="60" name="answer8">${vo.answer8}</textarea>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="6">
	          : 총 ${vo.answerCnt}건 중에서 ${cnt}번째:&nbsp;
	          &nbsp; &nbsp; &nbsp; 
	          <input type="button" value="전체삭제" onclick="delAllCheck()"/> &nbsp;
	          <input type="button" value="결과보기" onclick="location.href='svResult.su?idx=${vo.survey_idx}&sdate=${sdate}';"/>
	          &nbsp; : &nbsp;
	          <input type="button" value="전체출력" onclick="window.print()"/>
	          <input type="button" value="메뉴로이동" onclick="location.href='${contextPath}/svList.su?sdate=${vo.sdate}';"/>
	        </td>
	      </tr>
	    </table>
	    <input type="hidden" name="survey_idx" value="${vo.idx}"/>
	    <input type="hidden" name="sdate" value="${vo.sdate}"/>
	    <c:set var="cnt" value="${cnt + 1}"/>
	    <p><br/></p>
    </c:forEach>
  </form>
</div>
<p><br/></p>
</body>
</html>