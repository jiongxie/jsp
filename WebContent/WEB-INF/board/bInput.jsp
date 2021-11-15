<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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

  <title>bInput.jsp</title>  
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
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
<%-- <div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li class="selected"><a href="${contextPath}/bList.bo">Notice</a></li>
			<li><a href="${contextPath}/bList2.bo">Board</a></li>
			<li><a href="./index.jsp">Home</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div> --%>




<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./assets/images/img-13.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <br/>
									<div class="container">
										<form name="myform" method="post" action="${contextPath}/bInputOk.bo">
										  <table class="table">
										  </table>
										  <table class="table table-bordered">
										    <tr>
										      <th>글쓴이</th>
										      <td>
										        <input type="text" name="name" id="name" value="${snickname}" placeholder="이름을 입력하세요." required/>
										      </td>
										    </tr>
										    <tr>
										      <th>글제목</th>
										      <td><input type="text" name="title" id="title" placeholder="글내용을 입력하세요" size="60" autofocus required/></td>
										    </tr>
										    <tr>
										      <th>이메일</th>
										      <td><input type="text" name="email" id="email" size="60" placeholder="메일을 입력하세요"/></td>
										    </tr>
										    <tr>
										      <th>홈페이지</th>
										      <td><input type="text" name="homepage" id="homepage" value="http://" size="60"/></td>
										    </tr>
										    <tr>
										      <th>글내용</th>
										      <td><textarea rows="6" cols="62" name="content" id="content"></textarea></td>
										    </tr>
										    <tr>
										      <th>비밀번호</th>
										      <td><input type="password" name="pwd" id="pwd" size="20" placeholder="비밀번호를 입력하세요" required/></td>
										    </tr>
											  <tr>
											    <td colspan=2 style="text-align:center;">
											      <input type="button" value="글올리기" onclick="fCheck()" class="btn btn-secondary"/> &nbsp;
											      <input type="reset" value="다시쓰기" class="btn btn-secondary"/> &nbsp;
											      <input type="button" value="돌아가기" onclick="location.href='${contextPath}/bList.bo?pag=${param.pag}&pageSize=${param.pageSize}';" class="btn btn-secondary"/>
											    </td>
											  </tr>
										  </table>
										  <input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
										  <input type="hidden" name="pageSize" value="${param.pageSize}"/>
										</form>
									</div>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>

</html>