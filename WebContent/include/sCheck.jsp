<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  int level2 = session.getAttribute("slevel")==null ? 99 : (Integer) session.getAttribute("slevel");
  if(level2 > 3) {
    out.println("<script>");
    out.println("alert('로그인후 사용하세요!');");
    out.println("location.href='./index.jsp';");
    out.println("</script>");
  }
%>