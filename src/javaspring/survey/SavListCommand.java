package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SavListCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int survey_idx = Integer.parseInt(request.getParameter("idx"));
    String sdate = request.getParameter("sdate");
    int curNo = request.getParameter("curNo")==null? 1 : Integer.parseInt(request.getParameter("curNo"));
    
    SurveyDao dao = new SurveyDao();
    
    SurveyAnswerVo vo = dao.savList(survey_idx, curNo);  // 개별 설문결과 보기
    
    vo.setCurNo(curNo);
    
    request.setAttribute("vo", vo);
    request.setAttribute("sdate", sdate);
  }

}
