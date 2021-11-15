package javaspring.board;

import java.util.Date;

public class BoardVo {
  private int idx;
  private String name;
  private String title;
  private String email;
  private String homepage;
  private String pwd;
  private Date wdate;
  private int readnum;
  private String hostip;
  private int good;
  private String content;
  
  private int replyCount;  // 댓글수를 세어오기위한 필드
  
  // 1일(24시간)전 자료에 'New'표시를 하기위한 필드(wCdate, wNdate)
  private String wCdate;
  private int wNdate;
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }
  public String getPwd() {
    return pwd;
  }
  public void setPwd(String pwd) {
    this.pwd = pwd;
  }
  public Date getWdate() {
    return wdate;
  }
  public void setWdate(Date wdate) {
    this.wdate = wdate;
  }
  public int getReadnum() {
    return readnum;
  }
  public void setReadnum(int readnum) {
    this.readnum = readnum;
  }
  public String getHostip() {
    return hostip;
  }
  public void setHostip(String hostip) {
    this.hostip = hostip;
  }
  public int getGood() {
    return good;
  }
  public void setGood(int good) {
    this.good = good;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getReplyCount() {
    return replyCount;
  }
  public void setReplyCount(int replyCount) {
    this.replyCount = replyCount;
  }
  public String getwCdate() {
    return wCdate;
  }
  public void setwCdate(String wCdate) {
    this.wCdate = wCdate;
  }
  public int getwNdate() {
    return wNdate;
  }
  public void setwNdate(int wNdate) {
    this.wNdate = wNdate;
  }
  @Override
  public String toString() {
    return "BoardVo [idx=" + idx + ", name=" + name + ", title=" + title + ", email=" + email + ", homepage=" + homepage
        + ", pwd=" + pwd + ", wdate=" + wdate + ", readnum=" + readnum + ", hostip=" + hostip + ", good=" + good
        + ", content=" + content + ", replyCount=" + replyCount + ", wCdate=" + wCdate + ", wNdate=" + wNdate + "]";
  }
}
