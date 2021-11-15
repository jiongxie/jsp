package javaspring.survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.GetConn;

public class SurveyDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  SurveyVo sVo = null;
  SurveyAnswerVo saVo = null;
  public int svInput(HttpServletRequest request, HttpServletResponse response) {
    try {
      sql = "insert into survey values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("sdate"));
      pstmt.setString(2, request.getParameter("kwajung"));
      pstmt.setString(3, request.getParameter("kwamok"));
      pstmt.setString(4, request.getParameter("kcode"));
      pstmt.setString(5, request.getParameter("danwi"));
      pstmt.setString(6, request.getParameter("wdate"));
      pstmt.setString(7, request.getParameter("question1"));
      pstmt.setString(8, request.getParameter("question2"));
      pstmt.setString(9, request.getParameter("question3"));
      pstmt.setString(10, request.getParameter("question4"));
      pstmt.setString(11, request.getParameter("question5"));
      pstmt.setString(12, request.getParameter("question6"));
      pstmt.setString(13, request.getParameter("question7"));
      pstmt.setString(14, request.getParameter("question8"));
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }
  
  // 선택된 입교일자에 맞는 자료만 검색해오기
  public List<SurveyVo> svList(String sdate) {
    List<SurveyVo> vos = new ArrayList<SurveyVo>();
    try {
      if(sdate.equals("")) {
        sql = "select * from survey order by idx desc limit 0,5";
        pstmt = conn.prepareStatement(sql);
      }
      else {
        sql = "select * from survey where sdate = ? order by idx desc";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, sdate);
      }
      rs = pstmt.executeQuery();
      while(rs.next()) {
        sVo = new SurveyVo();
        sVo.setIdx(rs.getInt("idx"));
        sVo.setKwajung(rs.getString("kwajung"));
        sVo.setKwamok(rs.getString("kwamok"));
        sVo.setKcode(rs.getString("kcode"));
        sVo.setDanwi(rs.getString("danwi"));
        sVo.setWdate(rs.getString("wdate"));
        
        sVo.setAnswerCnt(answerCnt(rs.getInt("idx"))); // 현재 설문지에 대한 참여자수 구하기
        
        vos.add(sVo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vos;
  }

  // 설문지에 참여한 인원수 구하기
  private int answerCnt(int idx) {
    PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;
    
    try {
      sql = "select count(idx) from survey_answer where survey_idx = ?";
      pstmt2 = conn.prepareStatement(sql);
      pstmt2.setInt(1, idx);
      rs2 = pstmt2.executeQuery();
      rs2.next();
      return rs2.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      if(rs2 != null) {
        try {
          rs2.close();
          pstmt2.close();
        } catch (SQLException e) {}
      }
    }
    return 0;
  }

  // 입교시작일만을 걸러서 시작날짜만 가져간다.
  public ArrayList<String> sdateSearch() {
    ArrayList<String> sdateArr = new ArrayList<String>();
    try {
      sql = "select sdate from survey group by sdate order by sdate desc";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        sdateArr.add(rs.getString("sdate"));
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return sdateArr;
  }

  // mid 조회

  
  
  
  // 설문지에 답변하기위해서, survey테이블의 설문항목을 가져간다.
  public SurveyVo svAnswerInput(int idx) {
    try {
      sql = "select * from survey where idx = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        sVo = new SurveyVo();
        sVo.setIdx(rs.getInt("idx"));
        sVo.setSdate(rs.getString("sdate"));
        sVo.setKwajung(rs.getString("kwajung"));
        sVo.setKwamok(rs.getString("kwamok"));
        sVo.setKcode(rs.getString("kcode"));
        sVo.setDanwi(rs.getString("danwi"));
        sVo.setWdate(rs.getString("wdate"));
        sVo.setQuestion1(rs.getString("question1"));
        sVo.setQuestion2(rs.getString("question2"));
        sVo.setQuestion3(rs.getString("question3"));
        sVo.setQuestion4(rs.getString("question4"));
        sVo.setQuestion5(rs.getString("question5"));
        sVo.setQuestion6(rs.getString("question6"));
        sVo.setQuestion7(rs.getString("question7"));
        sVo.setQuestion8(rs.getString("question8"));
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return sVo;
  }

  // 설문 참여후 설문내역 DB에 저장하기
  public int svAnswerInputOk(HttpServletRequest request, HttpServletResponse response) {
    try {
      sql = "insert into survey_answer values (default,?,?,?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, Integer.parseInt(request.getParameter("survey_idx")));
      pstmt.setInt(2, Integer.parseInt(request.getParameter("answer1")));
      pstmt.setInt(3, Integer.parseInt(request.getParameter("answer2")));
      pstmt.setInt(4, Integer.parseInt(request.getParameter("answer3")));
      pstmt.setInt(5, Integer.parseInt(request.getParameter("answer4")));
      pstmt.setInt(6, Integer.parseInt(request.getParameter("answer5")));
      pstmt.setInt(7, Integer.parseInt(request.getParameter("answer6")));
      pstmt.setInt(8, Integer.parseInt(request.getParameter("answer7")));
      pstmt.setString(9, request.getParameter("answer8"));
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }

  // 설문지 통계구하기
  public SurveyAnswerVo svResult(int survey_idx) {
    saVo = new SurveyAnswerVo();
    String[] question = new String[7];  // 설문 제목 1~7까지를 저장하는 배열
    
    saVo.setAnswerCnt(answerCnt(survey_idx));  // 설문에 참여한 인원수 구하기 
    
    try {
      sql = "select * from survey where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      rs.next();
      
      // 설문지의 주제별 항목들을 저장하는공간
      saVo.setSurvey_idx(rs.getInt("idx"));
      saVo.setSdate(rs.getString("sdate"));
      saVo.setKwajung(rs.getString("kwajung"));
      saVo.setKwamok(rs.getString("kwamok"));
      saVo.setKcode(rs.getString("kcode"));
      saVo.setDanwi(rs.getString("danwi"));
      saVo.setWdate(rs.getString("wdate"));
      
      // 설문지의 질문제목을 저장하는 공간
      question[0] = rs.getString("question1");
      question[1] = rs.getString("question2");
      question[2] = rs.getString("question3");
      question[3] = rs.getString("question4");
      question[4] = rs.getString("question5");
      question[5] = rs.getString("question6");
      question[6] = rs.getString("question7");
      saVo.setQuestion(question);
      saVo.setQuestion8(rs.getString("question8"));
      
      // 설문에 참여한 사람들의 결과를 계산처리하는 메소드 호출
      saVo.setSurveyAnswer(resultCalc(survey_idx));  // 현재 설문지의 통계 계산 메소드 호출
      
      saVo.setStrAnswer8(resultAnswer8(survey_idx));  // Question8항목에 대한 내역만 누적시켜서 가져오기
      
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return saVo;
  }

  // 설문지의 8번 질문항목에 대한 답변글만 누적해서 가져오기 
  private String resultAnswer8(int survey_idx) {
    String answer8 = "";
    try {
      sql = "select answer8 from survey_answer where survey_idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        if(rs.getString(1) != null && !rs.getString(1).equals("")) {
          //answer8 += "- " + rs.getString(1) + "\n";
          answer8 += rs.getString(1) + "<br/>";
        }
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return answer8;
  }

  // 7행5열(답변항목)의 투표된 개수를 가져오기 위한 처리루틴
  private int[][] resultCalc(int survey_idx) {
    int[][] surveyAnswer = new int[7][5];
    try {
      String strAnswer = "";
      for(int i=0; i<surveyAnswer.length ; i++) {
        for(int j=0; j<surveyAnswer[i].length ; j++) {
          strAnswer = "answer" + (i+1);
          sql = "select count(*) from survey_answer where survey_idx = ? and "+strAnswer+"= ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, survey_idx);
          pstmt.setInt(2, (5-j));
          rs = pstmt.executeQuery();
          rs.next();
          surveyAnswer[i][j] = rs.getInt(1);
        }
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return surveyAnswer;
  }

  // 설문문항지 수정하기
  public int svUpdateOk(HttpServletRequest request, HttpServletResponse response) {
    try {
      sql = "update survey set kwamok=?,kcode=?,danwi=?,wdate=?,question1=?,question2=?,question3=?,question4=?,question5=?,question6=?,question7=?,question8=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("kwamok"));
      pstmt.setString(2, request.getParameter("kcode"));
      pstmt.setString(3, request.getParameter("danwi"));
      pstmt.setString(4, request.getParameter("wdate"));
      pstmt.setString(5, request.getParameter("question1"));
      pstmt.setString(6, request.getParameter("question2"));
      pstmt.setString(7, request.getParameter("question3"));
      pstmt.setString(8, request.getParameter("question4"));
      pstmt.setString(9, request.getParameter("question5"));
      pstmt.setString(10, request.getParameter("question6"));
      pstmt.setString(11, request.getParameter("question7"));
      pstmt.setString(12, request.getParameter("question8"));
      pstmt.setInt(13, Integer.parseInt(request.getParameter("idx")));
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }

  // 설문 문항지 삭제처리
  public int svDelete(int idx) {
    try {
      sql = "select * from survey_answer where survey_idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if(rs.next()) return 0;
      getConn.rsClose();
      
      sql = "delete from survey where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    
    return 0;
  }

  // 관리자에서 개별 답변 항목지 보기
  public SurveyAnswerVo savList(int survey_idx, int curNo) {
    saVo = new SurveyAnswerVo();
    
    try {
      int answerCnt = answerCnt(survey_idx);
      saVo.setAnswerCnt(answerCnt);  // 설문에 참여한 총 인원수 구해서 vo에 담아준다.
      
      sql = "select * from survey where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      rs.next();
      
      //saVo.setIdx(rs.getInt("idx"));
      //saVo.setSurvey_idx(rs.getInt("survey_idx"));
      saVo.setSdate(rs.getString("sdate"));
      saVo.setKwajung(rs.getString("kwajung"));
      saVo.setKwamok(rs.getString("kwamok"));
      saVo.setKcode(rs.getString("kcode"));
      saVo.setDanwi(rs.getString("danwi"));
      saVo.setWdate(rs.getString("wdate"));
      saVo.setQuestion1(rs.getString("question1"));
      saVo.setQuestion2(rs.getString("question2"));
      saVo.setQuestion3(rs.getString("question3"));
      saVo.setQuestion4(rs.getString("question4"));
      saVo.setQuestion5(rs.getString("question5"));
      saVo.setQuestion6(rs.getString("question6"));
      saVo.setQuestion7(rs.getString("question7"));
      saVo.setQuestion8(rs.getString("question8"));
      
      if(pstmt != null) pstmt.close();
      
      sql = "select * from survey_answer where survey_idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      
      for(int i=1; i<=curNo; i++) {
        rs.next();
      }
      
      saVo.setIdx(rs.getInt("idx"));
      saVo.setSurvey_idx(rs.getInt("survey_idx"));
      
      saVo.setAnswer1(rs.getInt("answer1"));
      saVo.setAnswer2(rs.getInt("answer2"));
      saVo.setAnswer3(rs.getInt("answer3"));
      saVo.setAnswer4(rs.getInt("answer4"));
      saVo.setAnswer5(rs.getInt("answer5"));
      saVo.setAnswer6(rs.getInt("answer6"));
      saVo.setAnswer7(rs.getInt("answer7"));
      saVo.setAnswer8(rs.getString("answer8"));
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return saVo;
  }

  // 설문지 답변항목 삭제하기
  public void svAnwerDelete(int idx) {
    try {
      sql = "delete from survey_answer where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
  }

  // 설문에 대답한 모든 건수에 대한 출력을 위한 '전제 답변문항' 가져오기
  public List<SurveyAnswerVo> svAnswerTotalPrint(int survey_idx) {
    List<SurveyAnswerVo> vos = new ArrayList<SurveyAnswerVo>();
    
    try {
      int answerCnt = answerCnt(survey_idx);
      
      sql = "select * from survey where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      rs.next();
      
      String kwajung = rs.getString("kwajung");
      String kwamok = rs.getString("kwamok");
      String kcode =rs.getString("kcode");
      String danwi= rs.getString("danwi");
      String wdate =rs.getString("wdate");
      String question1 = rs.getString("question1");
      String question2 = rs.getString("question2");
      String question3 = rs.getString("question3");
      String question4 = rs.getString("question4");
      String question5 = rs.getString("question5");
      String question6 = rs.getString("question6");
      String question7 = rs.getString("question7");
      String question8 = rs.getString("question8");
      
      if(pstmt != null) pstmt.close();
      
      // 설문주제에 대한 각 답변항목들을 모두 담아오는 루틴
      sql = "select * from survey_answer where survey_idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, survey_idx);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        saVo = new SurveyAnswerVo();
        saVo.setIdx(rs.getInt("idx"));
        saVo.setSurvey_idx(rs.getInt("survey_idx"));
        
        saVo.setKwajung(kwajung);
        saVo.setKwamok(kwamok);
        saVo.setKcode(kcode);
        saVo.setDanwi(danwi);
        saVo.setQuestion1(question1);
        saVo.setQuestion2(question2);
        saVo.setQuestion3(question3);
        saVo.setQuestion4(question4);
        saVo.setQuestion5(question5);
        saVo.setQuestion6(question6);
        saVo.setQuestion7(question7);
        saVo.setQuestion8(question8);
        
        saVo.setWdate(wdate);
        
        saVo.setAnswer1(rs.getInt("answer1"));
        saVo.setAnswer2(rs.getInt("answer2"));
        saVo.setAnswer3(rs.getInt("answer3"));
        saVo.setAnswer4(rs.getInt("answer4"));
        saVo.setAnswer5(rs.getInt("answer5"));
        saVo.setAnswer6(rs.getInt("answer6"));
        saVo.setAnswer7(rs.getInt("answer7"));
        saVo.setAnswer8(rs.getString("answer8"));
        
        saVo.setAnswerCnt(answerCnt);  // 설문에 참여한 총 인원수 구해서 vo에 담아준다.
        
        vos.add(saVo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vos;
  }

  public int svCheckInput(int idx, String mid) {
    try { 
          sql = "select * from survey_check where survey_idx = ? and mid = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, idx);
          pstmt.setString(2, mid);
          rs = pstmt.executeQuery();
       
          if(rs.next()) {
            return 0;
        }
     } catch (SQLException e) {
       System.out.println("SQL 에러 : " + e.getMessage());
       e.printStackTrace();
     }  finally {
       getConn.rsClose();
     }
    return 1;
  }

  public int svCheckInputOk(HttpServletRequest request, HttpServletResponse response) {
    try {
      sql = "insert into survey_check values (default,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, Integer.parseInt(request.getParameter("survey_idx")));
      pstmt.setString(2, request.getParameter("mid"));
      pstmt.executeUpdate();
      return 1;
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.pstmtClose();
    }
    return 0;
  }



 
}