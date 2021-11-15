<%@page import="javaspring.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
  String[] hobby = {"등산","낚시","수영","독서","영화감상","바둑","축구","기타"};
%>
<%@ include file="/include/navhome.jsp" %>
<%
  request.setCharacterEncoding("utf-8");

  MemberVo vo = (MemberVo) request.getAttribute("vo");
  
  if(vo.getIdx() == 0) {
	  RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/login.mem");
	  dispatcher.forward(request, response);
  }
  
  String birthday = vo.getBirthday().substring(0, 10);
  String tempTel = vo.getTel();
  String[] tel = tempTel.split("-");
  String tempEmail = vo.getEmail();
  String[] email = tempEmail.split("@");
  String tempHobby = vo.getHobby();
  String[] hobbys = tempHobby.split("/");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mUpdate.jsp(회원정보수정폼)</title>
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="./assets/favicon.ico" rel="icon">
  <link href="./main.a3f694c0.css" rel="stylesheet"></head>
  <script>
    // 닉네임 버튼을 눌렀는지를 체크하기위해 nickCheck 전역변수 활용
	  var nickCheckOn = 0;
  
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
    	// 모든 항목 스크립트 체크하기......
    	var imsiNickname = myform.nickname.value;
    	
    	if(imsiNickname != "<%=vo.getNickname()%>") {
    		if(nickCheckOn != 1) {
   			  alert("닉네임 체크버튼을 눌러주세요!");
    		}
    		else {
    			myform.submit();
    		}
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
  <style>
    
  </style>
</head>
<body>
<%@ include file="../../include/sCheck.jsp" %>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="<%=request.getContextPath()%>/mUpdateOk.mem" class="was-validated">
    <h2>회 원 정 보 수 정</h2>
    <div class="form-group">
      <label for="mid">아이디 : <%=vo.getMid() %></label>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" value="<%=vo.getPwd() %>" required/>
    </div>
    <div class="form-group">
      <label for="nickname">닉네임 : &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" class="btn btn-secondary" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickname" placeholder="별명을 입력하세요." name="nickname" value="<%=vo.getNickname() %>" required/>
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" value="<%=vo.getName() %>" required/>
    </div>
    <div class="form-group">
      <div class="form-check-inline">성별 : &nbsp; &nbsp; 
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="남자" <% if(vo.getGender().equals("남자")) { %>checked<% } %>>남자
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="여자" <% if(vo.getGender().equals("여자")) { %>checked<% } %>>여자
			  </label>
			</div>
    </div>
    <div class="form-group">
      <label for="birthday">생일 :</label>
			<input type="date" name="birthday" value="<%=birthday %>" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">전화번호 :
	        <span class="input-group-text">
			      <select name="tel1" class="custom-select">
					    <option value="010" <% if(tel[0].equals("010")) { %>selected<% } %>>010</option>
					    <option value="02"  <% if(tel[0].equals("02"))  { %>selected<% } %>>서울</option>
					    <option value="031" <% if(tel[0].equals("031")) { %>selected<% } %>>경기</option>
					    <option value="032" <% if(tel[0].equals("032")) { %>selected<% } %>>인천</option>
					    <option value="041" <% if(tel[0].equals("041")) { %>selected<% } %>>충남</option>
					    <option value="042" <% if(tel[0].equals("042")) { %>selected<% } %>>대전</option>
					    <option value="043" <% if(tel[0].equals("043")) { %>selected<% } %>>충북</option>
					  </select>
	        </span>
	      </div>
	      <input type="text" name="tel2" value="<%=tel[1]%>" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" value="<%=tel[2]%>" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="address">주소 :</label>
      <input type="text" class="form-control" id="address" placeholder="주소를 입력하세요." name="address" value="<%=vo.getAddress()%>"/>
    </div>
    <div class="form-group">
      <label for="email">Email address:</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Email" id="email1" name="email1" value="<%=email[0]%>"/>
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" <% if(email[1].equals("naver.com")) { %>selected<% } %>>naver.com</option>
					    <option value="hanmail.net" <% if(email[1].equals("hanmail.net")) { %>selected<% } %>>hanmail.net</option>
					    <option value="hatmail.com" <% if(email[1].equals("hatmail.com")) { %>selected<% } %>>hatmail.com</option>
					    <option value="gmail.com" <% if(email[1].equals("gmail.com")) { %>selected<% } %>>gmail.com</option>
					    <option value="nate.com" <% if(email[1].equals("nate.com")) { %>selected<% } %>>nate.com</option>
					    <option value="yahoo.com" <% if(email[1].equals("yahoo.com")) { %>selected<% } %>>yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
	    <label for="homepage">Homepage address:</label>
	    <input type="text" class="form-control" name="homepage" value="<%=vo.getHomepage()%>" placeholder="이메일을 입력하세요." id="homepage"/>
	  </div>
    <div class="form-group">
      <label for="name">직업 :</label>
      <select class="form-control" id="job" name="job">
        <option value="학생"  <% if(vo.getJob().equals("학생")) { %>selected<% } %>>학생</option>
        <option value="회사원" <% if(vo.getJob().equals("회사원")) { %>selected<% } %>>회사원</option>
        <option value="공무원" <% if(vo.getJob().equals("공무원")) { %>selected<% } %>>공무원</option>
        <option value="군인"  <% if(vo.getJob().equals("군인")) { %>selected<% } %>>군인</option>
        <option value="의사"  <% if(vo.getJob().equals("의사")) { %>selected<% } %>>의사</option>
        <option value="법조인" <% if(vo.getJob().equals("법조인")) { %>selected<% } %>>법조인</option>
        <option value="세무인" <% if(vo.getJob().equals("세무인")) { %>selected<% } %>>세무인</option>
        <option value="자영업" <% if(vo.getJob().equals("자영업")) { %>selected<% } %>>자영업</option>
        <option value="기타"  <% if(vo.getJob().equals("기타")) { %>selected<% } %>>기타</option>
      </select>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
			  <label class="form-check-label">취미 :
      <%
        for(int i=0; i<hobby.length; i++) {
          int sw = 0;
          for(int j=0; j<hobbys.length; j++) {
            if(hobby[i].equals(hobbys[j])) {
              sw = 1;
              break;
            }
          }
      %>
			    <input type="checkbox" class="form-check-input" name="hobby" value="<%=hobby[i]%>" <% if(sw==1) { %>checked<% } %>/><%=hobby[i]%> &nbsp;
<%      } %>
			  </label>
			</div>
    <div class="form-group">
      <div class="form-check-inline">정보공개 :  &nbsp; &nbsp; 
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userinfor" value="공개" <% if(vo.getUserinfor().equals("공개")) { %>checked<% } %>/>공개
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userinfor" value="비공개" <% if(vo.getUserinfor().equals("비공개")) { %>checked<% } %>/>비공개
			  </label>
			</div>
    </div>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">정보수정</button>
    <button type="reset" class="btn btn-secondary">다시작성</button>
    <button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/components.jsp';">돌아가기</button>
    <input type="hidden" name="onickname" value="<%=vo.getNickname()%>"/>
    <input type="hidden" name="mid" value="<%=vo.getMid()%>"/>
  </form>
</div>
<p><br/></p>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>