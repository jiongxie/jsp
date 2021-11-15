package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvContentCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    SurveyDao dao = new SurveyDao();
    
    SurveyVo vo = dao.svAnswerInput(idx);
    
    request.setAttribute("vo", vo);
  }

}
