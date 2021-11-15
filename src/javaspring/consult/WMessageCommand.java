package javaspring.consult;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WMessageCommand implements WebMessageCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String mid = (String) session.getAttribute("smid");
    
    int msw = request.getParameter("msw")==null? 1 : Integer.parseInt(request.getParameter("msw"));
    int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
    
    String receiveId = request.getParameter("receiveId")==null? "" : request.getParameter("receiveId");  // 답장하기에서 보내온 id(receiveId)가 편지쓰기에서는 받는 아이디(receiveId)가 된다.  
    
    
    WebMessageDao dao = new WebMessageDao();
    WebMessagectVo vo = null;
    
    if(msw == 6) { // 한건의 메세지 내용 보기
      vo = dao.webMessageOne(idx, mid);
      request.setAttribute("vo", vo);
    }
    else if(msw == 0) {
      
    }
    else {  // 받은메세지
      List<WebMessagectVo> vos = dao.webMessageList(mid, msw);
      request.setAttribute("vos", vos);
    }
    
    request.setAttribute("msw", msw);
  }

}
