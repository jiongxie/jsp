<%@page import="guest.GuestVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="/include/bs.jsp" %>
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

  <title>agNewList.jsp</title>
  <link href="./main.97292821.css" rel="stylesheet">
  <script>
    
  </script>
  <style>
    table {
      width : 400px;
      margin : 0px auto;
    }
    table, th,td {
      border: 5px solid #aaa;
      padding : 15px;
      color: blue;
      font-weight: bold;
    }
    th {
      text-align: center;
      color:blue;
      font-weight: bold;
    }
    td {
    	color:blue;
      font-weight: bold;
    }
  </style>
</head>
<body>
	<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./assets/images/img-20.jpg')">
    <div class="overlay"></div>
        <div class="row">
				<div class="container">
	      <h5 style="color:black;">최근 방명록(최근 5일간)</h5>
				<%
					GuestVo vo = new GuestVo();
					ArrayList<GuestVo> vos = (ArrayList<GuestVo>) request.getAttribute("vos");
					int cnt = vos.size();
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
				  <table class="borderLine0">
				    <tr>
				      <td class="borderLine0">방문번호 : <%=cnt %>
				        <a href="<%=request.getContextPath()%>/gDelete?idx=<%=vo.getIdx()%>">삭제</a>
				      </td>
				      <td class="borderLine0" style="text-align:right;">방문자 IP : <%=vo.getHostip() %></td>
				    </tr>
				  </table>
				  <table>
				    <tr>
				      <th class="tdCenter" style="width:15%;">성명</th>
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
				        <a href="<%=vo.getHomepage() %>" target="_blank"><%=homepage %></a></td>
				      <%} %>
				    </tr>
				    <tr>
				      <th class="tdCenter">방문소감</th>
				      <td colspan="3"><%=content %></td>
				    </tr>
				  </table>
				  <p><br/></p>
				<%
				    cnt--;
				  } %>
				  <p></p>
				</div>
			</div>
	</div>
</div>				
<p><br/></p>
</body>
</html>