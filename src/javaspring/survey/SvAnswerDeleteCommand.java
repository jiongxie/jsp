package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvAnswerDeleteCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    String sdate = request.getParameter("sdate");
    
    SurveyDao dao = new SurveyDao();
    
    dao.svAnwerDelete(idx);
    
    request.setAttribute("msg", "svAnswerDeleteOk");
    request.setAttribute("url", request.getContextPath()+"/svList.su?sdate="+sdate);
  }

}
