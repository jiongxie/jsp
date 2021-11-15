package javaspring.survey;

import java.util.Arrays;

public class SurveyAnswerVo {
  private int idx;
  private int survey_idx;
  private int answer1;
  private int answer2;
  private int answer3;
  private int answer4;
  private int answer5;
  private int answer6;
  private int answer7;
  private String answer8;
  private String mid;
  
  private int answerCnt;     // 설문에 참여한 총 인원수 저장필드
  private String[] question; // 설문통계에서 질문항목(1~7)을 배열에 담기위한 저장필드
  private String question8;  // 8번의 질문항목을 담기위한 필드
  
  private int[][] surveyAnswer; // 설문지에대한 답변항목의 인원수를 누적시켜 저장시키기위한 2차원배열
  private String strAnswer8; // 8번 설문에 해당하는 답변을 담기위한 필드
  
  // 설문지 결과에 설문주제와 질문내용등을 담아놓기위한 필드
  private String sdate;
  private String kwajung;
  private String kwamok;
  private String kcode;
  private String danwi;
  private String wdate;
  
  // 관리자가 개별 설문결과를 보기위해 설문 문항지를 가져올때 사용함.
  private String question1;
  private String question2;
  private String question3;
  private String question4;
  private String question5;
  private String question6;
  private String question7;
  
  private int curNo; // 관리자가  개별 자료 검색시에 현재 위치를 저장시켜주는 필드

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getSurvey_idx() {
    return survey_idx;
  }

  public void setSurvey_idx(int survey_idx) {
    this.survey_idx = survey_idx;
  }

  public int getAnswer1() {
    return answer1;
  }

  public void setAnswer1(int answer1) {
    this.answer1 = answer1;
  }

  public int getAnswer2() {
    return answer2;
  }

  public void setAnswer2(int answer2) {
    this.answer2 = answer2;
  }

  public int getAnswer3() {
    return answer3;
  }

  public void setAnswer3(int answer3) {
    this.answer3 = answer3;
  }

  public int getAnswer4() {
    return answer4;
  }

  public void setAnswer4(int answer4) {
    this.answer4 = answer4;
  }

  public int getAnswer5() {
    return answer5;
  }

  public void setAnswer5(int answer5) {
    this.answer5 = answer5;
  }

  public int getAnswer6() {
    return answer6;
  }

  public void setAnswer6(int answer6) {
    this.answer6 = answer6;
  }

  public int getAnswer7() {
    return answer7;
  }

  public void setAnswer7(int answer7) {
    this.answer7 = answer7;
  }

  public String getAnswer8() {
    return answer8;
  }

  public void setAnswer8(String answer8) {
    this.answer8 = answer8;
  }

  public String getMid() {
    return mid;
  }

  public void setMid(String mid) {
    this.mid = mid;
  }

  public int getAnswerCnt() {
    return answerCnt;
  }

  public void setAnswerCnt(int answerCnt) {
    this.answerCnt = answerCnt;
  }

  public String[] getQuestion() {
    return question;
  }

  public void setQuestion(String[] question) {
    this.question = question;
  }

  public String getQuestion8() {
    return question8;
  }

  public void setQuestion8(String question8) {
    this.question8 = question8;
  }

  public int[][] getSurveyAnswer() {
    return surveyAnswer;
  }

  public void setSurveyAnswer(int[][] surveyAnswer) {
    this.surveyAnswer = surveyAnswer;
  }

  public String getStrAnswer8() {
    return strAnswer8;
  }

  public void setStrAnswer8(String strAnswer8) {
    this.strAnswer8 = strAnswer8;
  }

  public String getSdate() {
    return sdate;
  }

  public void setSdate(String sdate) {
    this.sdate = sdate;
  }

  public String getKwajung() {
    return kwajung;
  }

  public void setKwajung(String kwajung) {
    this.kwajung = kwajung;
  }

  public String getKwamok() {
    return kwamok;
  }

  public void setKwamok(String kwamok) {
    this.kwamok = kwamok;
  }

  public String getKcode() {
    return kcode;
  }

  public void setKcode(String kcode) {
    this.kcode = kcode;
  }

  public String getDanwi() {
    return danwi;
  }

  public void setDanwi(String danwi) {
    this.danwi = danwi;
  }

  public String getWdate() {
    return wdate;
  }

  public void setWdate(String wdate) {
    this.wdate = wdate;
  }

  public String getQuestion1() {
    return question1;
  }

  public void setQuestion1(String question1) {
    this.question1 = question1;
  }

  public String getQuestion2() {
    return question2;
  }

  public void setQuestion2(String question2) {
    this.question2 = question2;
  }

  public String getQuestion3() {
    return question3;
  }

  public void setQuestion3(String question3) {
    this.question3 = question3;
  }

  public String getQuestion4() {
    return question4;
  }

  public void setQuestion4(String question4) {
    this.question4 = question4;
  }

  public String getQuestion5() {
    return question5;
  }

  public void setQuestion5(String question5) {
    this.question5 = question5;
  }

  public String getQuestion6() {
    return question6;
  }

  public void setQuestion6(String question6) {
    this.question6 = question6;
  }

  public String getQuestion7() {
    return question7;
  }

  public void setQuestion7(String question7) {
    this.question7 = question7;
  }

  public int getCurNo() {
    return curNo;
  }

  public void setCurNo(int curNo) {
    this.curNo = curNo;
  }

  @Override
  public String toString() {
    return "SurveyAnswerVo [idx=" + idx + ", survey_idx=" + survey_idx + ", answer1=" + answer1 + ", answer2=" + answer2
        + ", answer3=" + answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", answer6=" + answer6
        + ", answer7=" + answer7 + ", answer8=" + answer8 + ", mid=" + mid + ", answerCnt=" + answerCnt + ", question="
        + Arrays.toString(question) + ", question8=" + question8 + ", surveyAnswer=" + Arrays.toString(surveyAnswer)
        + ", strAnswer8=" + strAnswer8 + ", sdate=" + sdate + ", kwajung=" + kwajung + ", kwamok=" + kwamok + ", kcode="
        + kcode + ", danwi=" + danwi + ", wdate=" + wdate + ", question1=" + question1 + ", question2=" + question2
        + ", question3=" + question3 + ", question4=" + question4 + ", question5=" + question5 + ", question6="
        + question6 + ", question7=" + question7 + ", curNo=" + curNo + "]";
  }
  
  // Getters & Setters
  
  
}