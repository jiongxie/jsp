package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChartAnalysisCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int survey_idx = Integer.parseInt(request.getParameter("idx"));
    int flag = Integer.parseInt(request.getParameter("flag"));
    
    SurveyDao dao = new SurveyDao();
    
    SurveyAnswerVo vo = dao.svResult(survey_idx);
    
    request.setAttribute("vo", vo);
    request.setAttribute("flag", flag);
  }

}
