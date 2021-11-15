package javaspring.pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PDownLoadCommand implements PdsCommand {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    PdsDao dao = new PdsDao();
    PdsVo vo = dao.pContent(idx);
    
    
    String[] rfNames = vo.getRfname().split("/");  //서버에 저장된 파일명을 모두 '/'로 분리시켜 rfNames배열에 저장
    String[] fNames = vo.getFname().split("/");    //원본파일명을 모두 '/'로 분리시켜 fNames배열에 저장
    
    FileInputStream fis = null;
    ServletOutputStream sos = null;

    // 실제파일이 저장되어 있는 경로 설정
    ServletContext application = request.getServletContext();
    String directory = application.getRealPath("/data/pds/");
    
    // 압축에 필요한 작성설정
    String zipPath = directory + "/temp/";   // 파일을 이동복사시켜 압축할 폴더명 설정
    String zipName = vo.getTitle() + ".zip"; // 기존파일들을 압축하여 저장시켜줄 파일명을 설정 
    
    byte[] buffer = new byte[1024 * 2];
    
    FileInputStream fin = null;
    ZipOutputStream zout = new ZipOutputStream(new FileOutputStream(zipPath + zipName)); // 압축시킬 출력스트림 생성
    
    // 작업자료중에서 중복된이름을 가진 파일이 있을경우는 이름을 변경(숫자덛붙임)하여 압축 저장할 수 있게한다)
    for(int i=0; i<fNames.length; i++) { // '10.jpg/10.jpg/10.jpg'  ==>>> 10.jpg / 10(1).jpg / 10(2).jpg
      for(int j=0; j<i; j++) {
        if(fNames[i].equals(fNames[j])) {
          fNames[i] = fNames[i].substring(0,fNames[i].lastIndexOf(".")) + "("+i+")" + fNames[i].substring(fNames[i].length()-4);
          break;
        }
      }
    }
    
    /*
    int fileNo = 0;
    for(int i=0; i<fNames.length; i++) {
      for(int j=i + 1; j<fNames.length; j++) {
        if(fNames[i].equals(fNames[j])) {
          fNames[j] = fNames[j].substring(0,fNames[j].lastIndexOf(".")) + "(" + (++fileNo) + ")" + fNames[j].substring(fNames[j].lastIndexOf("."));
        }
      }
    }
    */
    /*
    System.out.println("--------------------");
    for(int i=0; i<fNames.length; i++) {
      System.out.println("fNames[] : " + fNames[i]);
    }
    System.out.println("--------------------");
    */
    
    for(int i=0; i<rfNames.length; i++) {
      
      File file = new File(directory + rfNames[i]); // 각각의 파일에 대하여 File객체 생성
      File moveAndRename = new File(directory + "temp\\" + fNames[i]); // 다운로드를 위한 임시폴더에 위치하게될 파일들에 대한 객체를 생성(이때 원본이름으로 다운받아야 하기에, 업로드 했던 이름으로 생성시켜두어야 한다.)
      
      file.renameTo(moveAndRename);  // 서버에 저장된 파일이 업로드 되었던 파일로 이름이 바뀌면서 'temp'폴더에 저장된다.
      
      fis = new FileInputStream(moveAndRename);   // 새로 'temp'에 저장된 파일이 FileInputStream객체가 된다.
      zout.putNextEntry(new ZipEntry(fNames[i])); // 조금전 업로드시의 이름변경으로 저장했던 파일을 zout객체에 출력준비를 위한 객체를 생성시켜준다.
      
      // 아래는 준비된 fis를 zout로 출력(압축/저장)시켜준다.
      int data;
      while((data = fis.read(buffer,0,buffer.length)) != -1) {
        zout.write(buffer,0,data);   // 버퍼의 크기(2048)만큼씩 읽어서 zout에 저장한다.
      }
      zout.closeEntry(); // 한개의 파일에 대한 압축작업이 끝났으면 zout객체중 개별작업에 대한 객체를 닫는다.
      fis.close();
      
      moveAndRename.renameTo(file); // 한개 처리된 압축파일은 서버의 임시폴더에 있기에 원래이름으로 다시 돌려주면서 한개파일의 작업이 마무리 된다.
    }  // 같은 작업을 모든파일에 반복 수행시켜준다.
    zout.close();  // 작업을 마친후 zout객체를 닫는다.
    
    // 앞의 작업을 마치게되면 개별파일들이 압축파일로 저장되게 된다. 아래는 다시 '1개로 압축된 파일'을 다운받을 수 있도록 처리한다.
    
    String downLoadName = null;  // 압축된 파일을 실제로 다운로드 받을 파일명.
    
    String mimeType = application.getMimeType(zipName.toString());
    if(mimeType == null) {
      response.setContentType("application/octet-strean");  // 2진 바이너리파일로 전송하겠다는것
    }
      
    if(request.getHeader("user-agent").indexOf("MSIE") == -1) {  // 사용자 브라우저가 익스플로러가 아니라면
      downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
    }
    else {  // 사용자 브라우저가 익스플로러라면...
      downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
    }
      
    // 다운로드할 파일명과 형식을 헤더파일에 담아서 전송시킨다.
    response.setHeader("Content-Disposition", "attachment;filename=" + downLoadName);
      
    // 실제로 파일 업(다운)로드를 하기위한 FileInputStream/FileOutputStream 객체를 생성한다.
    fis = new FileInputStream(directory + "/temp/" + zipName);  // 전송파일(file)을 FileInputStream객체를 생성해서 담은후...
    sos = response.getOutputStream(); // ServletOutputStream객체를 생성해서 클라이언트로 전송한다.
      
    // 아래는 실제로 파일을 전송처리한다.
    byte[] b = new byte[2048];  // 실제로 한번에 전송할 파일크기를 2048byte로 한다는것.
    int data = 0;
      
    while((data = fis.read(b, 0, b.length)) != -1) {
      sos.write(b, 0, data);  // 실제로 2048byte씩 클라이언트로 파일을 전송한다. 
    }
    sos.flush();  // data변수에 2048byte미만으로 남아있는 자료를 모두다 보낸다.
    
    sos.close();
    fis.close();
    
    new File(directory + "temp\\" + zipName).delete();  // 작업후 temp폴터의 압축파일은 삭제한다.
    
  }
}
