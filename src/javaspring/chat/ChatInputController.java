package javaspring.chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatInput")
public class ChatInputController extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
    String content = URLDecoder.decode(request.getParameter("content"), "UTF-8");
    String avatar = request.getParameter("avatar");
    String res = request.getParameter("res");
    
    // 이름과 내용이 비었으면 '0'을 넘기고, 자료가 있으면, 객체를 생성해서 Dao에 담아서 넘긴다.
    if(name==null || name.equals("") || content==null || content.equals("")) {
      response.getWriter().write("0");
    }
    else {
      response.getWriter().write(new ChatDao().chatInput(name, content, avatar));
      System.out.println("res : " + res);
    }
  }
}
