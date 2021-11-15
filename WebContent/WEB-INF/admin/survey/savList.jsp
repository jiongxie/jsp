<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>savList.jsp</title>
  <script>
    function answerDelCheck() {
    	var ans = confirm("현제 답변지를 삭제하시겠습니까?");
    	if(ans)
    		location.href="svAnswerDelete.su?idx=${vo.idx}&sdate=${vo.sdate}";
    }
    
    // 전체 자료 출력
    function totalPrint() {
    	var ans = confirm("현재 능력단위의 전체 페이지가 출력됩니다. 계속하시겠습니까?");
    	if(ans)
    		location.href="svAnswerTotalPrint.su?idx=${vo.survey_idx}&sdate=${vo.sdate}";
    }
  </script>
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
	<%@ include file="/include/navhome.jsp" %>
</c:if>
<br/>
<div class="container">
  <form name="myform" method="post" action="${contextPath}/svAnswerInputOk.su">
    <h2>리서치</h2>
    <br/>
    <table class="table">
      <tr>
        <th>시작일</th>
        <td class="tblleft">${fn:substring(vo.sdate,0,10)}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td style="text-align:left;">${vo.kwajung}</td>
      </tr>
      <tr>
        <th>상품명</th>
        <td style="text-align:left;">${vo.kwamok}</td>
      </tr>
      <tr>
        <th>내용</th>
        <td style="text-align:left;">${vo.kcode} ${vo.danwi}</td>
      </tr>
      <tr>
        <th>마감일</th>
        <%-- <td style="text-align:left;">${fn:substring(vo.wdate,0,10)}</td> --%>
        <td style="text-align:left;">${vo.wdate}</td>
      </tr>
    </table>
    <table class="table">
      <tr style="background-color:green;">
        <td rowspan="2"></td>
        <td colspan="5">점수배점</td>
      </tr>
      <tr style="background-color:pink;">
        <td>매우만족(5)</td>
        <td>만족(4)</td>
        <td>보통(3)</td>
        <td>불만(2)</td>
        <td>매우불만(1)</td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question1}</td>
        <td><input type="radio" name="answer1" value="5" ${vo.answer1=='5' ? 'checked' : ''}/></td>
        <td><input type="radio" name="answer1" value="4" ${vo.answer1=='4' ? 'checked' : ''}/></td>
        <td><input type="radio" name="answer1" value="3" ${vo.answer1=='3' ? 'checked' : ''}/></td>
        <td><input type="radio" name="answer1" value="2" ${vo.answer1=='2' ? 'checked' : ''}/></td>
        <td><input type="radio" name="answer1" value="1" ${vo.answer1=='1' ? 'checked' : ''}/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question2}</td>
        <td><input type="radio" name="answer2" value="5" <c:if test="${vo.answer2 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer2" value="4" <c:if test="${vo.answer2 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer2" value="3" <c:if test="${vo.answer2 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer2" value="2" <c:if test="${vo.answer2 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer2" value="1" <c:if test="${vo.answer2 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question3}</td>
        <td><input type="radio" name="answer3" value="5" <c:if test="${vo.answer3 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer3" value="4" <c:if test="${vo.answer3 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer3" value="3" <c:if test="${vo.answer3 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer3" value="2" <c:if test="${vo.answer3 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer3" value="1" <c:if test="${vo.answer3 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question4}</td>
        <td><input type="radio" name="answer4" value="5" <c:if test="${vo.answer4 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer4" value="4" <c:if test="${vo.answer4 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer4" value="3" <c:if test="${vo.answer4 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer4" value="2" <c:if test="${vo.answer4 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer4" value="1" <c:if test="${vo.answer4 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question5}</td>
        <td><input type="radio" name="answer5" value="5" <c:if test="${vo.answer5 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer5" value="4" <c:if test="${vo.answer5 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer5" value="3" <c:if test="${vo.answer5 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer5" value="2" <c:if test="${vo.answer5 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer5" value="1" <c:if test="${vo.answer5 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question6}</td>
        <td><input type="radio" name="answer6" value="5" <c:if test="${vo.answer6 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer6" value="4" <c:if test="${vo.answer6 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer6" value="3" <c:if test="${vo.answer6 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer6" value="2" <c:if test="${vo.answer6 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer6" value="1" <c:if test="${vo.answer6 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question7}</td>
        <td><input type="radio" name="answer7" value="5" <c:if test="${vo.answer7 eq '5'}">checked</c:if>/></td>
        <td><input type="radio" name="answer7" value="4" <c:if test="${vo.answer7 eq '4'}">checked</c:if>/></td>
        <td><input type="radio" name="answer7" value="3" <c:if test="${vo.answer7 eq '3'}">checked</c:if>/></td>
        <td><input type="radio" name="answer7" value="2" <c:if test="${vo.answer7 eq '2'}">checked</c:if>/></td>
        <td><input type="radio" name="answer7" value="1" <c:if test="${vo.answer7 eq '1'}">checked</c:if>/></td>
      </tr>
      <tr>
        <td class="tblleft">${vo.question8}</td>
        <td colspan="5">
          <textarea rows="8" cols="60" name="answer8">${vo.answer8}</textarea>
        </td>
      </tr>
      <tr>
        <td colspan="6">
          <c:set var="curNo" value="${vo.curNo}"/>
          <c:if test="${curNo gt 1}">
          	<input type="button" value="처음" onclick="location.href='savList.su?idx=${vo.survey_idx}&sdate=${vo.sdate}&curNo=${1}';"/>
          	<input type="button" value="이전" onclick="location.href='savList.su?idx=${vo.survey_idx}&sdate=${vo.sdate}&curNo=${curNo-1}';"/>
          </c:if>
          &nbsp;: 총 ${vo.answerCnt}건 중에서 ${vo.curNo}번째:&nbsp;
          <c:if test="${vo.curNo lt vo.answerCnt}">
          	<input type="button" value="다음" onclick="location.href='savList.su?idx=${vo.survey_idx}&sdate=${vo.sdate}&curNo=${curNo+1}';"/>
          	<input type="button" value="마지막" onclick="location.href='savList.su?idx=${vo.survey_idx}&sdate=${vo.sdate}&curNo=${vo.answerCnt}';"/>
          </c:if>
          &nbsp; &nbsp; &nbsp; 
          <input type="button" value="삭제" onclick="answerDelCheck()"/> &nbsp;
          <input type="button" value="결과보기" onclick="location.href='svResult.su?idx=${vo.survey_idx}&sdate=${sdate}';"/>
          &nbsp; : &nbsp;
          <input type="button" value="개별출력" onclick="window.print()"/>
          <input type="button" value="전체출력" onclick="totalPrint()"/>
          <input type="button" value="메뉴로이동" onclick="location.href='${contextPath}/svList.su?sdate=${vo.sdate}';"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="survey_idx" value="${vo.idx}"/>
    <input type="hidden" name="sdate" value="${vo.sdate}"/>
  </form>
</div>
<p><br/></p>
</body>
</html>