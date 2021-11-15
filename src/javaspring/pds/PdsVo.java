package javaspring.pds;

public class PdsVo {
  private int idx;
  private String mid;
  private String nickname;
  private String fname;
  private String rfname;
  private String title;
  private String part;
  private String pwd;
  private String fdate;
  private String fsize;
  private int downnum;
  private String opensw;
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
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getFname() {
    return fname;
  }
  public void setFname(String fname) {
    this.fname = fname;
  }
  public String getRfname() {
    return rfname;
  }
  public void setRfname(String rfname) {
    this.rfname = rfname;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getPart() {
    return part;
  }
  public void setPart(String part) {
    this.part = part;
  }
  public String getPwd() {
    return pwd;
  }
  public void setPwd(String pwd) {
    this.pwd = pwd;
  }
  public String getFdate() {
    return fdate;
  }
  public void setFdate(String fdate) {
    this.fdate = fdate;
  }
  public String getFsize() {
    return fsize;
  }
  public void setFsize(String fsize) {
    this.fsize = fsize;
  }
  public int getDownnum() {
    return downnum;
  }
  public void setDownnum(int downnum) {
    this.downnum = downnum;
  }
  public String getOpensw() {
    return opensw;
  }
  public void setOpensw(String opensw) {
    this.opensw = opensw;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  @Override
  public String toString() {
    return "PdsVo [idx=" + idx + ", mid=" + mid + ", nickname=" + nickname + ", fname=" + fname + ", rfname=" + rfname
        + ", title=" + title + ", part=" + part + ", pwd=" + pwd + ", fdate=" + fdate + ", fsize=" + fsize
        + ", downnum=" + downnum + ", opensw=" + opensw + ", content=" + content + "]";
  }
}
