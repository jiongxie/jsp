package javaspring.chat;

public class ChatVo {
  private int idx;
  private String nickname;
  private String content;
  private String cdate;
  private String avatar;
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getCdate() {
    return cdate;
  }
  public void setCdate(String cdate) {
    this.cdate = cdate;
  }
  public String getAvatar() {
    return avatar;
  }
  public void setAvatar(String avatar) {
    this.avatar = avatar;
  }
  @Override
  public String toString() {
    return "ChatVo [idx=" + idx + ", nickname=" + nickname + ", content=" + content + ", cdate=" + cdate + ", avatar="
        + avatar + "]";
  }
}
