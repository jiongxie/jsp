package javaspring.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement.ParseInfo;

public class SvAnswerInputOkCommand implements SurveyCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String sdate = request.getParameter("sdate");
    String mid = request.getParameter("mid");
    
    
    SurveyDao dao = new SurveyDao();
    
    int res = dao.svAnswerInputOk(request, response);
    
    if(res == 1) {
      int ch = dao.svCheckInputOk(request, response);
      System.out.println("mid : " + mid);
      request.setAttribute("msg", "svAnswerInputOk");
      request.setAttribute("url", request.getContextPath()+"/svList.su?sdate="+sdate);
    }
    else {
      request.setAttribute("msg", "svAnswerInputNo");
      request.setAttribute("url", request.getContextPath()+"/svAnswerInput.su?sdate="+sdate);
    }

  }

}
