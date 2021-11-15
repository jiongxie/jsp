<!-- 페이징 처리  -->
<%@page import="guest.GuestVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guest.GuestDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="/include/navhome.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String mid = session.getAttribute("sadmin")==null ? "" : (String) session.getAttribute("sadmin");

  GuestDao dao = new GuestDao();
  GuestVo vo = new GuestVo();
  
  // 페이징 처리(이전/다음) 시작(한페이지분량 : 5건)
  int pageSize = 5; //한페이지 분량
  int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
  int totRecCnt = dao.totRecCnt();  // 총레코드 건수를 구한다.
  int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt/pageSize : (int)(totRecCnt/pageSize) + 1;  // 총 페이지 수
  int statNo = (pag - 1) * pageSize;  // 해당 페이지의 시작 인덱스 번호
  int curScrNo = totRecCnt - statNo;   // 화면에 표시하는 게시글의 번호
  // 페이징 처리 끝..
	
	ArrayList<GuestVo> vos = dao.gList(statNo, pageSize);  // 방명록에 한페이지 분량(5건)만 불러오기
%>
<!DOCTYPE html>

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

  <title>gList.jsp</title>  
 <link href="./main.a3f694c0.css" rel="stylesheet"></head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
h2 {font-family: "배달의민족 주아"}
		#content{
			width: 700px;
			margin: 0 auto;
			/* border: 5px solid rgba(163, 204, 163); */
			border: 5px solid #bbb;
			border-radius: 1em;
			padding-left: 30px;
			padding-right: 30px;
		}	
	
table {
      width : 400px;
      margin : 0px auto;
    }
    table, th,td {
      border: 1px solid #aaa;
      padding : 15px;
    }
    th {
      text-align: center;
    }

  </style>
</head>
<body>




<!-- Add your site or app content here -->
    <div class="container">
    	
    	<div style="text-align:center;">
				<h2>Guest</h2>
			</div>
    
        <div class="row">
            <div class="col-xs-12">
                <div class="container" >
								  <table style="border:0px;" id="content" class="table table-borderless">
								    <tr>
								    	<td>
											   <c:if test="${smid != 'admin'}">
											   	문의사항 및 등업신청해주세요
											   </c:if>
											   <c:if test="${smid == 'admin'}">
											   	관리자
											   </c:if>
								    	</td>
								      <td class="borderLine0" style="text-align:right;"><input type="button" value="글올리기" class="btn btn-secondary" onclick="location.href='gInput.jsp';"/></td>
								    </tr>
								  </table>
								<%
								  //int cnt = vos.size();
								  for(int i=0; i<vos.size(); i++) {
								    vo = vos.get(i);
								    
								    String email = vo.getEmail();
								    if(email.equals("") || email == null) {
								      email = "- 없음 -";
								    }
								    
								    String homepage = vo.getHomepage();
								    homepage = homepage.substring(7);
								    
								    String content = vo.getContent().replace("\n", "<br/>");
								%>
								  <table class="borderLine0" id="content" >
								    <tr>
								      <td class="borderLine0">방문번호 : <%=curScrNo %>
									      <c:if test="${smid == 'admin'}">
												      <a href="<%=request.getContextPath()%>/gDelete?idx=<%=vo.getIdx()%>" style="color:black;">삭제</a>
												</c:if>
								      </td>
								      <td class="borderLine0" style="text-align:right;">방문자 IP : <%=vo.getHostip() %></td>
								    </tr>
								  </table>
								  <table class="b" id="content">
								    <tr>
								      <th class="tdCenter" style="width:15%">성명</th>
								      <td style="width:35%;"><%=vo.getName() %></td>
								      <th class="tdCenter" style="width:15%;">방문일자</th>
								      <td style="width:35%;"><%=vo.getVdate() %></td>
								    </tr>
								    <tr>
								      <th class="tdCenter">전자우편</th>
								      <td><%=email %></td>
								      <th class="tdCenter">Homepage</th>
								      <td>
								      <%if(homepage.equals("") || homepage == null) { %>
								          - 없음 -
								      <%} else { %>
								        <a href="<%=vo.getHomepage() %>" target="_blank" style="color:black;"><%=homepage %></a></td>
								      <%} %>
								    </tr>
								    <tr>
								      <th class="tdCenter">방문소감</th>
								      <td colspan="3"><%=content %></td>
								    </tr>
								  </table>
								  <p><br/></p>
								<%
								    curScrNo--;
								  } %>
								  <p></p>
								</div>
								<!-- 페이징 처리 시작   -->
								  <div style="text-align:center;">
								    <% if(pag != 1) { %>
								       [<a href="gList.jsp?pag=1" style="color:black;">첫페이지</a>]
								    <% } %>
								    <% if(pag > 1) { %>
								       [<a href="gList.jsp?pag=<%=pag-1%>" style="color:black;">이전페이지</a>]
								    <% } %>
								    <%=pag%>Page / <%=totPage%>Pages 
								    <% if(pag < totPage) { %>
								       [<a href="gList.jsp?pag=<%=pag+1%>" style="color:black;">다음페이지</a>]
								    <% } %>
								    <% if(pag != totPage) { %>
								       [<a href="gList.jsp?pag=<%=totPage%>" style="color:black;">끝페이지</a>]
								    <% } %>
								  </div>
								<!-- 페이징 처리 끝   -->
								<p><br/></p>
               <!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</html>