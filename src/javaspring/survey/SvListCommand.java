package javaspring.survey;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvListCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String sdate = request.getParameter("sdate")==null ? "" : request.getParameter("sdate");
    
    SurveyDao dao = new SurveyDao();
    
    ArrayList<String> sdateArr = dao.sdateSearch();
    
    List<SurveyVo> vos = dao.svList(sdate);

    request.setAttribute("sdateArr", sdateArr);
    request.setAttribute("sdate", sdate);
    request.setAttribute("vos", vos);
  }

}
