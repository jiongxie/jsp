<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  int level = session.getAttribute("slevel")==null ? 99 : (int) session.getAttribute("slevel");
%>
<% pageContext.setAttribute("newLine", "\n"); %>
<link href="${contextPath }/main/assets/apple-touch-icon.png" rel="apple-touch-icon">
<link href="${contextPath }/main/assets/favicon.ico" rel="icon">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link href="${contextPath }/main.a3f694c0.css" rel="stylesheet"></head>
<header>
  <nav class="navbar  navbar-fixed-top navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle uarr collapsed" data-toggle="collapse" data-target="#navbar-collapse-uarr">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${contextPath }/index.jsp" title="">
          <img src="${contextPath }/assets/images/mashuptemplate.svg" class="navbar-logo-img" alt="">
        </a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-collapse-uarr">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="${contextPath }/about.jsp" title="">  About</a></li>
          <li><a href="<%=request.getContextPath()%>/guest/gList.jsp" title="">  Guest</a></li>
          <li><a href="${contextPath }/pricing.jsp" title=""> All weather Fund </a></li>
          <li><a href="${contextPath }/about2.jsp" title=""> Blog </a></li>
<%    if(level == 99) { %>
			<li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/login.mem">Login</a>
      </li> 		
<%    } else { %>		
    	      <li><a href="${contextPath }/bList.nt" title="">Notice</a></li>
    	      <li><a href="${contextPath }/bList.bo" title="">Board</a></li>
     	  	  <li><a href="./components.jsp" title="">MyPage</a></li>
		      <li >
		        <a href="<%=request.getContextPath()%>/loginOut.mem" >Logout</a>
		      </li>
<%    } %>
          <li>
            <p>
              <a href="./download.jsp" class="btn btn-primary navbar-btn" title="">Download</a>
            </p>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
</header>