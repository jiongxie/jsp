<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmList.jsp</title>
  <script>
    function msgDel(idx,mflag) {  // mflag의 값이 3이면 '보낸메세지', 1이면 '받은메세지'
    	var ans = confirm("메세지를 삭제하시겠습니까?");
    	if(!ans) {
    		return false;
    	}
			var query = {
					idx : idx,
					mflag : mflag
			}
    	
    	$.ajax({
    		url : "${contextPath}/webMessageDel",
    		type: "get",
    		data: query,
    		success:function(data) {
    			if(data == '1') {
	    			alert("메세지가 삭제 되었습니다.");
	    			location.reload();
    			}
    		}
    	});
    }
  </script>
</head>
<body>
<%@ include file="/include/sCheck.jsp" %>
  <table class="table" style="width:100%; margin:0px">
    <tr style="background-color:#ccc;">
      <td>
        <c:if test="${msw==1 || msw==2 || msw==5}">보낸사람</c:if>
        <c:if test="${msw==3 || msw==4}">받은사람</c:if>
      </td>
      <td>
     	<c:if test="${smid != 'admin'}">메세지</c:if>	
     	<c:if test="${smid == 'admin'}">매매신청</c:if>	
      </td>
      <td>
        <c:if test="${msw !=3 }">받은날짜</c:if>
        <c:if test="${msw ==3 }"><font color="orange">보낸날짜</font>(확인날짜)</c:if>
      </td>
    </tr>
    <c:forEach var="vo" items="${vos}">
      <tr>
        <td>
          <c:if test="${msw==1 || msw==2 || msw==5}">${vo.sendId}</c:if>
        	<c:if test="${msw==3 || msw==4}">${vo.receiveId}</c:if>
        </td>
        <td>
          <c:if test="${msw != 5}">    <!-- 휴지통보기가 아닐때 처리하는곳 -->
            <c:if test="${msw == 3}">  <!-- 보낸메세지함 보기일경우 처리하는곳 -->
              <c:if test="${vo.receiveSw != 'n'}">
            		${vo.title}<a href="javascript:msgDel('${vo.idx}','3')">(삭제)</a>  <!-- 보낸메세지스위치(sendSw를 's'에서 'x'로 변경한다.) -->
            	</c:if>
              <c:if test="${vo.receiveSw == 'n'}">
            		<font color="orange">${vo.title}</font><a href="javascript:msgDel('${vo.idx}','3')">(삭제)</a>  <!-- 보낸메세지스위치(sendSw를 's'에서 'x'로 변경한다.) -->
            	</c:if>
            </c:if>
            <c:if test="${msw != 3}">
		          <a href="${contextPath}/webMessage.wm?idx=${vo.idx}&msw=6" style="color:black;">${vo.title}</a>
		          <c:if test="${vo.receiveSw=='n'}"><img src="${contextPath}/images/new.gif"/></c:if>
		        </c:if>
	        </c:if>
          <c:if test="${msw == 5}"> <!-- 휴지통에서 삭제처리 하기 -->
            ${vo.title}<a href="javascript:msgDel('${vo.idx}','1')"><!-- (삭제) --></a>  <!-- 받은메세지스위치(receiveSw를 'g'에서 'x'로 변경한다.) -->
          </c:if>
        </td>
        <td>
          <c:if test="${vo.receiveSw != 'n'}">
        		${fn:substring(vo.receiveDate,0,10)}
        	</c:if>
          <c:if test="${vo.receiveSw == 'n'}">
        		<font color="orange">${fn:substring(vo.receiveDate,0,10)}</font>
        	</c:if>
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>