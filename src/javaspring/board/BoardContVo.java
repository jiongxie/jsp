package javaspring.board;

public class BoardContVo {
  private int idx;
  private int board_idx;
  private String mid;
  private String nickname;
  private String wdate;
  private String hostip;
  private String content;
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public int getBoard_idx() {
    return board_idx;
  }
  public void setBoard_idx(int board_idx) {
    this.board_idx = board_idx;
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
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public String getHostip() {
    return hostip;
  }
  public void setHostip(String hostip) {
    this.hostip = hostip;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  @Override
  public String toString() {
    return "BoardContVo [idx=" + idx + ", board_idx=" + board_idx + ", mid=" + mid + ", nickname=" + nickname
        + ", wdate=" + wdate + ", hostip=" + hostip + ", content=" + content + "]";
  }
}
