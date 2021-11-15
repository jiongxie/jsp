<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/include/navhome.jsp" %>
<%@ include file="/include/sCheck.jsp" %>
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


  <title>svInput.jsp</title>  
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
	<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("todaybirthday");
		bir.value = today;
	}


	</script>
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
<div class="background-image-container white-text-container" style="background-image: url('./assets/images/img-20.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
							  <form name="myform" method="post" action="${contextPath}/svInputOk.su">
							    <table class="table">
							      <tr>
							        <th>시작일</th>
							        <td><input id="todaybirthday" type="date" name="sdate"/></td>
							      </tr>
							      <tr>
							        <th>제목</th>
							        <td><input type="text" name="kwajung" size="70" value="투자"/></td>
							      </tr>
							      <tr>
							        <th>상품명</th>
							        <td><input type="text" name="kwamok" size="70"  value="올웨더 사계절 펀드(risk parity)" autofocus/></td>
							      </tr>
							      <tr>
							        <th>분류</th>
							        <td><input type="text" name="kcode" size="70" value="헷지펀드"/></td>
							      </tr>
							      <tr>
							        <th>내용</th>
							        <td><input type="text" name="danwi" size="70" value="고객 만족도 조사"/></td>
							      </tr>
							      <tr>
							        <th>마감일</th>
							        <td><input type="date" name="wdate"/></td>
							      </tr>
							    </table>
							    <br/>
							    <table>
							      <tr>
							        <th>문항1</th>
							        <td><input type="text" name="question1" size="70" value="1. 웹사이트 편리성"/></td>
							      </tr>
							      <tr>
							        <th>문항2</th>
							        <td><input type="text" name="question2" size="70" value="2. 투자운용실적"/></td>
							      </tr>
							      <tr>
							        <th>문항3</th>
							        <td><input type="text" name="question3" size="70" value="3. 브랜드 품질지각"/></td>
							      </tr>
							      <tr>
							        <th>문항4</th>
							        <td><input type="text" name="question4" size="70" value="4. 브랜드 만족도"/></td>
							      </tr>
							      <tr>
							        <th>문항5</th>
							        <td><input type="text" name="question5" size="70" value="5. 브랜드 선호도"/></td>
							      </tr>
							      <tr>
							        <th>문항6</th>
							        <td><input type="text" name="question6" size="70" value="6. 브랜드 추천의향"/></td>
							      </tr>
							      <tr>
							        <th>문항7</th>
							        <td><input type="text" name="question7" size="70" value="7. 서비스 만족도"/></td>
							      </tr>
							      <tr>
							        <th>문항8</th>
							        <td><input type="text" name="question8" size="70" value="8. 기타 및 건의사항"/></td>
							      </tr>
							      <tr>
							        <td colspan="2" style="text-align:center;">
							          <input type="submit" value="등록"/> &nbsp;
							          <input type="reset" value="다시입력"/> &nbsp;
							          <input type="button" value="메뉴로 이동" onclick="location.href='svList.su?sdate=${vo.sdate}';"/>
							        </td>
							      </tr>
							    </table>
							  </form>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>