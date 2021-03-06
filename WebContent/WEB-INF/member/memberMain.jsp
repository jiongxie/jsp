<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String nickname = (String) session.getAttribute("snickname");
  int mlevel = (int) session.getAttribute("slevel");
  String strLevel = "";
  if(mlevel == 1) strLevel = "준회원";
  else if(mlevel == 2) strLevel = "정회원";
  else if(mlevel == 3) strLevel = "우수회원";
  else if(mlevel == 0) strLevel = "관리자";
%>
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

 

  <title>All weather investment</title>  

<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <%@ include file="/include/nav.jsp" %>


<div class="white-text-container background-image-container" style="background-image: url('./assets/images/allweather1.PNG')">
    <div class="opacity"></div>
    <div class="container">
        <div class="row">
           
            <div class="col-md-6">
                <h1><a href="">All weather investment</a></h1>
                <p>자산배분의 마법,검증된 All weather investment에 투자하세요</p>
<h5 style="color:whitek;"><font color="red"><%=nickname %></font>회원님(<%=strLevel%>)</h2>
            </div>

        </div>
    </div>
</div>

<div class="section-container border-section-container">
    <div class="container">
            <div class="row">
                <div class="col-md-12 section-container-spacer">
                    <div class="text-center">
                        <h2>사계절 포트폴리오란?</h2>
                        <p style="text-align:left;">올웨더포트폴리오(All Weather Portfolio)란 경기호황, 경기침체, 인플레이션, 디플레이션 등 다양한 경제상황중 어떤곳에 놓여있어도 일정수준의 수익률이 보장되는 포트폴리오를 말한다.</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="fa-container">
                        <i class="fa fa-comment-o fa-3x" aria-hidden="true"></i>
                    </div>
                    <div class="text-center">
                        <h3>고객상담</h3>
                    </div>
                    <div>
                        <p>고객 상담시간은 매주 월요일에서 금요일까지 오전 11시~오후 5시로 운영됩니다.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fa-container">
                        <i class="fa fa-heart-o fa-3x" aria-hidden="true"></i>
                    </div>
                    <div class="text-center">
                        <h3>고객지원</h3>
                    </div>
                    <div>
                        <p style="text-align:left;">초기 가입자 수수료우대 : [투자원금 평균 - 500만원(공제)] × 수수료율(0.3%) × (운용일수/365).
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fa-container">
                        <i class="fa fa-bell-o fa-3x" aria-hidden="true"></i>
                    </div>
                    <div class="text-center">
                        <h3>운용보수</h3>
                    </div>
                    <div>
                        <p style="text-align:left;">투자원금에 대해 기본수수료율을 적용하여 청구합니다.
												청구시기 : 6월 말, 12월 말 종료 후 영업일 기준 10일 이내, 투자중지일 또는 계약해지일
                        </p>
                    </div>
                </div>

            </div>
    </div>
</div>

<!-- Automatic Slideshow Images -->
<div class="section-container">
    <div class="container">
            <div class="row">
                <div class="col-xs-12">


                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img class="img-responsive" src="./assets/images/new1.PNG" alt="First slide">
                            </div>
                            <div class="item">
                                <img class="img-responsive" src="./assets/images/new2.PNG" alt="Second slide">
                            </div>
                            <div class="item">
                                <img class="img-responsive" src="./assets/images/new3.PNG" alt="Second slide">
                            </div>
                        </div>
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                    </div>


                </div>
            </div>
    </div>
</div>

<div class="section-container" id="contact-section-container3">
	<div class="section-container">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12 col-md-12 section-container-spacer">
	                <h2 class="text-center">관련 사이트</h2>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-xs-12 col-md-4">
	                <a href="./pricing.jsp"><img src="./assets/images/image-02.jpg" alt="" class="img-responsive"></a>
	                <h3 class="text-center">All weather investment</h3>
	                <p>시장수익률만을 추구, 자산배분의 마법, 검증된 All weather investment에 투자하세요</p>
	            </div>
	
	            <div class="col-xs-12 col-md-4">
	                <a href="./"><img src="./assets/images/image-03.jpg" alt="" class="img-responsive"></a>
	                <h3 class="text-center">Pure alpha community </h3>
	                <p>종목추천방, 시장수익률이상의 알파를 추구하는 투자자들을 위한 커뮤니티 공간, Robostock.com우수회원이상 사용가능</p>
	            </div>
	            <div class="col-xs-12 col-md-4">
	                <a href="./"><img src="./assets/images/image-04.jpg" alt="" class="img-responsive"></a>
	                <h3 class="text-center">Robostock.com</h3>
	                <p>AI자동매매(시스템 트레이딩) 사이트, 바로가기</p>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<div class="section-container background-color-container white-text-container">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="text-center">
                    <h2>Q&A</h2>
                    <p style="text-align:left;"> 1. 사계절 펀드,리밸런싱 어떻게 하나요<br/>
                    	1년에 한번하기도 하고 필요에 따라, 특정한 자산군의 가치가 많이 올라 전체비율에서 5%이상 더 증가하였을때도 해당됩니다. 
                     </p>
                    <p style="text-align:left;"> 2. 사계절 펀드이외에 상품은 어떻게 운용되나요?<br/>
                    	All weather investment의 주상품은 사계절 펀드입니다. 다른 추가적이 서비스를 원하시면 제휴 사이트를 이용하시길 바랍니다.
                     </p>
                </div>
            </div>
        </div>
     </div>
 </div>

 <div class="section-container">
    <div class="container">
        <div class="row">                   
            <div class="col-md-7">
                <img class="img-responsive" src="./assets/images/os.jpg" alt="">
            </div>

            <div class="col-md-5">
                <ul class="features">
                    <li>
                        <h3>안드로이드앱 출시/ios 출시예정 </h3>
                        <p>
                        </p>
                    </li>
                    <li>
                        <h3>모바일/태블릿 브라우저 화면크기 맞춤지원</h3>
                        <p>
                        </p>
                    </li>
                </ul>
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