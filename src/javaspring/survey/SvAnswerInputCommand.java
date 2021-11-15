package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SvAnswerInputCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
    
    SurveyDao dao = new SurveyDao();
    int res = dao.svCheckInput(idx, mid);
    
    
    
    System.out.println("idx :" + idx);
    System.out.println("mid :" + mid);
    System.out.println("res : " + res);
    if(res == 0) {
      System.out.println("res : 0" );
      request.setAttribute("msg", "svSearchInputNo");
      request.setAttribute("url", request.getContextPath()+"/svList.su");
    }
    else {

      SurveyVo vo = dao.svAnswerInput(idx);
      System.out.println("vo:" + vo);
      request.setAttribute("vo", vo);
//      request.setAttribute("msg", "svSearchInputOk");
//      request.setAttribute("url", request.getContextPath()+"/svAnswerInput.su");
    }
    
  }

}
