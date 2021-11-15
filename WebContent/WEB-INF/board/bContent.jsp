<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ include file="/include/navhome.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${param.idx == 0}">
  <script>location.href="${contextPath}/";</script>
</c:if>
<!DOCTYPE html>
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

  <title>bContent.jsp</title>  
<link href="./main.a3f694c0.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
  function delCheck() {
  	var ans = confirm("현 게시물을 삭제하시겠습니까?");
  	var pwd = myform.pwd.value;
  	if(ans) {
  		location.href="${contextPath}/bDelete.bo?idx=${vo.idx}&pwd="+pwd+"&pag=${pag}";
  	}
  }
  function adelCheck() {
  	var ans = confirm("현 게시물을 삭제하시겠습니까?");
  	if(ans) {
  		location.href="${contextPath}/abDelete.bo?idx=${vo.idx}&pag=${pag}";
  	}
  }
    function updCheck() {
    	var pwd = myform.pwd.value;
    	location.href="${contextPath}/bUpdate.bo?idx=${vo.idx}&pwd="+pwd+"&pag=${pag}";
    }
    
    function goodCheck() {
    	//var ans = confirm("별점을 주시겠습니가?");
    	//if(!ans) {
    	//	return false;
    	//}
    	var query = {idx : ${vo.idx}}
    	
    	$.ajax({
    		url : "${contextPath}/bGood.bo",
    		type: "get",
    		data: query,
    		success:function(data) {
    			//alert("별점이 추가 되었습니다.");
    			location.reload();
    		}
    	});
    }
    
    function reCheck() {
    	var content = contForm.content.value;
    	if(content == "") {
    		alert("댓글 내용을 입력하세요.");
    		contForm.content.focus();
    	}
    	else {
    		contForm.submit();
    	}
    }
    
    // 댓글삭제(AJax 처리)
    function reDelCheck(contIdx) {
    	var query = {idx : contIdx};
    	var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "${contextPath}/bReplyDel",
    		type : "get",
    		data : query,
    		success : function(data) {
    			if(data == "1") {
	    			//alert("댓글이 삭제 되었습니다.");
      			location.reload();
    			}
    		},
    		error : function(data) {
    			alert("댓글이 삭제되지 않았습니다.");
    		}
    	});
    }
  </script>
	
</head>
<body>

<!-- Add your site or app content here -->
<div class="background-image-container white-text-container">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="container">
									<form name="myform" method="post">
									  <br/>
									  <table class="table table-bordered">
									    <tr>
									      <th>글쓴이</th>
									      <td>${vo.name}</td>
									      <th>글쓴날짜</th>
									      <td>${vo.wdate}</td>
									    </tr>
									    <tr>
									      <th>전자우편</th>
									      <td>${vo.email}</td>
									      <th>홈페이지</th>
									      <td>${vo.homepage}</td>
									    </tr>
									    <tr>
									      <th>조회수</th>
									      <td>${vo.readnum}</td>
									      <th>접속IP</th>
									      <td>${vo.hostip}</td>
									    </tr>
									    <tr>
									      <th>글제목</th>
									      <td colspan=3 style="text-align:left;">${vo.title}</td>
									    </tr>
									    <tr">
									      <th>글내용</th>
									      <td colspan=3 style="text-align:left;height:150px;">${fn:replace(vo.content,newLine,"<br/>")}</td>
									    </tr>
									    <tr>
									      <th>비밀번호</th>
									      <td>
									        	<input type="password" name="pwd"/>
									      </td>
									      <th>좋아요</th>
									      <td> <input type="button" value="♥" onclick="goodCheck()"/> ${vo.good}</td>
									    </tr>
									    <tr>
									      <td colspan=4 style="text-align:center;">
									        <input type="button" value="수정" onclick="updCheck()"/>
										        <input type="button" value="삭제" onclick="delCheck()"/>
										        <input type="button" value="돌아가기" onclick="location.href='${contextPath}/bList.bo?pag=${pag}&pageSize=${pageSize}';"/>
										        <c:if test="${smid =='admin'}">
										        	<input type="button" value="관리자삭제" onclick="adelCheck()"/>
										        </c:if>
									      </td>
									    </tr>
									  </table>
									</form>
									<br/>
									<!-- 댓글 출력처리 -->
									<div>
									  <table class="table table-borderless">
									    <tr>
									      <th>작성자</th>
									      <th>댓글내용</th>
									      <th>작성일자</th>
									      <th>접속IP</th>
									    </tr>
									    <c:forEach var="cVo" items="${cVos}">
									      <tr>
									        <td>
									        	${cVo.nickname}
									        	<c:if test="${cVo.mid == smid}">
									        	  (<a href="javascript:reDelCheck(${cVo.idx});" style="color:black;">삭제</a>)
									        	</c:if>
									        </td>
									        <td>${cVo.content}</td>
									        <td>${fn:substring(cVo.wdate,0,10)}</td>
									        <td>${cVo.hostip}</td>
									      </tr>
									    </c:forEach>
									  </table>
									</div>
									
									<!-- 댓글 입력처리 -->
									<form name="contForm" method="post" action="${contextPath}/bContInput.bo">
									  <table class="table">
									    <tr>
									      <td style="text-align:left; width:90%;">
									        <label for="content">글내용 : </label>
									        <textarea class="form-control" rows="5" id="content" name="content" style="width:100%;"></textarea>
									      </td>
									      <td style="line-height:20px;">
									        <br/><br/>
									        <p style="color:blue;"><input type="text" name="nickname" size="6" value="${snickname}" readonly/></p>
									        <p style="color:blue;"><input type="button" value="댓글달기" onclick="reCheck()"/></p>
									        <p style="color:blue;"><input type="button" value="돌아가기" onclick="location.href='${contextPath}/bList.bo?pag=${pag}&pageSize=${pageSize}';"/></p>
									      </td>
									    </tr>
									  </table>
									  <input type="hidden" name="idx" value="${vo.idx}"/>
									  <input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
									  <input type="hidden" name="pag" value="${pag}"/>
									  <input type="hidden" name="mid" value="${smid}"/>
									</form>
									<p><br/></p>
									</div>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>

</html>