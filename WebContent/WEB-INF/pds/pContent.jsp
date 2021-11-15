<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pContent.jsp</title>
  <%@ include file="/include/bs.jsp" %>
  <script>
    function delCheck() {
    	var res = confirm("현재 자료파일을 삭제하기겠습니까?");
    	location.href="${contextPath}/delPds.pds?idx=${vo.idx}";
    }
  </script>
</head>
<body>
<p></p>
<!-- The Modal -->
<!-- <div class="modal" id="myModal"> -->
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">${vo.title}</h4>
        (${vo.part})
        <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <hr/>
        - 올린이 : ${vo.nickname}
        <hr/>
        <c:if test="${vo.opensw == '공개' || smid == vo.mid || slevel == 0}">
          - 아이디 : ${vo.mid}<br/>
          - 파일명 : ${vo.fname}<br/>
          - 자료설명 : ${fn:replace(vo.content,newLine,"<br/>")}<br/>
          <c:set var="orfname" value="${vo.rfname}"/>
          <c:set var="rfname" value="${vo.rfname}"/>
          <c:set var="rfnameLen" value="${fn:length(rfname)}"/>
          <c:set var="rfname" value="${fn:substring(rfname, rfnameLen-4, rfnameLen-1)}"/>
          <c:set var="rfname" value="${fn:toUpperCase(rfname)}"/>
          <c:if test="${rfname=='JPG' || rfname=='GIF' || rfname=='PNG'}">
            <c:set var="img" value="${fn:split(orfname,'/')}"/>
            <c:forEach var="imgItem" items="${img}" varStatus="st">
              ${st.count}.${imgItem}<br/><img src="${contextPath}/data/pds/${imgItem}" width="350px"/><br/><br/>
            </c:forEach>
          </c:if>
          <c:if test="${rfname!='JPG' && rfname!='GIF' && rfname!='PNG'}">
            : 일반파일
          </c:if>
        </c:if>
        <c:if test="${vo.opensw != '공개'}">
          : 비공개
        </c:if>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.close()">Close</button>
      </div>

    </div>
  </div>
<!-- </div> -->
</body>
</html>