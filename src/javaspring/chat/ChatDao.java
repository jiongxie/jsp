package javaspring.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import javaspring.pds.PdsVo;

public class ChatDao {
  GetConn getConn = GetConn.getInstance();
  private Connection conn = getConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  
  private String sql = "";
  
  ChatVo vo = null;

  // 채팅내용을 저장하는 메소드
  public int chatInput(String name, String content, String avatar) {
    try {
      sql = "insert into chat values (default, ?, ?, default, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, name);
      pstmt.setString(2, content);
      pstmt.setString(3, avatar);
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

  // 최근에 올라온 메세지중 10건만 출력(담기)하기
  public List<ChatVo> chatList(int su) {
    List<ChatVo> vos = new ArrayList<ChatVo>();
    try {
      sql = "select * from chat where idx > (select max(idx) - ? from chat) order by idx";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, su);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        vo = new ChatVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setNickname(rs.getString("nickname"));
        vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>"));
        // 날짜처리
        vo.setCdate(rs.getString("cdate"));
        vo.setAvatar(rs.getString("avatar"));
        
        vos.add(vo);
      }
      System.out.println("dao: vos " + vos);
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vos;
  }

  // 마지막 이후자료 건수 출력(담기)
  public List<ChatVo> chatList(String su) {
    List<ChatVo> vos = new ArrayList<ChatVo>();
    try {
      sql = "select * from chat where idx > ? order by idx";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, Integer.parseInt(su));
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        vo = new ChatVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setNickname(rs.getString("nickname"));
        vo.setContent(rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>"));
        
        // 날짜처리  // 시간을 오전/오후로 분리
        int cdate = Integer.parseInt(rs.getString("cdate").substring(11,13));
        String timeType = "오전";
        if(Integer.parseInt(rs.getString("cdate").substring(11,13))>=12) {
          timeType = "오후";
          cdate = cdate - 12;
        }
        vo.setCdate(rs.getString("cdate").substring(0,11)+" "+timeType+" "+cdate+":"+rs.getString("cdate").substring(14,16)+" ");
        
        //vo.setCdate(rs.getString("cdate"));
        vo.setAvatar(rs.getString("avatar"));
        
        vos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 에러 : " + e.getMessage());
      e.printStackTrace();
    } finally {
      getConn.rsClose();
    }
    return vos;
  }

}
