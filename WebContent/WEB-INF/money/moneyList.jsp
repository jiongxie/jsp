<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<title>moneyList.jsp</title>
	<style>
		/*달력의 매주 일요일 텍스트 컬러 적용 부분*/
		#td1,#td8,#td15,#td22,#td29,#td36
		{
			color: hotpink;
		}
		
		/*달력의 매주 토요일 텍스트 컬러 적용 부분*/
		#td7,#td14,#td21,#td28,#td35,#td42
		{
			color: skyblue;
		}
		
		/*오늘날자에 배경색 표시  #f94e3f */
		.today
		{
			/*background-color: #f94e3f;*/
			font-size: 1.5em;
			font-family: cursive;
			color: #fff;
			text-align: center;
			-webkit-animation: glow 1s ease-in-out infinite alternate;
			-moz-animation: glow 1s ease-in-out infinite alternate;
			animation: glow 1s ease-in-out infinite alternate;
		}
		@-webkit-keyframes glow 
		{
		  from {
		    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
		  }
		  
		  to {
		    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
		  }
		}
	</style>
</head>
<body style="background-image: url('${ctp}/image/bg10.jpg');background-size:inherit;color:white;">
<%@ include file="/include/navhome.jsp" %>
<%@ include file="/include/sCheck.jsp" %>
<c:set var="ipkumTot"  value="0"/>
<c:set var="jichulTot" value="0"/>
<link href="${contextPath }/main.a3f694c0.css" rel="stylesheet">
<%-- <c:forEach begin="1" end="${lastDay}" varStatus="i">
	<c:set var="ipkumTot" value="${ipkumTot=ipkumTot+ipkumArr[i.index]}"/>
	<c:set var="jichulTot" value="${jichulTot=jichulTot+jichulArr[i.index]}"/>
</c:forEach> --%>
<c:forEach var="ipkum" items="${ipkumArr}">
	<c:set var="ipkumTot">${ipkumTot=ipkumTot+ipkum}</c:set>
</c:forEach>
<c:forEach var="jichul" items="${jichulArr}">
	<c:set var="jichulTot">${jichulTot=jichulTot+jichul}</c:set>
</c:forEach>
	<div class="container-fluid" style="margin-top: 30px;margin-bottom: 30px;width:90%;">
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;font-size: 3em;text-align: center;">
		  	<label class="today">${yy}년 ${mm+1}월 </label>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<br><!-- 공백 -->
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 1em;text-align: left;">
		  	수입
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 2em;text-align: right;">
		  	<font color="#67D5B5"><fmt:formatNumber value="${ipkumTot}" type="currency"/> 원</font>
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 1em;text-align: left;">
		  	지출
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 2em;text-align: right;">
		  	<font color="#EE7785"><fmt:formatNumber value="${jichulTot}" type="currency"/> 원</font>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<br><!-- 공백 -->
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 1em;text-align: left;">
		  	수입-지출
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 2em;text-align: right;">
		  	<font color="#C89EC4"><fmt:formatNumber value="${ipkumTot-jichulTot}" type="currency"/> 원</font>
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 1em;text-align: left;">
		  	지출구분
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;font-size: 1.5em;text-align: right;">
		  	<c:forEach var="jichulkubunItem" items="${jichulKubunVos}">
			  	<p ${jichulkubunItem.jichul_kubun == '현금' ? 'style=color:#EFDC05;' : '' || jichulkubunItem.jichul_kubun == '체크카드' ? 'style=color:#67D5B5;' : '' || jichulkubunItem.jichul_kubun == '신용카드' ? 'style=color:#84B1ED;' : ''}>
			  		${jichulkubunItem.jichul_kubun} : <fmt:formatNumber value="${jichulkubunItem.kumak}" type="currency"/> 원 
			  	</p>
		  	</c:forEach>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<br><!-- 공백 -->
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-1" style="background-color:#1c140d;text-align:center;padding-top: 350px;">
		  	<button class="btn btn-info" onclick="location.href='${ctp}/moneyList.don?yy=${yy-1}&mm=${mm}'" title="이전년도">&lt;&lt;</button>
		  </div>
		  <div class="col-sm-1" style="background-color:#1c140d;text-align: center;padding-top: 350px;">
		  	<button class="btn btn-info" onclick="location.href='${ctp}/moneyList.don?yy=${yy}&mm=${mm-1}'" title="이전월">&lt;</button>
		  </div>
		  <!-- 달력시작 -->
		  <div class="col-sm-8" style="background-color:#1c140d;font-size: 1em;text-align: left;height:700px;">
		  	<table class="table table-dark table-bordered" style="height:100%">
		  		<tr style="text-align: center;font-size: 2em;background-color: #263959;">
					<th style="color:hotpink;width:14%;vertical-align: middle;">일</th>
					<th style="width:14%;vertical-align: middle;">월</th>
					<th style="width:14%;vertical-align: middle;">화</th>
					<th style="width:14%;vertical-align: middle;">수</th>
					<th style="width:14%;vertical-align: middle;">목</th>
					<th style="width:14%;vertical-align: middle;">금</th>
					<th style="color:skyblue;width:14%;vertical-align: middle;">토</th>
				</tr>
				<tr>
					<!-- cnt 변수로  일주일마다 줄바꿈을 하기위해 선언-->
					<c:set var="cnt" value="1"/>
					
					<!-- 이전월 날자 출력부분  -->
				  	<c:forEach var="preDay" begin="${preLastDay - (startWeek - 2) }" end="${preLastDay}">
					  	<c:set var="ymd">${preYear}-${preMonth+1}-${preDay}</c:set>
					  	<td id="td${cnt}" style="color: #c8c8a9;">
					  		${preYear}-${preMonth+1}-${preDay}
				  		</td>
				  		<c:set var="cnt" value="${cnt=cnt+1}"/>
				  	</c:forEach>
				  	
				  	<!-- 해당월 날자 반복문 -->
				  	<c:forEach begin="1" end="${lastDay}" varStatus="i">
				  		<!-- 오늘날자와 동일한지 체크한후 todaySw에 값을 저장후  해당 td에 클래스 이름을 today 라고 부여 -->
					  	<c:set var="ymd">${yy}-${mm+1}-${i.count}</c:set>
					  	<c:set var="todaySw" value="${yy == toYear && mm == toMonth && i.count == toDay ? 1 : 0}"/>
					  	<td id="td${cnt}" ${todaySw == 1 ? 'class=today' : '' } onclick="ymdCheck('${cnt}','${ymd}')">
					  		${i.count} <c:if test="${todaySw == 1 }"><label class="today">오늘</label></c:if>
					  		<br><font color="#67D5B5"><fmt:formatNumber value="${ipkumArr[i.count-1] > 0 ? ipkumArr[i.count-1] : ''}" type="currency"/></font>
					  		<br><font color="#EE7785"><fmt:formatNumber value="${jichulArr[i.count-1] > 0 ? jichulArr[i.count-1] : ''}" type="currency"/></font>
				  		</td>
				  		<c:if test="${cnt % 7 == 0 }"> 
				  			</tr> <tr>
				  		</c:if>
				  		<c:set var="cnt" value="${cnt=cnt+1}"/>
				  	</c:forEach>
				  	
				  	<!-- 다음월 날자 출력부분 -->
				  	 <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
					  	<c:set var="ymd">${nextYear}-${nextMonth+1}-${nextDay.count}</c:set>
					  	<td id="td${cnt}" style="color: #c8c8a9;">
					  		${nextYear}-${nextMonth+1}-${nextDay.count}
				  		</td>
				  		<c:set var="cnt" value="${cnt=cnt+1}"/>
				  	</c:forEach>
				  	
				</tr>
		  	</table>
		  </div>
		  <!-- 달력끝 -->
		  <div class="col-sm-1" style="background-color:#1c140d;text-align: center;padding-top: 350px;">
		  	<button class="btn btn-info" onclick="location.href='${ctp}/moneyList.don?yy=${yy}&mm=${mm+1}'" title="다음월">&gt;</button>
		  </div>
		  <div class="col-sm-1" style="background-color:#1c140d;text-align: center;padding-top: 350px;">
		  	<button class="btn btn-info" onclick="location.href='${ctp}/moneyList.don?yy=${yy+1}&mm=${mm}'" title="다음년도">&gt;&gt;</button>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<br><!-- 공백 -->
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-3" style="background-color:#1c140d;text-align: center;"></div>
		  <div class="col-sm-3" style="background-color:#1c140d;text-align: center;">
		  	<button class="btn btn-success btn-block" style="font-size: 2em;" onclick="moneyInput(1)" >입금</button>
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;text-align: center;">
		  	<button class="btn btn-danger btn-block" style="font-size: 2em;" onclick="moneyInput(2)" >지출</button>
		  </div>
		  <div class="col-sm-3" style="background-color:#1c140d;text-align: center;"></div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<br><!-- 공백 -->
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-12" style="background-color:#1c140d;text-align: center;">
		  	<a href='${contextPath }/components.jsp'><button class="btn btn-block" style="background-color: #ff4e50;" onclick="" >
		  		<font style="font-size: 2em;"><i class="fa fa-home">MyPage</i></font>
		  	</button></a>
		  </div>
		</div>
	</div>
	<div class="container-fluid" id="thisClickList" style="margin-top: 30px;margin-bottom: 30px;width:70%;">
	<!--클릭리스트 들어갈부분  -->
	</div>
	<script>
	// ${cnt} 최종증가한 수를 받아야하기 때문에 스크립트를 하단에 선언
	
	var ymd = "";//최종 "등록" 버튼 클릭시 전달되어야할 값때문에 전역변수로 선언
	
		function ymdCheck(tdId,thisYmd)
		{
			ymd = thisYmd;
			var totCnt = ${cnt} ;
			
			document.getElementById("td"+tdId).style.backgroundColor = "#7200da";
			
			for(var i=1; i<totCnt; i++)
			{
				if(i != tdId)
				{
					document.getElementById("td"+i).style.backgroundColor = "";
				}
			}
			
			//해당일자 클릭시 리스트 뿌려주기
			$.ajax({
				url : "${ctp}/thisClickList.don",
				type : "post",
				data : {
					mid : "${smid}",
					mdate : thisYmd
				},
				success:function(data){
					document.getElementById("thisClickList").innerHTML = data;
				}
			});
		}
	
		function moneyInput(sw)
		{
			var kumak_kubun = "";
			var mid = "${smid}";
			if(ymd == "")
			{
				alert("날짜를 클릭한 후 입금 또는 지출을 클릭하세요");
				return false;
			}
			
			if(sw == 1){kumak_kubun = "입금";}
			else if(sw == 2){kumak_kubun = "지출";}
			
			//alert(ymd + "/" + kumak_kubun + "/" + mid); //결과 잘 나옴
			location.href = "${ctp}/moneyInput.don?ymd="+ymd+"&kumak_kubun="+kumak_kubun+"&mid="+mid;
		}
	</script>
</body>
	<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</html>