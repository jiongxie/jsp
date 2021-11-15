package javaspring.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BInputOkCommand implements NoticeCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("name")==null ? "" : request.getParameter("name");
    String title = request.getParameter("title")==null ? "" : request.getParameter("title");
    String email = request.getParameter("email")==null ? "" : request.getParameter("email");
    String homepage = request.getParameter("homepage")==null ? "" : request.getParameter("homepage");
    String content = request.getParameter("content")==null ? "" : request.getParameter("content");
    String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
    String hostip = request.getParameter("hostip");
    String pageSize = request.getParameter("pageSize");
    
    BoardVo vo = new BoardVo();
    vo.setName(name);
    vo.setTitle(title);
    vo.setEmail(email);
    vo.setHomepage(homepage);
    vo.setContent(content);
    vo.setPwd(pwd);
    vo.setHostip(hostip);
    
    BoardDao dao = new BoardDao();
    
    int res = dao.bInputOk(vo);
    
    if(res == 1) {
      request.setAttribute("msg", "bInputOk");
      request.setAttribute("url", request.getContextPath()+"/bList.nt?pageSize="+pageSize);
    }
    else {
      request.setAttribute("msg", "bInputNo");
      request.setAttribute("url", request.getContextPath()+"/bInput.nt?pageSize="+pageSize);
    }
    //request.setAttribute("pageSize", pageSize);
  }

}
