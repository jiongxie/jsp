<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>scContent.jsp(일정 등록/조회/갱신)</title>
  <script>
    function fCheck() {
    	var title = myform.title.value;
    	var content = myform.content.value;
    	if(title == "") {
    		alert("일정 제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(content == "") {
    		alert("일정 상세내역을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
    
    function delCheck() {
    	var ans = confirm("오늘 일정을 삭제하시겠습니가?");
    	if(ans) {
    		location.href="${contextPath}/schedule/scDelect.cd?ymd=${ymd}&mid=${mid}";
    	}
    }
  </script>
</head>
<body>
<%@ include file="/include/sCheck.jsp" %>
<%@ include file="/include/navhome.jsp" %>
<div class="container">
  <h2>일 정 관 리</h2>
  <form name="myform" method="post" action="${contextPath}/scContentOk.cd">
    <div class="form-group">
      <label for="scdate">일정날짜</label>
      <input type="text" class="form-control" id="scdate" name="scdate" value="${ymd}" readonly/>
    </div>
    <div class="form-group">
      <label for="mid">올린이</label>
      <input type="text" class="form-control" id="mid" name="mid" value="${mid}" readonly/>
    </div>
    <div class="form-group">
      <label for="memory">분류 : </label>
      <select class="form-control" id="memory" name="memory" size="1">
        <option value="모임" ${vo.memory=="모임" ? "selected" : ""}>모임</option>
        <option value="업무" ${vo.memory=="업무" ? "selected" : ""}>업무</option>
        <option value="학습" ${vo.memory=="학습" ? "selected" : ""}>학습</option>
        <option value="여행" ${vo.memory=="여행" ? "selected" : ""}>여행</option>
        <option value="기타" ${vo.memory=="기타" ? "selected" : ""}>기타</option>
      </select>
    </div>
    <div class="form-group">
      <label for="title">일정제목 : </label>
      <input type="text" class="form-control" id="title" name="title" placeholder="일정제목을 입력하세요." value="${vo.title}"/>
    </div>
    <div class="form-group">
      <label for="content">일정내용 : </label>
      <textarea class="form-control" rows="4" id="content" name="content">${vo.content}</textarea>
    </div>
    <div class="form-group">
      <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/schedule.cd?ymd=${ymd}&mid=${mid}';">돌아가기</button>
    </div>
  	<input type="hidden" name="idx" value="${vo.idx}"/>
  </form>
</div>
<p><br/><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>