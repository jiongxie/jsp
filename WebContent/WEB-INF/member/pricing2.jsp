<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaspring.member.MemberVo"%><%@page import="javaspring.member.MemberVo"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/include/nav.jsp" %>
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

 

  <title>Title page</title>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <!-- Add your content of header -->




<div class="section-container">
    <div class="container">
        <div class="row section-container-spacer">
            <div class="col-xs-12">
                <div class="text-center">
<c:if test="${slevel != 0 }">
                    <h1>${smid }님 보유가치</h1>
</c:if>
<c:if test="${slevel == 0 }">
                    <h1>${smid}</h1>
</c:if>
                </div>
                <div class="col-md-8 col-md-offset-2">
                    <p>
                    </p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
            		<form name="myform" method="post" action="${contextPath }/pricing2.jsp">
                <div class="pricing-card pricing-primary">
                    <h3>안전추구형</h3>
                </div>
                <div class="pricing-features">
                    <ul class="features">
                        <li>철저한 리스크 대비(경제위기시 리스크 최소화)</li>
                        <li>주식:채권=4:6</li>
                    </ul>
                   <input type="hidden" name="tp" value="t1"/>
                </div>
								</form>
            </div>
            <div class="col-md-4">
            		<form name="myform" method="post" action="${contextPath }/webMessage.wm?msw=0">
                <div class="pricing-card pricing-info">
                    <h3>위험중립형</h3>
                    <h6 class="price"> ${vo.money} <span>원</span></h6>
                </div>
                <div class="pricing-features">
                    <ul class="features">
                        <li>기본조합(주식:채권:원자재:금=3:4:1.5:1.5)</li>
                        <li>한층다각화된 자산군추가(회사채,물가연동채,신흥국채권,이머징마켓주식등)</li>
                        <li>시장수익률과 위험헷지를 동시에</li>
                    </ul>
                    <c:if test="${slevel > 0 && slevel < 4}">
                   		<input type="button" class="btn btn-primary" title="" onclick="submit()" value="매매신청"/>
                   	</c:if>
                   	<c:if test="${slevel == 0 }">
                    	<input type="button" class="btn btn-primary" title="" onclick="location.href='${contextPath}/amList.ad'" value="관리메뉴"/>
										</c:if>
                   	<input type="hidden" name="tp" value="t2"/>
                </div>
                </form>
            </div>
            <div class="col-md-4">
           		 <form name="myform" method="post" action="${contextPath }/pricing2.jsp">
                <div class="pricing-card pricing-secondary">
                    <h3>적극투자형</h3>
                </div>
                <div class="pricing-features">
                    <ul class="features">
                        <li>기본조합(주식:채권=7:3)</li>
                        <li>채권레버리지 활용 수익극대환</li>
                        <li>하이리스크 하이리턴</li>
                    </ul>
                    <input type="hidden" name="tp" value="t3"/>
                </div>
                </form>
            </div>
        </div>

    </div>
</div>  


<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navActivePage();
  });
</script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID 

<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
      (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
  })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
  ga('create', 'UA-XXXXX-X', 'auto');
  ga('send', 'pageview');
</script>

--> 
<script type="text/javascript" src="./main.41beeca9.js"></script></body>

</html>