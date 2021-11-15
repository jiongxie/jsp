<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/include/navhome.jsp" %>
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
<title>공지사항</title>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>

<script>
    function pageCheck() {
    	var pageSize = pageForm.pageSize.value;
    	location.href="${contextPath}/bList.nt?pag=${pag}&pageSize="+pageSize;
    }
    function sCheck() {
    	var searchString = searchForm.searchString.value;
    	if(searchString == "") {
    		alert("검색어를 입력하세요.");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
  </script>
</head>
<body>
<div class="nav-wrapper">
<%-- 	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li class="selected"><a href="${contextPath}/bList.bo">Notice</a></li>
			<li><a href="${contextPath}/bList2.bo">Board</a></li>
			<li><a href="./index.jsp">Home</a></li>
			<!-- END MENU -->
		</ul>
	</div> --%>
</div>
<div class="container">
  <table class="table table-sm">
    <tr><td style="border:none;"><h4>Notice</h4></td></tr>
    <tr>
      <td style="text-align:left;border:none;">
        <table style="width:100%;">
          <tr>
          	<c:if test="${slevel == 0 }">
            	<td style="text-align:left;border:none;width:10%;"><button type="button" onclick="location.href='${contextPath}/bInput.nt?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary btn-sm">글올리기 </button></td>
            </c:if>
            <td style="text-align:left;border:none;width:5%;">
	            <form name="pageForm">
			          <select name="pageSize" onchange="pageCheck()">
			            <option value="5"  ${pageSize==5  ? 'selected' : ''}>5건</option>
			            <option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
			            <option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
			            <option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
			          </select>
	        		</form>
            </td>
            <td style="text-align:right;border:none;width:85%;">
			      <!-- 페이징 처리 시작   -->
					    <c:if test="${pag != 1}"><a href="bList.nt?pag=1&pageSize=${pageSize}" style="color:#666">◁◁</a></c:if>
					    <c:if test="${pag > 1}"><a href="bList.nt?pag=${pag-1}&pageSize=${pageSize}" style="color:#666">◀</a></c:if>
					    ${pag}Page / ${totPage}Pages
					    <c:if test="${pag < totPage}"><a href="bList.nt?pag=${pag+1}&pageSize=${pageSize}" style="color:#666">▶</a></c:if>
					    <c:if test="${pag != totPage}"><a href="bList.nt?pag=${totPage}&pageSize=${pageSize}" style="color:#666">▷▷</a></c:if>
					  <!-- 페이징 처리 끝   -->
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table class="table table-hover">
    <tr style="text-align: center;">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날자</th>
      <th>조회(댓글)수</th>
      <th>좋아요</th>
    </tr>
    <c:forEach var="vo" items="${vos}">  <!-- for(String str : 배열명) -->
	    <tr>
	      <td>${vo.idx}</td>
	      <td style="text-align:left;">
	        <a href="${contextPath}/bContent.nt?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="color:#333">${vo.title}</a>
	        <c:if test="${vo.wNdate <= 24}"><img src="${contextPath}/images/new.gif"/></c:if>
	      </td>
	      <td>
	        <c:set var="varLen" value="${fn:length(vo.homepage)}"/>
	        <c:set var="homepage" value="${fn:substring(vo.homepage,7,varLen)}"/>
	        <c:if test="${!empty homepage}">
	          <a href="${vo.homepage}" target="_blank">${vo.name}</a>
	        </c:if>
	        <c:if test="${empty homepage}">
	          ${vo.name}
	        </c:if>
	      </td>
	      <td>${vo.wdate}</td>
	      <td>${vo.readnum}(${vo.replyCount})</td>
	      <td>${vo.good}</td>
	    </tr>
    </c:forEach>
  </table>
</div>
  <!-- 
  <c:set var="blockSize" value="${blockSize}"/>
  <c:set var="pag" value="${pag}"/>
  <c:set var="totPage" value="${totPage}"/>
    시작페이지 구하는 방법 1: startPageNum = (pag-1)/blockSize)*blockSize+1
                  2: startPageNum = pag - (pag-1)%blockSize 
  -->

<br/>
<!-- 검색기 처리 시작 -->
<div class="container" style="text-align:center">
  <form name="searchForm" method="get" action="${contextPath}/bSearch.nt">
    <b>검색 : </b>
    <select name="search" size=1>
      <option value="title" selected>글제목</option>
      <option value="name">글쓴이</option>
      <option value="content">글내용</option>
    </select> &nbsp;
    <input type="text" name="searchString"/>
    <input type="button" value="검 색" onclick="sCheck()"/>
    <input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝 -->
<p><br/></p>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>