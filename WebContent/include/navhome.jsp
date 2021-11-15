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
        
        <a class="navbar-brand" href="${contextPath }/index.jsp" title="">
          <img src="${contextPath }/assets/images/mashuptemplate.svg" class="navbar-logo-img" alt="">
        </a>
      </div>
    </div>
  </nav>
</header>