package javaspring.consult;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WMInputOkCommand implements WebMessageCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    WebMessagectVo vo = new WebMessagectVo();
    vo.setSendId(request.getParameter("sendId"));
    vo.setReceiveId(request.getParameter("receiveId"));
    vo.setTitle(request.getParameter("title"));
    vo.setContent(request.getParameter("content"));
    
    WebMessageDao dao = new WebMessageDao();
    int res = dao.wmInput(vo);
    
    if(res == 1) {
      request.setAttribute("msg", "webInputOk");
      request.setAttribute("url", request.getContextPath()+"/webMessage.ct?msw=1");
    }
    else {
      request.setAttribute("msg", "webInputNo");
      request.setAttribute("url", request.getContextPath()+"/webMessage.ct?msw=0");
    }
  }

}
