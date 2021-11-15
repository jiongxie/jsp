<!-- adminLoginOk.jsp -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="T1113_Database.LoginVo"%>
<%@page import="T1113_Database.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
  String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
  
  if(mid.equals("admin")) {
    session.setAttribute("sadmin", "admin");
    out.println("<script>");
    out.println("alert('관리자 로그인 성공!!!');");
    out.println("location.href='gList.jsp';");
    out.println("</script>");
  }
  else {
    out.println("<script>");
    out.println("alert('관리자 인증 실패~~');");
    out.println("location.href='gList.jsp';");
    out.println("</script>");
  }
%>