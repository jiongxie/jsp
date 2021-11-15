package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvResultCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int survey_idx = Integer.parseInt(request.getParameter("idx"));
    String sdate = request.getParameter("sdate");
    
    SurveyDao dao = new SurveyDao();
    
    SurveyAnswerVo vo = dao.svResult(survey_idx);  // 투표한 건수에 대한 통계 처리 호출
    
    request.setAttribute("vo", vo);
    request.setAttribute("sdate", sdate);
  }

}
