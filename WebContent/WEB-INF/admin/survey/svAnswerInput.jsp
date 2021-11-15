<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<c:if test="${slevel != 0}">
	<%@ include file="/include/sCheck.jsp" %>
</c:if>
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
  <title>svAnswerInput.jsp</title>  
  <link href="./main.a3f694c0.css" rel="stylesheet">
  <style>
  	
  </style>
</head>
<body>



<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./allweather/assets/images/img-13.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
								  <form name="myform" method="post" action="${contextPath}/svAnswerInputOk.su">
								    <table class="table">
								      <tr>
								        <th>설문시작일</th>
								        <td class="tblleft">${fn:substring(vo.sdate,0,10)}</td>
								      </tr>
								      <tr>
								        <th>상품명</th>
								        <td style="text-align:left;">${vo.kwajung}</td>
								      </tr>
								      <tr>
								        <th>내용</th>
								        <td style="text-align:left;">${vo.kwamok}</td>
								      </tr>
								      <tr>
								        <th>설문단위코드</th>
								        <td style="text-align:left;">${vo.kcode} ${vo.danwi}</td>
								      </tr>
								      <tr>
								        <th>설문종료일</th>
								        <%-- <td style="text-align:left;">${fn:substring(vo.wdate,0,10)}</td> --%>
								        <td style="text-align:left;">${vo.wdate}</td>
								      </tr>
								    </table>
								    <table class="table">
								      <tr>
								        <td rowspan="2"></td>
								        <td colspan="5">점수배점</td>
								      </tr>
								      <tr>
								        <td>매우만족(5)</td>
								        <td>만족(4)</td>
								        <td>보통(3)</td>
								        <td>불만(2)</td>
								        <td>매우불만(1)</td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question1}</td>
								        <td><input type="radio" name="answer1" value="5"/></td>
								        <td><input type="radio" name="answer1" value="4" checked/></td>
								        <td><input type="radio" name="answer1" value="3"/></td>
								        <td><input type="radio" name="answer1" value="2"/></td>
								        <td><input type="radio" name="answer1" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question2}</td>
								        <td><input type="radio" name="answer2" value="5"/></td>
								        <td><input type="radio" name="answer2" value="4" checked/></td>
								        <td><input type="radio" name="answer2" value="3"/></td>
								        <td><input type="radio" name="answer2" value="2"/></td>
								        <td><input type="radio" name="answer2" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question3}</td>
								        <td><input type="radio" name="answer3" value="5"/></td>
								        <td><input type="radio" name="answer3" value="4" checked/></td>
								        <td><input type="radio" name="answer3" value="3"/></td>
								        <td><input type="radio" name="answer3" value="2"/></td>
								        <td><input type="radio" name="answer3" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question4}</td>
								        <td><input type="radio" name="answer4" value="5"/></td>
								        <td><input type="radio" name="answer4" value="4" checked/></td>
								        <td><input type="radio" name="answer4" value="3"/></td>
								        <td><input type="radio" name="answer4" value="2"/></td>
								        <td><input type="radio" name="answer4" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question5}</td>
								        <td><input type="radio" name="answer5" value="5"/></td>
								        <td><input type="radio" name="answer5" value="4" checked/></td>
								        <td><input type="radio" name="answer5" value="3"/></td>
								        <td><input type="radio" name="answer5" value="2"/></td>
								        <td><input type="radio" name="answer5" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question6}</td>
								        <td><input type="radio" name="answer6" value="5"/></td>
								        <td><input type="radio" name="answer6" value="4" checked/></td>
								        <td><input type="radio" name="answer6" value="3"/></td>
								        <td><input type="radio" name="answer6" value="2"/></td>
								        <td><input type="radio" name="answer6" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question7}</td>
								        <td><input type="radio" name="answer7" value="5"/></td>
								        <td><input type="radio" name="answer7" value="4" checked/></td>
								        <td><input type="radio" name="answer7" value="3"/></td>
								        <td><input type="radio" name="answer7" value="2"/></td>
								        <td><input type="radio" name="answer7" value="1"/></td>
								      </tr>
								      <tr>
								        <td class="tblleft">${vo.question8}</td>
								        <td colspan="5">
								          <textarea rows="8" cols="60" name="answer8"></textarea>
								        </td>
								      </tr>
								      <tr>
								        <td colspan="6">
								          <input type="submit" value="설문참여"/> &nbsp;
								          <input type="reset" value="다시작성"/> &nbsp;
								          <input type="button" value="메뉴로이동" onclick="location.href='${contextPath}/svList.su?sdate=${vo.sdate}';"/>
								        </td>
								      </tr>
								    </table>
								    <input type="hidden" name="survey_idx" value="${vo.idx}"/>
								    <input type="hidden" name="sdate" value="${vo.sdate}"/>
								    <input type="hidden" name="mid" value="${smid}"/>
								  </form>
                <p><br/></p>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>

</body>
</html>