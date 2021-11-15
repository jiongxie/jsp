package javaspring.survey;

public class SurveyCheckVo {
  private int idx;
  private String survey_idx;
  private String mid;
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getSurvey_idx() {
    return survey_idx;
  }
  public void setSurvey_idx(String survey_idx) {
    this.survey_idx = survey_idx;
  }
  public String getMid() {
    return mid;
  }
  public void setMid(String mid) {
    this.mid = mid;
  }
  @Override
  public String toString() {
    return "SurveyCheckVo [idx=" + idx + ", survey_idx=" + survey_idx + ", mid=" + mid + "]";
  }
  
  
  
  
}
