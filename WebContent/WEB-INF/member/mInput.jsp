<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int level = session.getAttribute("slevel")==null ? 99 : (int) session.getAttribute("slevel");
%>
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String nToday = sdf.format(today);
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


  <title>awmInput.jsp(회원가입)</title>  
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
<script>
    // 아이디와 닉네임 버튼을 눌렀는지를 체크하기위해 idCheck, nickCheck 전역변수 활용
	  var idCheckOn = 0;
	  var nickCheckOn = 0;
  
    // 아이디 중복처리
	  function idCheck() {
		  var mid = myform.mid.value;
		  var url = "<%=request.getContextPath()%>/idCheck.mem?mid="+mid;
		  
		  if(mid=="") {
			  alert("아이디를 입력하세요!");
			  myform.mid.focus();
		  }
		  else {
			  window.open(url,"nwin","width=400px,height=200px");
			  idCheckOn = 1;
		  }
	  }
    
    // 닉네임 중복처리
	  function nickCheck() {
		  var nickname = myform.nickname.value;
		  var url = "<%=request.getContextPath()%>/nickCheck.mem?nickname="+nickname;
		  
		  if(nickname=="") {
			  alert("닉네임을 입력하세요!");
			  myform.nickname.focus();
		  }
		  else {
			  window.open(url,"nwin","width=400px,height=200px");
			  nickCheckOn = 1;
		  }
	  }
    
    // 최종 폼 체크
    function fCheck() {
    	var mid = myform.mid.value;
    	
    	if(mid == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	// 모든 항목 스크립트 체크하기......
    	else {
    		if(idCheckOn == 1 && nickCheckOn == 1) {
	    		myform.submit();
    		}
    		else {
    			if(idCheckOn != 1) {
    				alert("아이디 체크버튼을 눌러주세요!");
    			}
    			else {
    				alert("닉네임 체크버튼을 눌러주세요!");
    			}
    		}
    	}
    }
  </script>
	<style>
    table {
      width : 400px;
      margin : 0px auto;
    }
    table, th,td {
      border: 1px solid #aaa;
      padding : 15px;
    }
    th {
      text-align: center;
    }
  </style>
</head>
<body>

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
          <img src="${contextPath }/assets/images/mashuptemplate.svg" class="navbar-logo-img" alt="">All weather investment
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="./index.jsp" title="" class="active">Home</a></li>
          <li><a href="./about.jsp" title=""> Blog</a></li>
          <li><a href="./pricing.jsp" title=""> All weather Fund </a></li>
          <li><a href="./contact.jsp" title="">Contact</a></li>
          <%    if(level == 99) { %> 
		      <li>
		        <a href="<%=request.getContextPath()%>/login.mem" >Login</a>
		      </li>
		<%    } else { %>
          <li><a href="./components.html" title="">Notice</a></li>
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



<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./assets/images/background.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="container">
								  <form name="myform" method="post" action="<%=request.getContextPath()%>/mInputOk.mem" class="was-validated">
								    <h2>회 원 가 입</h2>
								    <div class="form-group">
								      <input type="text" class="form-control" id="mid" placeholder="아이디를 입력하세요." name="mid" required autofocus/><br/>
								      <label for="mid"><input type="button" value="아이디 중복체크" class="btn btn-secondary" onclick="idCheck()"/></label>
								    </div>
								    <div class="form-group">
								      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required/>
								    </div>
								    <div class="form-group">
								      <input type="text" class="form-control" id="nickname" placeholder="별명을 입력하세요." name="nickname" required/><br/>
								      <label for="nickname"><input type="button" value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/></label>
								    </div>
								    <div class="form-group">
								      <label for="name"></label>
								      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required/>
								    </div>
								    <div class="form-group">
								      <div class="form-check-inline"><a style="color:white;">성별 :</a> &nbsp; &nbsp; 
											  <label class="form-check-label">
											    <input type="radio" class="form-check-input" name="gender" value="남자" checked><a style="color:white;">남자</a>
											  </label>
											  <label class="form-check-label">
											    <input type="radio" class="form-check-input" name="gender" value="여자"><a style="color:white;">여자</a>
											  </label>
											</div>
								    </div>
								    <div class="form-group">
								      <label for="birthday"><a style="color:white;">생일 :</a></label>
											<input type="date" name="birthday" value="<%=nToday %>" class="form-control"/>
								    </div>
								    <div class="form-group">
								      <div class="input-group mb-3">
									      <div class="input-group-prepend"><a style="color:white;">전화번호 :</a>
									        <span class="input-group-text">
									          <!--
											      <select name="tel1">
											        <option value="010">010</option>
											        <option value="02">서울</option>
											        <option value="031">경기</option>
											        <option value="032">인천</option>
											        <option value="041">충남</option>
											        <option value="042">대전</option>
											        <option value="043">충북</option>
											        <option value="051">부산</option>
											        <option value="052">울산</option>
											        <option value="061">전북</option>
											        <option value="062">광주</option>
											      </select>-
											      -->
											      <select name="tel1" class="custom-select">
													    <option value="010" selected>010</option>
													    <option value="02">서울</option>
													    <option value="031">경기</option>
													    <option value="032">인천</option>
													    <option value="041">충남</option>
													    <option value="042">대전</option>
													    <option value="043">충북</option>
													  </select>
									        </span>
									      </div>
									      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/><a style="color:white;">-</a>
									      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
									    </div> 
								    </div>
								    <div class="form-group">
								      <label for="address"></label>
								      <input type="text" class="form-control" id="address" placeholder="주소를 입력하세요." name="address"/>
								    </div>
								    <div class="form-group">
								      <label for="email"></label>
												<div class="input-group mb-3">
												  <input type="text" class="form-control" placeholder="Email" id="email1" name="email1">
												    <select name="email2" class="custom-select">
													    <option value="naver.com" selected>naver.com</option>
													    <option value="hanmail.net">hanmail.net</option>
													    <option value="hatmail.com">hatmail.com</option>
													    <option value="gmail.com">gmail.com</option>
													    <option value="nate.com">nate.com</option>
													    <option value="yahoo.com">yahoo.com</option>
													  </select>
												</div>
									  </div>
								    <div class="form-group">
									    <label for="homepage"><a style="color:white;">Homepage address:</a></label>
									    <input type="text" class="form-control" name="homepage" value="http://" placeholder="이메일을 입력하세요." id="homepage"/>
									  </div>
								    <div class="form-group">
								      <label for="name"><a style="color:white;">직업 :</a></label>
								      <select class="form-control" id="job" name="job">
								        <option>학생</option>
								        <option>회사원</option>
								        <option>공무원</option>
								        <option>군인</option>
								        <option>의사</option>
								        <option>법조인</option>
								        <option>세무인</option>
								        <option>자영업</option>
								        <option>기타</option>
								      </select>
								    </div>
								    <div class="form-group">
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="낚시" name="hobby"/><a style="color:white;">낚시</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="수영" name="hobby"/><a style="color:white;">수영</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="독서" name="hobby"/><a style="color:white;">독서</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="영화감상" name="hobby"/><a style="color:white;">영화감상</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="바둑" name="hobby"/><a style="color:white;">바둑</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="축구" name="hobby"/><a style="color:white;">축구</a>
											  </label>
											</div>
											<div class="form-check-inline">
											  <label class="form-check-label">
											    <input type="checkbox" class="form-check-input" value="기타" name="hobby" checked/><a style="color:white;">기타</a>
											  </label>
											</div>
								    </div>
								    <div class="form-group">
								      <div class="form-check-inline"><a style="color:white;">정보공개 :</a>  
											  <label class="form-check-label">
											    <input type="radio" class="form-check-input" name="userinfor" value="공개" checked/><a style="color:white;">공개</a>
											  </label>
											  <label class="form-check-label">
											    <input type="radio" class="form-check-input" name="userinfor" value="비공개"/><a style="color:white;">비공개</a>
											  </label>
											</div>
								    </div>
								    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button>
								    <button type="reset" class="btn btn-secondary">다시작성</button>
								    <button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/login.mem';">돌아가기</button>
								  </form>
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