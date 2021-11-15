<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/include/nav.jsp" %>
<html lang="en">
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

<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <!-- Add your content of header -->




<div class="">
    <div class="container">
        <div class="row">
					<a href="${contextPath }/about2.jsp" style="float:center;"><h1> Blog</h1></a>
            <div class="col-xs-12">
                <a href=""><img class="img-responsive" src="./assets/images/inf1.jpg"></a>
            </div>
        </div>
    </div>
</div>

<div class="section-container">
    <div class="container">
        <div class="row">
               <div class="col-xs-12 col-md-8 col-md-offset-2">
                    <div class="text-center">
                     </div>   
                        <p class="section-container-spacer">정보
주식과 채권을 포트폴리오에 어떤 비중으로 담아야 할까?
2021.01.04
60/40 포트폴리오(주식60%, 채권40%)가 최선일까?
주가 변동성을 고려한 포트폴리오(Volatility Managed Portfolio)를 구성한다면 유의미한 성과 달성 가능
많은 투자자가 주식과 채권의 비중을 어떻게 조절할 것인가에 대해 고민합니다. 이루다투자에서는 지난 포스트 ‘최적의 리밸런싱 타이밍은 언제일까‘에서 주식과 채권 비중의 꾸준한 리밸런싱을 통해 더 나은 결과를 이끌어 낼 수 있다는 것을 확인하였습니다. 본 포스트에서는 전통 자산배분 형태인 주식 60%, 채권 40% 포트폴리오를 개선하기 위한 전략 중 하나로 주가의 변동성을 통한 포트폴리오 매니지먼트 전략 (Volatility Managed Portfolio) 방식을 탐구해 보려고 합니다.


Volatility Managed Portfolio

지난 2017년 Journal of Finance에서 발표된 “Volatility-Managed Portfolios”[1]에 따르면 최근 주가 변동성이 높으면 주식의 비중을 줄이고, 낮으면 주식의 비중을 높이는 전략은 매우 유의미한 성과 개선을 달성할 수 있습니다. 이러한 포트폴리오(Volatility Managed Portfolio)는 변동성을 낮춰주는 동시에 일정한 수익률을 보장해 높은 Sharpe Ratio(변동성 대비 평균 수익률)를 갖습니다.</p>


               </div>
               
                <div class="col-xs-12 col-md-8 col-md-offset-2">
              
                        <p>전통적인 방식의 자산 배분인 주식 60%, 채권 40% 포트폴리오와 비교해 성과를 비교해보도록 하겠습니다.

해당 전략의 유효성을 분석하기 위해 주식 상품으로는 S&P 500 지수를 채권으로는 미국 3개월물 국채를 사용했습니다. S&P 500 데이터는 Yahoo Finance, 미국 3개월물 국채 데이터는 FRED로부터 내려받아 사용하였습니다.

먼저 S&P 500의 일일 수익률을 바탕으로 월별 표준편차를 계산합니다. 이번 달 표준편차가 과거 5년 (60개월) 표준편차 대비 몇 퍼센트에 속하는지(percentile score)를 계산합니다. 이 스코어를 기준으로 미국 3개월물 국채에 투자한 후, 나머지 부분을 주식에 투자한다면, 변동성이 높은 달엔 주식의 비중을 줄이고, 낮은 달엔 주식의 비중을 높게 가져가는 포트폴리오를 구성할 수 있습니다.

예를 들어, 2020년 3월 말 S&P 500는 코로나 충격으로 인해 표준편차가 0.056 에 육박하였습니다. 이는 과거 60개월 대비 상위 99%에 해당하는 값으로 지난 5년 간 가장 높은 변동성을 지닌 달에 해당합니다. 이 경우 3개월 물 채권을 99%를 투자하고 나머지 1%를 주식에 투자하는 포트폴리오로 3월 말 리밸런싱 하는 것입니다.
                </div>
            </div>




        </div>

    </div>



</div>





<!-- Footer -->
<%@ include file="./include/footer.jsp" %>


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