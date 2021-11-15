<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="/include/sCheck.jsp" %>
<%@ include file="/include/navhome.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
  

  <title>bUpdate.jsp</title>
  <link href="./main.a3f694c0.css" rel="stylesheet">  
	<script>
    function fCheck() {
    	var name = myform.name.value;
    	var title = myform.title.value;
    	var content = myform.content.value;
    	if(name == "") {
    		alert("글쓴이를 입력하세요");
    		myform.name.focus();
    	}
    	else if(title == "") {
    		alert("글제목을 입력하세요");
    		myform.title.focus();
    	} 
    	else if(content == "") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
	
</head>
<body>


<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./assets/images/img-13.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
									<div class="container">
										<form name="myform" method="post" action="${contextPath}/bUpdateOk.nt">
										  <table class="table">
										  </table>
										  <table class="table table-bordered">
										    <tr>
										      <th>글쓴이</th>
										      <td>
										        <input type="text" name="name" id="name" value="${vo.name}" required/>
										      </td>
										    </tr>
										    <tr>
										      <th>글제목</th>
										      <td><input type="text" name="title" id="title" value="${vo.title}" size="60" required/></td>
										    </tr>
										    <tr>
										      <th>이메일</th>
										      <td><input type="text" name="email" id="email" value="${vo.email}" size="60"/></td>
										    </tr>
										    <tr>
										      <th>홈페이지</th>
										      <td><input type="text" name="homepage" id="homepage" value="${vo.homepage}" size="60"/></td>
										    </tr>
										    <tr>
										      <th>글내용</th>
										      <td><textarea rows="6" cols="62" name="content" id="content">${vo.content}</textarea></td>
										    </tr>
										    <tr>
										      <th>비밀번호</th>
										      <td><input type="password" name="pwd" id="pwd" size="20" value="${vo.pwd}" required/></td>
										    </tr>
											  <tr>
											    <td colspan=2 style="text-align:center;">
											      <input type="button" value="글수정" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
											      <input type="reset" value="다시쓰기" class="btn btn-secondary"/> &nbsp;
											      <input type="button" value="돌아가기" onclick="location.href='${contextPath}/bList.nt?pag=${pag}';" class="btn btn-secondary"/>
											    </td>
											  </tr>
										  </table>
										  <input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
										  <input type="hidden" name="idx" value="${vo.idx}"/>
										  <input type="hidden" name="pag" value="${pag}"/>
										</form>
									</div>
									<p><br/></p>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>
