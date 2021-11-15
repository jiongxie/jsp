<%@page import="javaspring.member.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  String aSw = (String) request.getAttribute("aSw");
  String title = "";
  if(aSw.equals("new")) {
    title = "신규회원(<font color='red'>준회원</font>)";
  }
  else if(aSw.equals("reset")) {
    title = "<font color='red'>탈퇴</font>신청회원";
  } 
%>
<!DOCTYPE html>
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

  <title>amNewList.jsp</title>  
<link href="./main.a3f694c0.css" rel="stylesheet"></head>

	<script>
	  function levelCheck() {
		  alert("회원 정보를 변경하시려면, '정보변경'버튼을 클릭하세요!");
	  }
	  function memberResetCheck(mid) {
		  var ans = confirm("회원정보를 삭제하시겠습니까?");
		  if(ans) {
			  location.href="<%=request.getContextPath()%>/mReset.mem?mid="+mid;
		  }
	  }
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




<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" style="background-image: url('./allweather/assets/images/img-13.jpg')">
    <div class="overlay"></div>
    <div class="container">
    	<div class="dropdown">
			    <a href='amList.ad'><button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"  style="color:black;" >
			      회원관리
			    </button></a>
			    <a href='${contextPath }/newMemberList.ad?aSw=new&pag=${pag}'><button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"  style="color:black;" >
			       신규회원(준회원)
			    </button></a>
			    <a href='${contextPath }/resetMemberList.ad?aSw=reset'><button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"  style="color:black;" >
			      탈퇴신청회원
			    </button></a>
			    <a href='${contextPath }/components.jsp'><button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"  style="color:black;" >
			   	 마이페이지
			    </button></a>
			  </div>
        <div class="row">
            <div class="col-xs-12">
								  <div class="container">
								  <table>
								    <tr>
								      <th>번호</th>
								      <th>아이디</th>
								      <th>별명</th>
								      <th>성명</th>
								      <th>성별</th>
								      <th>최종접속일</th>
								      <th>방문횟수</th>
								      <th>취미</th>
								      <th>정보유무</th>
								      <th>등급</th>
								    </tr>
								<%
								    ArrayList<MemberVo> vos = (ArrayList<MemberVo>) request.getAttribute("vos");
								    MemberVo vo = new MemberVo();
								    
								    int cnt = vos.size();
								    String strlevel = "";
								    for(int i=0; i<vos.size(); i++) {
								      vo = vos.get(i);
								      switch(vo.getLevel()) {
								        case 0:
								          strlevel = "관리자";
								          break;
								        case 1:
								          strlevel = "준회원";
								          break;
								        case 2:
								          strlevel = "정회원";
								          break;
								        case 3:
								          strlevel = "우수회원";
								          break;
								      }
								      String userDel = "";
								      if(vo.getUserdel().equals("OK")) {
								        userDel = "<font color='red'>탈퇴신청</font>";
								      }
								      else {
								        userDel = "정상";
								      }
								%>
								      <tr>
								        <td><%=cnt%></td>
								        <td>
								          <a href="<%=request.getContextPath()%>/memberView.ad?mid=<%=vo.getMid()%>" target="_blank" style="color:blue;"><%=vo.getMid()%></a>
								        </td>
								        <td><%=vo.getNickname()%></td>
								        <td><%=vo.getName()%></td>
								        <td><%=vo.getGender()%></td>
								        <td><%=vo.getLastDate().substring(0, 10)%></td>
								        <td><%=vo.getVisitCnt()%></td>
								        <td><%=vo.getHobby()%></td>
								        <td><font color="red"><%=vo.getUserinfor()%></font></td>
								        <td>
								          <form name="myform" method="get" action="<%=request.getContextPath()%>/levelCheck.ad">
									          <select name="level" onchange="levelCheck()">
									            <option value="1" <% if(vo.getLevel()==1) { %>selected<% } %>>준회원</option>
									            <option value="2" <% if(vo.getLevel()==2) { %>selected<% } %>>정회원</option>
									            <option value="3" <% if(vo.getLevel()==3) { %>selected<% } %>>우수회원</option>
									            <option value="0" <% if(vo.getLevel()==0) { %>selected<% } %>>관리자</option>
									          </select>
									          <input type="submit" value="정보변경"/>
									          <input type="hidden" name="idx" value="<%=vo.getIdx()%>"/>
									          <input type="hidden" name="pag" value="${pag}"/>
								          </form>
								        </td>
								      </tr>
								<%
								      cnt--;
								    }
								%>    
								  </table>
								  <br/>
								</div>
		            </div>
		        </div>
		    </div>
		</div>

<!-- Footer -->
<%@ include file="/include/footer.jsp" %>

<script>
document.addEventListener("DOMContentLoaded", function (event) {
  navbarToggleSidebar();
});
</script>
</html>ㄴ