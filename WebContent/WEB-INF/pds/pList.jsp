<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/include/navhome.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
  <title>pList.jsp</title>  
<link href="./main.a3f694c0.css" rel="stylesheet"></head>

	 <script>
    // 다운로드처리 수증가
    function UpdateDownNum(idx) {
    	var query = {
    			idx : idx
    	}
    	$.ajax({
    		url:"${contextPath}/updateDownNum",
    		type: "post" ,
    		data: query,
    		success: function(data) {
    			location.reload();
   			}
    	});
    }
    function nWin(idx) {
    	var url = "${contextPath}/pContent.pds?idx="+idx;
    	var winX = 500;
    	var winY = 400;
    	var x = (window.screen.width)/2 - winX/2;
    	var y = (window.screen.height)/2 - winY/2;
    	window.open(url,"pdsWindow","width="+winX+", height="+winY+", left="+x+", top="+y);
    }
    
    // 분류해서 보여주기
    function partCheck() {
    	var part = partForm.part.value;
    	location.href = "pList.pds?pag=${pag}&part="+part;
    }
    
  </script>
</head>
<body>

<%-- <div class="nav-wrapper">
	<div class="nav pagewidth">
		<ul>	
			<!-- MENU -->
			<li ><a href="<%=request.getContextPath()%>/svList.su">Research</a></li>
			<li class="selected"><a href="${contextPath}/pList.pds">Share</a></li>
			<li><a href="./about2.jsp">Blog</a></li>
			<!-- END MENU -->
		</ul>
	</div>
</div> --%>


<!-- Add your site or app content here -->
<div class="background-image-container white-text-container">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
									<div class="container">
									  <table class="table">
									      <td style="text-align:left;border:none">
									        <form name="partForm">
									          <select name="part" onchange="partCheck()" size="1" class="form-control" style="width:30%;">
									            <option value="전체" ${part=='전체' ? 'selected' : ''}>전체</option>
									            <option value="논문" ${part=='논문' ? 'selected' : ''}>논문</option>
									            <option value="뉴스" ${part=='뉴스' ? 'selected' : ''}>뉴스</option>
									            <option value="통계" ${part=='통계' ? 'selected' : ''}>통계</option>
									            <option value="기타" ${part=='기타' ? 'selected' : ''}>기타</option>
									          </select>
									        </form>
									      </td>
									      <%    if(level == 0 || level == 3) { %>
									      <td style="text-align:right;border:none">
									        <button type="button" onclick="location.href='${contextPath}/pInput.pds';" class="btn btn-secondary">자료올리기</button>
									      </td>
									      <% } %>
									      <button type="button" onclick="location.href='${contextPath}/about2.jsp';" class="btn btn-secondary">Blog</button>
									    </tr>
									  </table>
									  <table class="table table-hover">
									    <tr style="text-align: center;">
									      <th>번호</th>
									      <th>자료제목</th>
									      <th>올린이</th>
									      <th>올린날자</th>
									      <th>파일명(크기)</th>
									      <th>분류</th>
									      <th>다운수</th>
									      <th>다운로드</th>
									    </tr>
									    <c:forEach var="vo" items="${vos}">  <!-- for(String str : 배열명) -->
										    <tr>
										      <td>${curScrNo} </td>
										      <td>
										        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
										        	<a href="javascript:nWin('${vo.idx}')" style="color:black;">${vo.title}</a>
										        </c:if>
										        <c:if test="${vo.opensw != '공개' && smid != vo.mid && slevel != 0}">
										          :비공개:
										        </c:if>
										      </td>
										      <td>${vo.nickname}</td>
										      <td>
										        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
										        	${vo.fdate}
										        </c:if>
										        <c:if test="${vo.opensw != '공개' && smid != vo.mid && slevel != 0}">
										          :비공개:
										        </c:if>
										      </td>
										      <td>
										        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
											        <%-- ${vo.fname}(${vo.fsize}) --%>
											        <c:set var="strFiles" value="${fn:split(vo.fname,'/')}"/>
											        <c:set var="strRFiles" value="${fn:split(vo.rfname,'/')}"/>
											        <c:forEach var="strFile" items="${strFiles}" varStatus="st">
											          <a href="${contextPath}/data/pds/${strRFiles[st.index]}" download style="color:black;"><font color='blue'>${strFile}</font></a><br/>
											        </c:forEach>
											      </c:if>
											      <c:if test="${vo.opensw != '공개' && smid != vo.mid && slevel != 0}">
										         <a style="color:black;"> :비공개:</a>
										        </c:if>
										      </td>
										      <td>${vo.part}</td>
										      <td>
										        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
										        	${vo.downnum}
										        </c:if>
										        <c:if test="${vo.opensw != '공개' && smid != vo.mid && slevel != 0}">
										          :비공개:
										        </c:if>
										      </td>
										      <td>
										        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
										        	<a href="javascript:UpdateDownNum(${vo.idx})"><input type="button" style="color:black;" value="다운" onclick="location.href='${contextPath}/pDownLoad.pds?idx=${vo.idx}';"/></a>
										        	<c:if test="${smid == vo.mid}">
										        	  <input type="button" value="수정" onclick="location.href='${contextPath}/pUpdate.pds?idx=${vo.idx}&pag=${pag}';"/>
										        	</c:if>
										        	<c:if test="${slevel == 0 || smid == vo.mid}">
										        	  <input type="button" value="삭제" onclick="location.href='${contextPath}/pBackCheck.pds?idx=${vo.idx}&pag=${pag}';"/>
										        	</c:if>
										        </c:if>
										        <c:if test="${vo.opensw != '공개' && smid != vo.mid && slevel != 0}">
										          :비공개:
										        </c:if>
										      </td>
										    </tr>
										    <c:set var="curScrNo" value="${curScrNo - 1}"/>
									    </c:forEach>
									  </table>
									</div>
									<br/>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</div>
</body>
</html>