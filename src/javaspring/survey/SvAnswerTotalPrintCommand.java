package javaspring.survey;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvAnswerTotalPrintCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int survey_idx = Integer.parseInt(request.getParameter("idx"));
    String sdate = request.getParameter("sdate");
    
    SurveyDao dao = new SurveyDao();
    
    List<SurveyAnswerVo> vos = dao.svAnswerTotalPrint(survey_idx);
    
    System.out.println("vos : " + vos);
    
    request.setAttribute("vos", vos);
    request.setAttribute("sdate", sdate);
  }

}
