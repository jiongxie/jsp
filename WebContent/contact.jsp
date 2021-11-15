<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%
  int level = session.getAttribute("slevel")==null ? 99 : (int) session.getAttribute("slevel");
%>
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
  <script>
  	message() {
  		var ans = confirm("확인");
  		if(ans) {
  		location.href="<%=request.getContextPath()%>/webMessage.wm";
  		}
  	}
  </script>

<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<body>

 <!-- Add your content of header -->
<header>
  <nav class="navbar  navbar-fixed-top navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle uarr collapsed" data-toggle="collapse" data-target="#navbar-collapse-uarr">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./index.jsp" title="">
          <img src="./assets/images/" class="navbar-logo-img" alt="">All weather investment
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="./about.jsp" title="">  About</a></li>
          <li><a href="./pricing.jsp" title=""> All weather Fund  </a></li>
          <li><a href="./contact.jsp" title="">Contact</a></li>
                    <%    if(level == 99) { %> 
		      <li>
		        <a href="<%=request.getContextPath()%>/login.mem" >Login</a>
		      </li>
		<%    } else { %>
		 			<li><a href="./components.jsp" title="">Notice</a></li>
					<li><a href="./components.jsp" title="">MyPage</a></li>
		      <li >
		        <a href="<%=request.getContextPath()%>/loginOut.mem" >Logout</a>
		      </li>
		<%    } %>
          <li>
            <p>
              <a href="./download.jsp" class="btn btn-primary navbar-btn" title="">Download</a>
            </p>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
</header>



<div class="section-container no-padding">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div id="map"></div>
            </div>
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-md-6">
                        <form action="" class="reveal-content contact-form">
                            <div class="form-group">
                                <input type="name" class="form-control" id="name" placeholder="Full name">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" id="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="subject" placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" rows="3" placeholder="Enter your message"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg">Send</button>
                        </form>
                    </div>


                    <div class="col-md-5 col-md-offset-1">
                            
                        <h3>Head Office</h3>
                        
                        <div>
                            <p>47, Seohyeonjung-ro 31beon-gil, Heungdeok-gu, <br/>Cheongju-si, Chungcheongbuk-do, Republic of Korea</p>
                        </div>
                        <div>
                            <p>byeonhs0018@naver.com<br>+82 010 5686 5693</p>
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </div>
</div>


<footer>
    <div class="section-container footer-container">
        <div class="container">
            <div class="row">
                    <div class="col-md-4">
                        <h4>About us</h4>
                        <p>All weather investment주식회사는'자본시장과 금융투자에 관한 법률'에서 규정하는 투자일임업/투자자문업 라이센스 보유기업으로, 전문인력, 자본금, 이해상충방지 요건 등을 갖추고 금융위 및 금감원 관리감독 받는 제도권 금융회사입니다.</p>
                    </div>

                    <div class="col-md-4">
                        <h4>Do you like ? Share this !</h4>
                        <p>
                            <a href="https://facebook.com/" class="social-round-icon white-round-icon fa-icon" title="">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                          </a>
                          <a href="https://twitter.com/" class="social-round-icon white-round-icon fa-icon" title="">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                          </a>
                          <a href="https://www.linkedin.com/" class="social-round-icon white-round-icon fa-icon" title="">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                          </a>
                        </p>
                        <p><small>designed by Brain.ÃÂ© Untitled | Website created with <a href="http://www.mashup-template.com/" class="link-like-text" title="Create website with free html template">Mashup Template</a>/<a href="http://www.unsplash.com/" class="link-like-text" title="Beautiful Free Images">Unsplash</a></small></p>    
                    </div>

                    <div class="col-md-4">
                        <h4>Subscribe to newsletter</h4>
                        
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control footer-input-text">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-newsletter ">OK</button>
                                </div>
                            </div>
                        </div>


                    </div>
            </div>
        </div>
    </div>
</footer>

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
<!-- Google maps  -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzA22auDNIFSRiTPytfZVhtuFG_KHBhFQ&callback=googleMapInit"></script>
<!-- end Google Maps -->



<script type="text/javascript" src="./main.41beeca9.js"></script></body>

</html>