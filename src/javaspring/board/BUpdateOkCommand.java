package javaspring.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateOkCommand implements BoardCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("name")==null ? "" : request.getParameter("name");
    String title = request.getParameter("title")==null ? "" : request.getParameter("title");
    String email = request.getParameter("email")==null ? "" : request.getParameter("email");
    String homepage = request.getParameter("homepage")==null ? "" : request.getParameter("homepage");
    String content = request.getParameter("content")==null ? "" : request.getParameter("content");
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    String hostip = request.getParameter("hostip");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    String pag = request.getParameter("pag");
    
    BoardVo vo = new BoardVo();
    vo.setName(name);
    vo.setTitle(title);
    vo.setEmail(email);
    vo.setHomepage(homepage);
    vo.setContent(content);
    vo.setPwd(pwd);
    vo.setHostip(hostip);
    
    BoardDao dao = new BoardDao();
    
    int res = dao.bUpdateOk(vo, idx);
    
    if(res == 1) {
      request.setAttribute("msg", "bUpdateOk");
      request.setAttribute("url", request.getContextPath()+"/bContent.bo?idx="+idx+"&pag="+pag);
    }
    else {
      request.setAttribute("msg", "bUpdateNo");
      request.setAttribute("url", request.getContextPath()+"/bUpdate.bo?idx="+idx+"&pag="+pag);
    }
  }
}
