<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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

<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <!-- Add your content of header -->




<div class="">
    <div class="container">
        <div class="row">

            <div class="col-xs-12">
                <a href=""></a>
            </div>
        </div>
    </div>
</div>

<div class="section-container">
    <div class="container">
        <div class="row">
               <div class="col-xs-12 col-md-8 col-md-offset-2">
                    <div class="text-center">
                    <a href=""><h1> Blog</h1></a>
                    <div class="row section-container-spacer">
                        <div class="col-md-6">
                             <a href="<%=request.getContextPath()%>/svList.su"><img class="img-responsive" src="./assets/images/research.jpg"></a>
                        </div>
                        <div class="col-md-6">
                             <a href="${contextPath}/pList.pds"><img class="img-responsive" src="./assets/images/library.jpg"></a>
                        </div>
                    </div>
                     </div>   

                    <div class="row section-container-spacer">
                        <div class="col-md-6">
                             <a href="${contextPath}/about2_1.jsp"><img class="img-responsive" src="./assets/images/inf1.jpg"></a>
                             <div class="texet"><p>주식과 채권을 포트폴리오에 어떤 비중으로 담아야 할까?</p></div>
                        </div>
                        <div class="col-md-6">
                             <a href="${contextPath}/about2_2.jsp"><img class="img-responsive" src="./assets/images/inf2.jpg"></a>
                             <div class="texet"><p>부채의 늪에 빠진 세계 경제, 디플레이션 가능성은?</p></div>
                        </div>
                        <div class="col-md-6">
                             <a href="${contextPath}/about2_3.jsp"><img class="img-responsive" src="./assets/images/inf3.png"></a>
                             <div class="texet"><p>물가연동채권에 투자해야 하는 이유</p></div>
                        </div>
                        <div class="col-md-6">
                             <a href="${contextPath}/about2_4.jsp"><img class="img-responsive" src="./assets/images/inf4.png"></a>
                             <div class="texet"><p>자산배분 투자철학 십계명</p></div>
                        </div>
 	                    </div>

               </div>
               
                <div class="col-xs-12 col-md-8 col-md-offset-2">
              
                        <p>
                            
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