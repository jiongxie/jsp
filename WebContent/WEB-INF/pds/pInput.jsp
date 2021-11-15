<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/include/navhome.jsp" %>
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
  
  <title>pInput.jsp</title>
 <link href="./main.a3f694c0.css" rel="stylesheet"></head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
	  function fCheck() {
	  	var fname = myform.fname1.value;
	  	var ext = fname.substring(fname.lastIndexOf(".")+1);  // 화일의 확장자만 구하기
	  	var uExt = ext.toUpperCase();  // 확장자를 대문자로 치환
	  	var maxSize = 1024 * 1024 * 10;   // 최대 10MByte 까지 허용
	  	
	  	var title = myform.title.value;
	  	var pwd = myform.pwd.value;
	  	
	  	if(fname == "") {
	  		alert("업로드할 파일을 선택하세요!");
	  		return false;
	  	}
	  	else if(title == "") {
	  		alert("업로드할 파일의 제목을 입력하세요!");
	  		myform.title.focus();
	  		return false;
	  	}
	  	else if(pwd == "") {
		  	alert("업로드할 파일을 선택하세요!");
		  	myform.pwd.focus();
				return false;
	  	}
	  	
	  	var fileSize = document.getElementById("fname1").files[0].size;  // 업로드할 파일의 사이즈를 구한다.
	  	myform.fsize.value = fileSize;
	  	
	  	if(uExt != "ZIP" && uExt != "GIF" && uExt != "JPG" && uExt != "PNG" && uExt != "HWP" && uExt != "PPT" && uExt != "PDF"&& uExt != "APK") {
	  		alert("업로드 가능파일은 'zip/gif/jpg/png/hwp/pdf/apk'파일만 가능합니다.");
	  		return false;
	  	}
/* 	  	else if(fname.indexOf(" ") != -1) {
	  		alert("파일명 안에는 공백을 포함할 수 없습니다.");
	  		return false;
	  	} */
	  	else if(fileSize > maxSize) {
	  		alert("업로들할 파일의 최대용량은 10MByte이내입니다.");
	  		return false;
	  	}
	  	else {
					myform.submit();
	  	}
	  }
  
	  // 동적폼 파일박스 추가
	  var cnt = 1;
	  function fileAdd() {
		  cnt++;
		  var fileIn = "";
		  fileIn += "<div id='dBox"+cnt+"'>";
		  fileIn += "<input type='file' name='fname"+cnt+"' id='fname"+cnt+"' class='form-control-file border' style='width:90%;float:left;' accept='.zip,.jpg,.gif,.png,.hwp,.ppt,.pptx,.pdf,.apk'/>";
		  fileIn += "<button type='button' onclick='javascript:deleteBox("+cnt+")' id='delBox'"+cnt+"' class='btn btn-secondary' style='width:10%'>삭제</botton>";
		  fileIn += "</div>";
		  $("#fileInsert").append(fileIn);
	  }
  
	  // 동적 파일박스의 삭제버튼을 클릭하면~
	   function deleteBox(cnt) {
		   $("#dBox"+cnt).remove();
	   }
  </script>
  
 
</head>
<body>

<%-- <div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li ><a href="<%=request.getContextPath()%>/svList.su">Research</a></li>
			<li class="selected"><a href="${contextPath}/pList.pds"">Share</a></li>
			<li><a href="./about2.jsp">Blog</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div> --%>


<br/>
<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./allweather/assets/images/img-13.jpg')">
			<div class="container">
			  <h5 style="color:black">데이터 올리기</h2>
			  <form name="myform" method="post" action="${contextPath}/pInputOk.pds" enctype="multipart/form-data">
			    <div class="form-group">
			      <input type="button" value="파일추가" onclick="fileAdd()"/>
			      <input type="file" name="fname1" id="fname1" class="form-control-file border" accept=".zip,.jpg,.gif,.png,.hwp,.ppt,.pptx,.pdf,.apk"/>
			    </div>
			    <div class="form-group" id="fileInsert"></div>
			    <div class="form-group">올린이 : ${snickname}</div>
			    <div class="form-group">
			      <label for="title">자료제목 : </label>
			      <input type="text" name="title" id="title" placeholder="자료 제목을 입력하세요." class="form-control" required/>
			    </div>
			    <div class="form-group">
			      <label for="content">자료내용 : </label>
			      <textarea rows="4" name="content" id="content" class="form-control" required></textarea>
			    </div>
			    <div class="form-group">
			      <label for="part">자료분류 : </label>
			      <select name="part" size="1" class="form-control">
			        <option value="논문" selected>논문</option>
			        <option value="뉴스">뉴스</option>
			        <option value="통계">통계</option>
			        <option value="기타">기타</option>
			      </select>
			    </div>
			    <div class="form-group">
			      <div class="form-check-inline">공개여부 : &nbsp; &nbsp;
				      <label class="form-check-label">
				        <input type="radio" name="opensw" class="form-check-input" value="공개" checked/>공개 &nbsp; &nbsp;
				      </label>
				      <label class="form-check-label">
				        <input type="radio" name="opensw" class="form-check-input" value="비공개"/>비공개 &nbsp; &nbsp;
				      </label>
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="pwd">비밀번호 : </label>
			      <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." class="form-control" required/>
			    </div>
			    <div class="form-group">
			      <button type="button" onclick="fCheck()" class="btn btn-secondary">자료올리기</button>
			      <button type="reset" class="btn btn-secondary">다시쓰기</button>
			      <button type="button" onclick="location.href='${contextPath}/pList.pds';" class="btn btn-secondary">돌아가기</button>
			    </div>
			    <input type="hidden" name="pag" value="${pag}"/>
			    <input type="hidden" name="mid" value="${smid}"/>
			    <input type="hidden" name="nickname" value="${snickname}"/>
			    <input type="hidden" name="fsize"/>
			  </form>
			</div>
</div>		
</body>

<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</div>
</body>
</html>