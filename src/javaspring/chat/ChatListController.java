package javaspring.chat;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.parser.JSONParser;

@WebServlet("/chatList")
public class ChatListController extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String listType = request.getParameter("listType");
    if(listType == null || listType.equals("")) {
      response.getWriter().write("");
    }
    else if(listType.equals("ten")) {
      response.getWriter().write(getTen());  // 10개 항목씩을 출력(담기위한)하기 위한 메소드
    }
    else {
      try {
        response.getWriter().write(getIdx(listType));  // 기타 지정한 갯수만큼을 출력(담기위한)하기위한 메소드
      } catch (Exception e) {
        response.getWriter().write("");
      }
    }
  }

  // 마지막 접속 idx 이후 자료출력
  private String getIdx(String idx) {
    ChatDao dao = new ChatDao();
    List<ChatVo> vos = dao.chatList(idx);  // 10개의 메세지를 DB에서 읽어와서 vos에 저장했다.
    ChatVo vo = new ChatVo();
    
    StringBuffer res = new StringBuffer();
    res.append("{\"res\":[");
    for(int i=0; i<vos.size(); i++) {
      vo = vos.get(i);
      res.append("[{\"value\":\""+vo.getIdx()+"\"},");
      res.append("{\"value\":\""+vo.getNickname()+"\"},");
      res.append("{\"value\":\""+vo.getContent()+"\"},");
      res.append("{\"value\":\""+vo.getCdate()+"\"},");
      res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
      if(i != (vos.size() -1)) res.append(",");
    }
    res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
    return res.toString();
  }

  // 최근 10개의 메세지만 호출하여 담은후 채팅방으로 보낸다.(DB의 내용을 vo에 담은후 json형식으로 변환시켜 보낸다.) 
  private String getTen() {
    ChatDao dao = new ChatDao();
    List<ChatVo> vos = dao.chatList(10);  // 10개의 메세지를 DB에서 읽어와서 vos에 저장했다.
    ChatVo vo = new ChatVo();
    
    StringBuffer res = new StringBuffer();
    res.append("{\"res\":[");
    for(int i=0; i<vos.size(); i++) {
      vo = vos.get(i);
      res.append("[{\"value\":\""+vo.getIdx()+"\"},");
      res.append("{\"value\":\""+vo.getNickname()+"\"},");
      res.append("{\"value\":\""+vo.getContent()+"\"},");
      res.append("{\"value\":\""+vo.getCdate()+"\"},");
      res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
      if(i != (vos.size() -1)) res.append(",");
    }
    res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
    System.out.println("res : " + res);
    return res.toString();
  }
}
