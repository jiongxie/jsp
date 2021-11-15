<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/include/sCheck.jsp" %>
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
  <title>pUpdate.jsp</title>  

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
	  	
	  	if("${vo.fname}" == null && fname == "") {
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
	  	
	  	if(fname != "") {
		  	var fileSize = document.getElementById("fname1").files[0].size;  // 업로드할 파일의 사이즈를 구한다.
		  	myform.fsize.value = fileSize;
	  	}
	  	
	  	if(fname != "" && uExt != "ZIP" && uExt != "GIF" && uExt != "JPG" && uExt != "PNG" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
	  		alert("업로드 가능파일은 'zip/gif/jpg/png/hwp'파일만 가능합니다.");
	  		return false;
	  	}
	  	else if(fname.indexOf(" ") != -1) {
	  		alert("파일명 안에는 공백을 포함할 수 없습니다.");
	  		return false;
	  	}
	  	else if(fname != "" && fileSize > maxSize) {
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
		  fileIn += "<input type='file' name='fname"+cnt+"' id='fname"+cnt+"' class='form-control-file border' style='width:90%;float:left;' accept='.zip,.jpg,.gif,.png,.hwp,.ppt,.pptx'/>";
		  fileIn += "<button type='button' onclick='javascript:deleteBox("+cnt+")' id='delBox'"+cnt+"' class='btn btn-secondary' style='width:10%'>삭제</botton>";
		  fileIn += "</div>";
		  $("#fileInsert").append(fileIn);
	  }
  
	  // 동적 파일박스의 삭제버튼을 클릭하면~
	   function deleteBox(cnt) {
		   $("#dBox"+cnt).remove();
	   }
	  
	  // 선택된 첨부파일의 삭제(기존에 업로드된 파일)
	  function pdsFileDelCheck(fname,rfname) {
		  var ans = confirm("현재 자료 첨부파일("+fname+")을 삭제하시겠습니까?")
		  if(!ans) {
			  return false;
		  }
		  
		  var query = {
				  idx    : ${vo.idx},
				  fnames : "${vo.fname}",
				  rfnames: "${vo.rfname}",
				  fname  : fname,
				  rfname : rfname
		  };
		  
		  $.ajax({
			  url : "${contextPath}/pUpdFileDel",
			  type: "get",
			  data: query,
			  success:function(data) {
				  if(data != null) {
					  alert("삭제 성공!!!");
					  location.reload();
				  }
				  else {
					  alert("한개 이상의 파일을 업로드 하셔야 합니다.");
				  }
			  }
		  });
	  }
	  
	  // 돌아가기버튼 클릭시 첨부파일이 없을시 경고메세지를 출력하고 현재 파일을 삭제처리한다.
	  function backCheck() {
		  if("${vo.fname}" == "") {
			  var ans = confirm("기존 첨부파일이 모두 삭제 되었습니다.\n새 자료로 업로드하지않고 돌아가시면 현재 자료파일은 삭제처리됩니다.\n\n삭제작업을 계속하시겠습니까?");
			  if(ans) {
				  location.href="${contextPath}/pBackCheck.pds?idx=${vo.idx}&pag=${pag}";
			  }
		  }
	  }
	  function delCheck() {
			  var ans = confirm("자료를 삭제하시겠습니까?");
			  if(ans) {
				  location.href="${contextPath}/pBackCheck.pds?idx=${vo.idx}&pag=${pag}";
			  }
	  }
  </script>
	</script>
	  <style>
  
  </style>
</head>
<body>
<%@ include file="/include/navhome.jsp" %>


<!-- Add your site or app content here -->

    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <br/>
									<div class="container">
									  <h5 style="color:blue">자 료 수 정 하 기</h2>
									  <form name="myform" method="post" action="${contextPath}/pUpdateOk.pds" enctype="multipart/form-data">
									    <div class="form-group">
									      <c:set var="fnames" value="${fn:split(vo.fname,'/')}"/>
									      <c:set var="rfnames" value="${fn:split(vo.rfname,'/')}"/>
									      <c:if test="${!empty vo.fname}">
										      <c:forEach var="fname" items="${fnames}" varStatus="st"><font color="blue">
										        - ${st.count}. 업로드된 파일명 : ${fname}
										        <input type="button" value="삭제" onclick="pdsFileDelCheck('${fname}','${rfnames[st.index]}')"/>
										        <br/></font>
										      </c:forEach>
									      </c:if>
									    </div>
									    <div class="form-group">
									      <input type="button" value="파일추가" onclick="fileAdd()"/>
									      <input type="file" name="fname1" id="fname1" class="form-control-file border" accept=".zip,.jpg,.gif,.png,.hwp,.ppt,.pptx"/>
									    </div>
									    <div class="form-group" id="fileInsert"></div>
									    <div class="form-group">올린이 : ${snickname}</div>
									    <div class="form-group">
									      <label for="title">자료제목 : </label>
									      <input type="text" name="title" id="title" value="${vo.title}" class="form-control" required/>
									    </div>
									    <div class="form-group">
									      <label for="content">자료내용 : </label>
									      <textarea rows="4" name="content" id="content" class="form-control" required>${vo.content}</textarea>
									    </div>
									    <div class="form-group">
									      <label for="part">자료분류 : </label>
									      <select name="part" size="1" class="form-control">
									        <option value="논문" <c:if test="${vo.part eq '논문'}">selected</c:if>>논문</option>
									        <option value="뉴스" <c:if test="${vo.part eq '뉴스'}">selected</c:if>>뉴스</option>
									        <option value="통계" <c:if test="${vo.part eq '통계'}">selected</c:if>>통계</option>
									        <option value="기타" <c:if test="${vo.part eq '기타'}">selected</c:if>>기타</option>
									      </select>
									    </div>
									    <div class="form-group">
									      <div class="form-check-inline">공개여부 : &nbsp; &nbsp;
										      <label class="form-check-label">
										        <input type="radio" name="opensw" class="form-check-input" value="공개" <c:if test="${vo.opensw eq '공개'}">checked</c:if>/>공개 &nbsp; &nbsp;
										      </label>
										      <label class="form-check-label">
										        <input type="radio" name="opensw" class="form-check-input" value="비공개" <c:if test="${vo.opensw eq '비공개'}">checked</c:if>/>비공개 &nbsp; &nbsp;
										      </label>
									      </div>
									    </div>
									    <div class="form-group">
									      <label for="pwd">비밀번호 : </label>
									      <input type="password" name="pwd" id="pwd" value="${vo.pwd}" class="form-control" required/>
									    </div>
									    <div class="form-group">
									      <button type="button" onclick="fCheck()" class="btn btn-secondary">자료수정하기</button>
									      <button type="reset" class="btn btn-secondary">다시쓰기</button>
									      <button type="button" onclick="delCheck()" class="btn btn-secondary">삭제하기</button>
									      <button type="button" onclick="location.href='${contextPath}/pList.pds';" class="btn btn-secondary">돌아가기</button>
									    </div>
									    <input type="hidden" name="idx" value="${vo.idx}"/>
									    <input type="hidden" name="pag" value="${pag}"/>
									    <input type="hidden" name="fnames" value="${vo.fname}"/>
									    <input type="hidden" name="rfnames" value="${vo.rfname}"/>
									    <input type="hidden" name="mid" value="${smid}"/>
									    <input type="hidden" name="nickname" value="${snickname}"/>
									    <input type="hidden" name="fsize"/>
									  </form>
									</div>
            </div>
        </div>


<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>