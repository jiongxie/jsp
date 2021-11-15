<%@page import="javaspring.schedule.ScheduleVo"%>
<%@page import="javaspring.schedule.ScheduleDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  String mid = session.getAttribute("smid")==null ? "" : (String) session.getAttribute("smid");

  Calendar calToday = Calendar.getInstance(); // 오늘 날짜를 저장(calToday변수)
  Calendar cal = Calendar.getInstance(); 			// 화면에 표시할(될) 날짜 .....
  
  int yy = request.getParameter("yy")==null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
  int mm = request.getParameter("mm")==null ? cal.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
  
  cal.set(yy,mm,1);  // 해당 년,월의 첫날을 셋팅
  
  // 달력의 첫주 셋팅을 위한 준비
  int startWeek = cal.get(Calendar.DAY_OF_WEEK);  // 앞에서 설정한 '년/월'의 1일에 해당하는 요일값을 찾는다(받아온다).
  
  int prevYear = yy; 				// 전년도
  int prevMonth = (mm) - 1; // 이전월
  int nextYear = yy;				// 다음년도
  int nextMonth = (mm) + 1; // 다음월
  
  if(prevMonth < 0) { // 1월에서 '전월' 버튼을 클릭시에 실행함.
    prevYear--;
    prevMonth = 11;
  }
  
  if(nextMonth > 11) { // 12월에서 '다음월' 버튼을 클릭시에 실행함.
    nextYear++;
    nextMonth = 0;
  }
  
%>
<c:if test="${slevel != null}">
	<%@ include file="/include/sCheck.jsp" %>
	<%@ include file="/include/navhome.jsp" %>
</c:if>

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
  <meta charset="UTF-8">
  <title>schedule.jsp</title>
  <link href="./main.97292821.css" rel="stylesheet">
  <style>
    table {
      width : 400px;
      margin : 0px auto;
    }
    table, th,td {
      border: 5px solid #aaa;
      padding : 15px;
      color: blue;
      
    }
    th {
      text-align: center;
      
    }
    td {
    	color:black;
      
    }
    
  </style>
</head>
<body>
  <h2 style="text-align:center">일정공지</h2>
	  <table>
	    <tr style="text-align:center; color:#f0f;">
	      <th colspan="5" style="border:none">
	        <a href="${contextPath}/schedule.sc?yy=<%=prevYear-1%>&mm=<%=mm%>" title="전년도"><font color='#f00'>◀◀</font></a>&nbsp;
	        <a href="${contextPath}/schedule.sc?yy=<%=prevYear%>&mm=<%=prevMonth%>" title="전월"><font color='#00f'>◁</font></a>&nbsp;
	        &nbsp;<%=yy%>년 <%=mm+1%>월&nbsp;
	        <a href="${contextPath}/schedule.sc?yy=<%=nextYear%>&mm=<%=nextMonth%>" title="다음월"><font color='#00f'>▷</font></a>&nbsp;
	        <a href="${contextPath}/schedule.sc?yy=<%=nextYear+1%>&mm=<%=mm%>" title="다음년도"><font color='#f00'>▶▶</font></a>
	      </th>
	      <th colspan="2" style="border:none">
	        <a href="${contextPath}/components.jsp"><font color='black'>MyPage</font></a>
	      </th>
	    </tr>
	    <tr style="text-align:center; background-color:gray; color:#fff;">
	      <th><font color="#f00">일</font></th>
	      <th>월</th>
	      <th>화</th>
	      <th>수</th>
	      <th>목</th>
	      <th>금</th>
	      <th><font color="#00f">토</font></th>
	    </tr>
	    <tr>
	<%
	    // 시작요일만큼 공백을 추가한다.
	    for(int i=1; i<startWeek; i++) {
	      out.println("<td>&nbsp;</td>");
	    }
	
	    String ymd = "";
	    String memory = "";
	    ScheduleDao dao = new ScheduleDao();
	
			while(cal.get(Calendar.MONTH) == mm) {  // 해당월의 '마지막 일자'까지 반복수행시킨다.(예:12월은 31일)
			  ymd=cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);  //화면에 표시되는 일자(년월일(ymd))로 셋팅)
	      ScheduleVo vo = dao.scContent(ymd, mid);
	      
	      if(vo.getMemory() == null) {
	        memory = "";
	      }
	      else {
	      	memory = vo.getMemory();
	      }
	
			  if(cal.get(Calendar.YEAR)==calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calToday.get(Calendar.MONTH) && cal.get(Calendar.DATE)==calToday.get(Calendar.DATE)) {
				  out.println("<td style='background-color:pink'><a href='scContent.sc?ymd="+ymd+"&mid="+mid+"' title='"+vo.getTitle()+"'><b>"+cal.get(Calendar.DATE)+"</b></a><br/>"+memory+"</td>");  // 오늘날짜
			  }
			  else if(cal.get(Calendar.DAY_OF_WEEK) == 1) {  // 일요일
			    out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+mid+"' title='"+vo.getTitle()+"'><font color='#f00'>"+cal.get(Calendar.DATE)+"</font></a><br/>"+memory+"</td>");
			  }
			  else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {  // 토요일
			    out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+mid+"' title='"+vo.getTitle()+"'><font color='#00f'>"+cal.get(Calendar.DATE)+"</font></a><br/>"+memory+"</td>");
			  }
			  else {
			    			out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+mid+"' title='"+vo.getTitle()+"'><font color='black'>"+cal.get(Calendar.DATE)+"</font></a><br/>"+memory+"</td>");  // 평일
			  }
			
			  if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {  // 토요일이면 줄바꿈한다.
			    out.println("</tr><tr>");
			  }
			  
			  cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); // 현재 표시일 다음날짜를 새롭게 셋팅
			}
			
			 //마지막줄의 칸이 7개가 꽉 차지 않았다면은 마지막날짜뒤로 공백을 채워준다.
			if(cal.get(Calendar.DAY_OF_WEEK) <= 7) {
			  for(int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) {
			    out.println("<td>&nbsp;</td>");
			  }
			}
	%>
	    </tr>
	  </table>
	 <p><br/><br/></p>
	 <p><br/><br/></p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>