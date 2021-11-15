<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="/include/sCheck.jsp" %>
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
  <title>index.jsp</title>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="./main.a3f694c0.css" rel="stylesheet"></head>
	<script>
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




<!-- Add your site or app content here -->
<div class="background-image-container white-text-container">
    <div class="overlay"></div>
        <div class="row">
            <div class="col-xs-12">
								  <table class="table">
								    <tr>
								      <td style="border:none;">
								        (<font color="brown"><b>${search}</b></font>(으)로 <font color="blue"><b>${searchString}</b></font>(을)를 검색한 결과 <font color="red"><b>${searchCount}</b></font>건이 있습니다.)
								      </td>
								    </tr>
								    <tr>
								      <td style="text-align:left;border:none;">
								        <table style="width:100%;">
								          <tr>
								            <td style="text-align:left;border:none;width:8%;">
								              <button type="button" onclick="location.href='${contextPath}/bInput.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary btn-sm">글올리기 </button>
								            </td>
								            <td style="text-align:left;border:none;width:8%;">
								              <button type="button" onclick="location.href='${contextPath}/bList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary btn-sm">돌아가기 </button>
								            </td>
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
								            <td style="text-align:right;border:none;width:79%;">
											      <!-- 페이징 처리 시작   -->
													    <c:if test="${pag != 1}"><a href="bList.bo?pag=1&pageSize=${pageSize}" style="color:#666">◁◁</a></c:if>
													    <c:if test="${pag > 1}"><a href="bList.bo?pag=${pag-1}&pageSize=${pageSize}" style="color:#666">◀</a></c:if>
													    ${pag}Page / ${totPage}Pages
													    <c:if test="${pag < totPage}"><a href="bList.bo?pag=${pag+1}&pageSize=${pageSize}" style="color:#666">▶</a></c:if>
													    <c:if test="${pag != totPage}"><a href="bList.bo?pag=${totPage}&pageSize=${pageSize}" style="color:#666">▷▷</a></c:if>
													  <!-- 페이징 처리 끝   -->
								            </td>
								          </tr>
								        </table>
								      </td>
								    </tr>
								  </table>
								  <table class="table">
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
									        <a href="${contextPath}/bContent.bo?idx=${vo.idx}&pag=${pag}" style="color:#666">${vo.title}</a>
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
								  <!-- 
								  <c:set var="blockSize" value="${blockSize}"/>
								  <c:set var="pag" value="${pag}"/>
								  <c:set var="totPage" value="${totPage}"/>
								    시작페이지 구하는 방법 1: startPageNum = (pag-1)/blockSize)*blockSize+1
								                  2: startPageNum = pag - (pag-1)%blockSize 
								  -->
								<%-- 
								<!-- 블록 페이징처리 시작 -->
								<div class="container" style="text-align:center">
								  <ul class="pagination justify-content-center"">
									  <c:set var="startPageNum" value="${pag - (pag-1)%blockSize}"/>
									  <c:if test="${pag != 1}">
									    <li class="page-item"><a href="bSearch.bo?pag=1&pageSize=${pageSize}" class="page-link">◁◁</a></li>
									    <li class="page-item"><a href="bSearch.bo?pag=${pag-1}&pageSize=${pageSize}" class="page-link">◀</a></li>
									  </c:if>
									  <c:forEach var="i" begin="0" end="2">
									    <c:if test="${(startPageNum+i) <= totPage}">
									      <c:if test="${pag == (startPageNum+i)}">
									        <li class="page-item active"><a href="bSearch.bo?pag=${startPageNum+i}&pageSize=${pageSize}" class="page-link"><font color="#fff"><b>${startPageNum+i}</b></font></a></li>
									      </c:if>
									      <c:if test="${pag != (startPageNum+i)}">
									        <li class="page-item"><a href="bSearch.bo?pag=${startPageNum+i}&pageSize=${pageSize}" class="page-link">${startPageNum+i}</a></li>
									      </c:if>
									    </c:if>
									  </c:forEach>
									  <c:if test="${pag != totPage}">
									    <li class="page-item"><a href="bSearch.bo?pag=${pag+1}&pageSize=${pageSize}" class="page-link">▶</a></li>
									    <li class="page-item"><a href="bSearch.bo?pag=${totPage}&pageSize=${pageSize}" class="page-link">▷▷</a></li>
									  </c:if>
									</ul>
								</div>
								<!-- 블록 페이징처리 끝 -->
								--%>
								<br/>
								<!-- 검색기 처리 시작 -->
								<div class="container" style="text-align:center">
								  <form name="searchForm" method="get" action="${contextPath}/bSearch.bo">
								    <b>검색 : </b>
								    <select name="search" size=1>
								      <option value="title" <c:if test="${search eq '글제목' }">selected</c:if>>글제목</option>
								      <option value="name" <c:if test="${search eq '글쓴이' }">selected</c:if>>글쓴이</option>
								      <option value="content" <c:if test="${search eq '글내용' }">selected</c:if>>글내용</option>
								    </select> &nbsp;
								    <input type="text" name="searchString"/>
								    <input type="button" value="검 색" onclick="sCheck()"/>
								  </form>
								</div>
								<!-- 검색기 처리 끝 -->
        </div>
    </div>
</div>


<%@ include file="/include/footer.jsp" %>
</html>