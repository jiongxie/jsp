package javaspring.schedule;

public class ScheduleVo {
  private int idx;
  private String mid;
  private String scdate;
  private String memory;
  private String title;
  private String content;
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getMid() {
    return mid;
  }
  public void setMid(String mid) {
    this.mid = mid;
  }
  public String getScdate() {
    return scdate;
  }
  public void setScdate(String scdate) {
    this.scdate = scdate;
  }
  public String getMemory() {
    return memory;
  }
  public void setMemory(String memory) {
    this.memory = memory;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  @Override
  public String toString() {
    return "ScheduleVo [idx=" + idx + ", mid=" + mid + ", scdate=" + scdate + ", memory=" + memory + ", title=" + title
        + ", content=" + content + "]";
  }
  
}
