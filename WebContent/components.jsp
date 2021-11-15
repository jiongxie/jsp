<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script>
    function memberDeleteCheck() {
    	var ans = confirm("탈퇴하시겠습니까?????");
    	if(ans) {
    		var ans2 = confirm("탈퇴후 1개월동안은 같은 아이디로 가입하실 수 없습니다.\n탈퇴를 계속 진행하시겠습니까?");
    		if(ans2) {
    			location.href="<%=request.getContextPath()%>/mDelete.mem";
    		}
    	}
    }
  </script>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <!-- Add your content of header -->



<!-- Add your site or app content here -->
<div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-6">

        <div class="template-example">
          <h2 class="template-title-example">MyPage</h2>
          <p>정말로 좋은 투자 상품이라면, 판매자부터 투자하는 게 당연하지 않을까요? 이 당연한 생각이, 지금까지의 금융에서는 당연하지 않았습니다. 그들은 우리와 함께 투자하지 않았습니다.

All weather investment는 다릅니다. 우리는 고객과 함께, 똑같은 방법으로, 똑같은 수수료를 내며 투자합니다. 대표가, 직원들이 믿는 최선의 투자법을 실제로 구현한 이 서비스를, 우리가 쓰지 않을 이유가 없습니다. 우리는 앞으로도 당신과 함께 하겠습니다
					<br/>
					투자의 세계에는 다양한 유행어들이 있습니다. 하지만 대개는 그럴싸한 포장지일 뿐입니다. 심지어 그 포장지에는 높은 수수료가 묻어 있습니다.

우리는 지속적이고 준수한 수익률을, 현저히 낮은 비용으로 제공하는 투자 업체만이 장기적으로 성공하리라 확신합니다. 유행을 따라다니지 않고, 백년을 이어갈 투자 전략을 유지하겠습니다. 눈 앞의 수수료를 탐내지 않고, 당신이 끝까지 투자할 수 있도록 돕겠습니다.

          <blockquote>
          </blockquote>
          
          </p>
        </div>


        

        
      </div>


        <div class="template-example">
          <h2 class="template-title-example">Menu</h2>
          <div class="row">
            <div class="col-md-6">
              <h3 class="template-title-example">${smid }님</h2>
              <div class="row">
                  <div class="col-md-6">
                  <p><a href="<%=request.getContextPath()%>/mUpdate.mem" class="btn btn-primary btn-lg">회원정보변경</a></p>
                  <p><a href="<%=request.getContextPath()%>/chatting/chat.jsp" class="btn btn-primary btn-lg" >그룹채팅</button></a></p>
                  <p><a href="<%=request.getContextPath()%>/webMessage.ct" class="btn btn-primary btn-lg" >상담메일</button></a></p>
                  <p><a href="<%=request.getContextPath()%>/schedule.cd" class="btn btn-primary btn-lg" >캘린더</button></a></p>
                 <%-- 
                  <p><a href="<%=request.getContextPath()%>/moneyList.don" class="btn btn-primary btn-lg">가계부</a></p>
                  --%> 
             <% if(level != 0)  {%>     
                  <p><a href="javascript:memberDeleteCheck()" class="btn btn-primary btn-lg">회원탈퇴</a></p>
                  <p><a href="<%=request.getContextPath()%>/pricing2.mem" class="btn btn-primary btn-lg">자산관리</a></p>
                  <p><a href="<%=request.getContextPath()%>/schedule.sc" class="btn btn-primary btn-lg">이달의 일정</a></p>
                  <p><a href="<%=request.getContextPath()%>/chatting/chat.jsp" class="btn btn-primary btn-lg" >그룹채팅</button></a></p>
             <%  } %>     
                </div>
              </div>


            </div>
<%					if(level == 0) { %>
            <div class="col-md-6">
              <h3 class="template-title-example"></h2>
              <div class="row">
                  <div class="col-md-6">
                  <p><a href="<%=request.getContextPath()%>/amList.ad" class="btn btn-info btn-lg">회원관리(펀드운용)</a></p>
                  <p><a href="<%=request.getContextPath()%>/webMessage.wm" class="btn btn-info btn-lg">결제수락</a></p>
                  <p><a href="<%=request.getContextPath()%>/schedule.sc" class="btn btn-info btn-lg">일정공지</a></p>
                </div>
              </div>
            </div>
            <% } %>
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