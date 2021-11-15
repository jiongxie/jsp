package conn;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class JavaspringProc {
  // 현재(오늘)날짜와 DB의 날짜와의 시간 차이를 구하는 메소드
  public int timeDiff(String wCdate) {
    int res = 0;
    
    // 오늘 날짜를 문자단위로 추출(년월일시분)
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
    String strToday = sdf.format(cal.getTime()); // 오늘날짜를 밀리초 단위로 가져와서 문자형식으로 저장
    
    // 문자형식의 오늘날짜를 다시 날짜형식으로 변환(날짜타입의 자료에 parse와결합하면 날짜형식으로 변경됨)
    Date today = null;
    try {
      today = sdf.parse(strToday);
    } catch (ParseException e) {
      e.printStackTrace();
    }
    
    // 처음에 입력받았던(DB에서 가져온) 문자형식의 날짜인 wCdate를 '년월일시분' 으로 추출
    // 0         1         2
    // 012345678901234567890
    // 2020-12-04 13:54:25.0
    String strWCdate = wCdate.substring(0,4)+wCdate.substring(5,7)+wCdate.substring(8,10)+wCdate.substring(11,13)+wCdate.substring(14,16);
    // 문자형식의 날짜인 strWCdat를 앞의 오늘날짜와 비교하기위해서 다시 날짜형식으로 변환한다.
    Date dateWdate = null;
    try {
      dateWdate = sdf.parse(strWCdate);
    } catch (ParseException e) {
      e.printStackTrace();
    }
    
    // 날짜형식으로 변경시켜놓은 두자료(today, dateWdate)를 숫자형식(getTime)으로 비교한다.[오늘날짜(today)-글쓴날짜(dateWdate) 의 결과를 시간으로 반환할 준비...]
    long diffTime = (today.getTime() - dateWdate.getTime()) / (60 * 60 * 1000); // 시간으로 변환함
    res = (int) diffTime;
    
    return res;
  }
}
