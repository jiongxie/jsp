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
<html lang="en">
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="style.css">
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
    function home(){
    	
    }
  </script>
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <a href ="./index.jsp"><button type="button" class="togglebtn" onclick="">HOME</button></a>
                </div>
                <div class="social-icons">
                    <img src="img/fb.png" alt="facebook">
                    <img src="img/tw.png" alt="twitter">
                    <img src="img/gl.png" alt="google">
                </div>
                <form name="myform" method="post" id="login" action="<%=request.getContextPath()%>/loginOk.mem" class="input-group">
                    <input type="text" name="mid" id="mid" autofocus class="input-field" placeholder="User name or Email" required>
                    <input type="password" name="pwd" id="pwd" class="input-field" placeholder="Enter Password" required>
                    <button class="submit">Login</button>&nbsp
                    <button class="submit" ><a href="<%=request.getContextPath()%>/mInput.mem">Register</a></button>
                </form>
                <form name="myform" method="post" id="register" action="<%=request.getContextPath()%>/mInput.mem" class="input-group">
                    <!-- <input type="text" id="mid" name="mid" class="input-field" placeholder="아이디를 입력하세요" required>
                    <label for="mid"><input type="button" value="아이디 중복체크" class="btn btn-secondary" onclick="idCheck()"/></label>
                    <input type="text" id="nickname" name="nickname" class="input-field" placeholder="닉네임을 입력하세요" required>
                    <label for="nickname"><input type="button"  value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/></label> -->
                    <button class="submit" >REGISTER</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html>