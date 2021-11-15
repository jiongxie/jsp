<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int guestCnt = (int) request.getAttribute("guestCnt");
	int memberCnt = (int) request.getAttribute("memberCnt");
  int memberResetCnt = (int) request.getAttribute("memberResetCnt");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 우측메뉴</title>
</head>
<body>
<p><br/></p>
	<div class="container">
	  <h2>이곳은 관리자 메뉴 화면 입니다.</h2>
	  <h3>최근 새로 올라온 글입니다.</h3>
	  <hr/>
	  <p>방명록(최근 5일) : <font color="blue"><a href="<%=request.getContextPath()%>/newGuestList.ad"><%=guestCnt %>건</a></font></p>
	  <hr/>
	  <p>새로 가입한 회원(준회원) : <font color="blue"><a href="<%=request.getContextPath()%>/newMemberList.ad?aSw=new"><%=memberCnt %>명</a></font></p></p>
	  <hr/>
	  <p>탈퇴 신청한 회원 : <font color="blue"><a href="<%=request.getContextPath()%>/resetMemberList.ad?aSw=reset"><%=memberResetCnt %>명</a></font></p></p>
	  <hr/>
	</div>
</body>
</html>