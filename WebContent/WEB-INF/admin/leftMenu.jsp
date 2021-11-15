<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>leftMenu.jsp</title>
  <script>
    function logoutCheck() {
    	parent.location.href = "<%=request.getContextPath()%>/adminout.ad";
    }
  </script>
</head>
<body bgcolor="#ddd">
<p><br/></p>
<div style="text-align:center;">
  <h3><a href="<%=request.getContextPath()%>/content.ad" target="content">메뉴</a></h3>
  <hr/>
  <p><a href="<%=request.getContextPath()%>/agList.ad" target="content">문의사항 관리</a></p>
  <hr/>
  <p><a href="<%=request.getContextPath()%>/amList.ad" target="content">회원관리</a></p>
  <hr/>
  <p><a href="<%=request.getContextPath()%>/amSurvey.ad" target="content">설문지관리</a></p>
  <hr/>
  <p><a href="javascript:logoutCheck()">홈으로</a></p>
</div>
</body>
</html>