<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${empty smenu}">
	<%@ include file="/include/sCheck.jsp" %>
	<%@ include file="/include/navhome.jsp" %>
</c:if>
<!DOCTYPE html>
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
  <title>svList.jsp</title>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
	<script>
    function sdateCheck() {
    	var sdate = document.getElementById("sdate");
    	var sdateValue = sdate.options[sdate.selectedIndex].value;
    	if(sdate == "") {
    		alert("과정 시작일을 선택하세요.");
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>

</head>
</head>
<body>

<%-- <div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li class="selected"><a href="<%=request.getContextPath()%>/svList.su">Research</a></li>
			<li><a href="${contextPath}/pList.pds">Share</a></li>
			<li><a href="./about2.jsp">Blog</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div> --%>
<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" >
    <div class="overlay"></div>
       <div class="row">
           <div class="col-xs-12">
						 <form name="myform" method="post" action="${contextPath}/svList.su">
							    <table class="table">
							      <tr>
							        <td style="text-align:left;border:none;">시작일
							          <select id="sdate" name="sdate" onchange="sdateCheck()">
							            <option value="">전체</option>
							            <c:forEach var="sdateVar" items="${sdateArr}">
							              <option value="${fn:substring(sdateVar,0,10)}" <c:if test="${fn:substring(sdate,0,10)==fn:substring(sdateVar,0,10)}"> selected </c:if>>
							                ${fn:substring(sdateVar,0,10)}
							              </option>
							            </c:forEach>
							          </select>
							        </td>
							        <td style="text-align:right;border:none;">
							          <c:if test="${slevel == 0}">
							          	<input type="button" value="리서치 등록" onclick="location.href='${contextPath}/svInput.su';"/>
							          </c:if>
							          <input type="button" value="Blog" onclick="location.href='${contextPath}/about2.jsp';"/>
							        </td>
							      </tr>
							    </table>
							    <table class="table">
							      <tr>
							        <th>번호</th>
							        <th>제목</th>
							        <th>상품명</th>
							        <th>내용</th>
							        <th>마감일</th>
							        <th>설문참여</th>
							        <th>참여자수</th>
							      </tr>
							      <c:forEach var="vo" items="${vos}">
							        <tr>
							          <td>${vo.idx}</td>
							          <td>${vo.kwajung}</td>
							          <td>
							            <a href="${contextPath}/svContent.su?idx=${vo.idx}"><font color='#00f'>${vo.kwamok}</font></a>
							          </td>
							          <td>${vo.danwi}(${vo.kcode})</td>
							          <td>${vo.wdate}</td>
							          <td><input type="button" value="참여" onclick="location.href='${contextPath}/svAnswerInput.su?idx=${vo.idx}&mid=${smid }';"/></td>
							          <td>
							            <c:if test="${vo.answerCnt != 0}">
							              <c:if test="${slevel == 0}">
								          		<a href="${contextPath}/savList.su?idx=${vo.idx}&sdate=${sdate}" style="color:black;">${vo.answerCnt}</a>
							              </c:if>
							              <c:if test="${slevel != 0}">
								          		<a href="${contextPath}/svResult.su?idx=${vo.idx}&sdate=${sdate}" style="color:black;" >${vo.answerCnt}</a>
							              </c:if>
							            </c:if>
							            <c:if test="${vo.answerCnt == 0}">
							          		${vo.answerCnt}
							            </c:if>
							          </td>
							        </tr>
							      </c:forEach>
							    </table>
							    <p><br/></p>
							    <c:if test="${!empty smenu}">
							    	<p><input type="button" value="돌아가기" onclick="location.href='${contextPath}/amSurvey.ad';"/></p>
							    </c:if>
							    <input type="hidden" name="mid" value="${smid }"/>
							    <input type="hidden" name="idx" value="${vo.survey_idx }"/>
							    <input type="hidden" name="sdate" value="${vo.sdate}"/>
	 							</form>
							</div>
           </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>