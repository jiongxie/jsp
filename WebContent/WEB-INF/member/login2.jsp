<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int level = session.getAttribute("slevel")==null ? 99 : (int) session.getAttribute("slevel");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="style.css">
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
          <img src="./assets/images/" class="navbar-logo-img" alt="">all weather investment
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="./index.jsp" title="" class="active">Home</a></li>
          <li><a href="./about.html" title=""> Blog</a></li>
          <li><a href="./pricing.html" title=""> All weather Fund </a></li>
          <li><a href="./contact.html" title="">Contact</a></li>
          <li><a href="./components.html" title="">Guest</a></li>
          <%    if(level == 99) { %> 
		      <li>
		        <a href="<%=request.getContextPath()%>/login.mem" >Login</a>
		      </li>
		<%    } else { %>
		      <li >
		        <a href="<%=request.getContextPath()%>/loginOut.mem" >Logout</a>
		      </li>
		<%    } %>
          <li>
            <p>
              <a href="./download.html" class="btn btn-primary navbar-btn" title="">Download</a>
            </p>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>

    <div class="wrap">
            <div class="form-wrap">
                <div class="social-icons">
                    <img src="../images/fb.png" alt="facebook">
                    <img src="../images/tw.png" alt="twitter">
                    <img src="../images/gl.png" alt="google">
                </div>
								  <form name="myform" method="post" action="<%=request.getContextPath()%>/loginOk.mem">
								    <table>
								      <tr>
								        <th>아이디</th>
								        <td><input type="text" name="mid" id="mid" autofocus/></td>
								      </tr>
								      <tr>
								        <th>비밀번호</th>
								        <td><input type="password" name="pwd" id="pwd"/></td>
								      </tr>
								      <tr>
								        <td colspan="2" style="text-align:center">
								          <input type="submit" value="로그인"/> &nbsp; &nbsp;
								          <input type="reset" value="취소"/> &nbsp; &nbsp;
								          <input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/mInput.mem';"/>
								        </td>
								      </tr>
								    </table>
								  </form>
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
                        <p><small>designed by Brain.Â© Untitled | Website created with <a href="http://www.mashup-template.com/" class="link-like-text" title="Create website with free html template">Mashup Template</a>/<a href="http://www.unsplash.com/" class="link-like-text" title="Beautiful Free Images">Unsplash</a></small></p>    
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

<script type="text/javascript" src="./main.41beeca9.js"></script></body>

</html>