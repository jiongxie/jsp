<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/include/sCheck.jsp" %>
<%@ include file="/include/navhome.jsp" %>
<!DOCTYPE html>
<html>
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

  <title>webMessage.jsp</title>
 <link href="./main.a3f694c0.css" rel="stylesheet"></head>
  <script>
    function webDeleteAll() {
    	var ans = confirm("휴지통의 모든 메세지를 삭제합니다.");
    	if(!ans) {
    		return false;
    	}
    	var query = {
				receiveId : "${smid}"
			}
		
			$.ajax({
				url : "${contextPath}/webMessageAllDel",
				type: "get",
				data: query,
				success:function(data) {
					if(data == '1') {
		    			alert("휴지통의 모든 메세지가 삭제 되었습니다.");
		    			location.reload();
					}
				}
			});
    }
  </script>
  <style>
    .leftwin {
      float : left;
      width : 25%;
      text-align : center;
      background-color: #ddd;
    }
    .rightwin {
      float : left;
      width : 75%;
      text-align : left;
      background-color: #eee;
    }
    .h5 {
    	text-align:center;
    }
      .background-image-container {
	  width: 100%;
	  height: 100%;
	  text-align: center;
	  position: relative;
	  z-index: 1;
		}
		.background-image-container::after {
		  width: 100%;
		  height: 100%;
		  content: "";
		  background-image: url('./assets/images/img-20.jpg');
			backgournd-position: center center;		  
		  position: absolute;
		  top: 0;
		  left: 0;
		  z-index: -1;
		  opacity: 0.5;
		}
  </style>
</head>
<body>

<p><br/></p>
<div class="background-image-container white-text-container">
    <div class="overlay">

		<div class="container">
		  <div>
		    <h5 style="color:black;">자산관리</h5>(<font color='red'>${smid}</font>)
		  </div>
		  <br/>
		  <div class="leftwin">
		<%	if(level != 0)  { %>
		    <p><a href="${contextPath}/webMessage.wm?msw=0" style="color:black;">상품거래</a></p>
		<%	} %>    
		    <p><a href="${contextPath}/components.jsp" style="color:black;">MyPage</a></p>
		    <p><a href="${contextPath}/webMessage.wm?msw=2" style="color:black	;">New</a></p>
		    <p><a href="${contextPath}/webMessage.wm?msw=1" style="color:black;">Main</a></p>
<%-- 		 
		 <%	if(level == 0)  { %>
		    <p><a href="${contextPath}/webMessage.wm?msw=5" style="color:black;">매매기록</a></p>
		<%	} %>
 --%>		 
		  </div>
		  <div class="rightwin">
		    <p>
		      <c:if test="${msw == 0}">  <!-- 메세지 작성 -->
		        <h3 style="text-align:center; color:black;">상품거래</h3>
		        <jsp:include page="wmInput.jsp"/>
		      </c:if>
		      <c:if test="${msw == 1}">  <!-- 받은 메세지-->
		        <h3 style="text-align:center; color:black;">Main</h3>
		        <jsp:include page="wmList.jsp"/>
		      </c:if>
		      <c:if test="${msw == 2}">  <!-- 새메세지 -->
		        <h3 style="text-align:center; color:black;">New</h3>
		        <jsp:include page="wmList.jsp"/>
		      </c:if>
		      <c:if test="${msw == 3}">  <!-- 보낸 메세지 -->
		        <h3 style="text-align:center;">보낸 메세지</h3>
		        <jsp:include page="wmList.jsp"/>
		      </c:if>
		      <c:if test="${msw == 4}">  <!-- 수신 확인 -->
		        <h3 style="text-align:center;">수신 확인</h3>
		        <jsp:include page="wmList.jsp"/>
		      </c:if>
		      <c:if test="${msw == 5}">  <!-- 휴지통 목록 -->
		        <h3 style="text-align:center;">매매기록</h3>
		        <jsp:include page="wmList.jsp"/>
		      </c:if>
		      <c:if test="${msw == 6}">  <!-- 메세지 내용보기 -->
		        <h3 style="text-align:center;">메세지 내용</h3>
		        <jsp:include page="wmContent.jsp"/>
		      </c:if>
		    </p>
		  </div>
		</div>
		
	</div>
</div>		

<!-- Footer -->
<%@ include file="/include/footer.jsp" %>

<script>
/* document.addEventListener("DOMContentLoaded", function (event) {
  navbarToggleSidebar();
}); */
</script> -->
</body>
</html>