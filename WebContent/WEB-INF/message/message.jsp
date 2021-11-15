<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String msg = (String) request.getAttribute("msg");
  String url = (String) request.getAttribute("url");
  String val = request.getAttribute("val")==null ? "" : (String) request.getAttribute("val");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <script>
    var msg = "<%=msg%>";
    var url = "<%=url%>";
    var val = "<%=val%>";  /* 예: 회원 아이디와 같은 매개변수를 받기위한 변수 */
    
    if(msg == "idCheckNo") {
    	msg = "이미 사용중인 아이디 입니다.";
    }
    else if(msg == "nickCheckNo") {
    	msg = "이미 사용중인 닉네임 입니다.";
    }
    else if(msg == "mInputOk") {
    	msg = "회원 가입이 완료되었습니다.";
    }
    else if(msg == "mInputNo") {
    	msg = "회원 가입실패!!!! 다시 가입하세요...";
    }
    else if(msg == "levelCheckOk") {
    	msg = "등급이 변경되었습니다.";
    }
    else if(msg == "mUpdateOk") {
    	msg = "회원 정보가 변경되었습니다.";
    }
    else if(msg == "mDeleteOk") {
    	msg = "탈퇴 처리 되었습니다.\n1개월간 같은 아이디로 재가입하실 수 없습니다.";
    }
    else if(msg == "mDeleteNo") {
    	msg = "탈퇴처리 되지 않았습니다.";
    }
    else if(msg == "mResetOk") {
    	msg = "회원 자료가 삭제처리 되었습니다.";
    }
    else if(msg == "mResetNo") {
    	msg = "회원 자료가 삭제되지 않았습니다.";
    }
    else if(msg == "bInputOk") {
    	msg = "게시글이 입력되었습니다.";
    }
    else if(msg == "bInputNo") {
    	msg = "게시글이 입력되지 않았습니다.";
    }
    else if(msg == "boardDeleteOk") {
    	msg = "게시글이 삭제 되었습니다.";
    }
    else if(msg == "boardDeleteNo") {
    	msg = "게시글이 삭제 되지 안았습니다.";
    }
    else if(msg == "passCheckNo") {
    	msg = "비밀번호를 확인하세요!";
    }
    else if(msg == "bUpdateOk") {
    	msg = "게시글이 수정되었습니다.";
    }
    else if(msg == "bUpdateNo") {
    	msg = "게시글이 수정오류!! 확인하세요.";
    }
    else if(msg == "bContInputOk") {
    	msg = "댓글이 입력되었습니다.";
    }
    else if(msg == "pPwdCheckNo") {
    	msg = "비밀번호를 체크하세요~~~";
    }
    else if(msg == "pPwdCheckOk") {
    	msg = "비밀번호 확인 Ok!!!";
    }
    else if(msg == "pDeleteOk") {
    	msg = "자료파일 삭제완료!!!";
    }
    else if(msg == "pUpdateOk") {
    	msg = "자료파일 수정완료!!!";
    }
    else if(msg == "pUpdateNo") {
    	msg = "자료파일 수정실패!!!";
    }
    else if(msg == "pdsDeleteFinalOk") {
    	msg = "자료파일이 삭제 되었습니다.!!!";
    }
    else if(msg == "svInputOk") {
    	msg = "설문지가 등록 되었습니다.!!!";
    }
    else if(msg == "svInputNo") {
    	msg = "설문지 등록 실패~~~";
    }
    else if(msg == "svAnswerInputOk") {
    	msg = "설문에 참여 하셨습니다.";
    }
    else if(msg == "svAnswerInputNo") {
    	msg = "설문에 참여되지 않았습니다.";
    }
    else if(msg == "svUpdateOk") {
    	msg = "설문지 내용이 수정되었습니다.";
    }
    else if(msg == "svUpdateNo") {
    	msg = "설문지 내용이 수정실패~~~";
    }
    else if(msg == "svDeleteOk") {
    	msg = "설문지 내용 삭제!!!";
    }
    else if(msg == "svDeleteNo") {
    	msg = "해당 설문지에 참가한 설문이 있기에 삭제하실수 없습니다.";
    }
    else if(msg == "svAnswerDeleteOk") {
    	msg = "해당 설문지의 현재 답변항목이 삭제되었습니다.";
    }
    else if(msg == "sCheduleOk") {
    	msg = "일정처리가 완료되었습니다.";
    }
    else if(msg == "sCheduleNo") {
    	msg = "일정처리 실패~~";
    }
    else if(msg == "svSearchInputNo") {
    	msg = "중복참여불가";
    }
    else if(msg == "svSearchInputOk") {
    	msg = "설문지참여";
    }
    
    
    
    
    

    // 아래는 매개변수를 포함한 메세지 처리
    else if(msg == "loginOk") {
    	msg = val + " 회원님! 로그인 되었습니다.";
    }
    else if(msg == "loginNo") {
    	msg = val + " 로그인 실패";
    }
    else if(msg == "loginOutOk") {
    	msg = val + " 회원님! 정상 로그아웃 되었습니다.";
    }
    else if(msg == "upLoadOk") {
    	msg = val + "파일이 정상적으로 업로드 되었습니다.";
    }
    else if(msg == "upLoadNo") {
    	msg = val + "파일이 업로드 실패~~~";
    }
    else if(msg == "fileDeleteOk") {
    	msg = val + "선택한 파일이 삭제되었습니다.";
    }
    else if(msg == "fileDeleteNo") {
    	msg = val + "파일 삭제 실패~~";
    }
    else if(msg == "pInputOk") {
    	msg = val + "자료실에 파일이 업로드 되었습니다.";
    }
    else if(msg == "pInputNo") {
    	msg = val + "파일 업로드 실패!!!";
    }
    else if(msg == "pDownLoadOk") {
    	msg = val + "다운로드 성공!!!";
    }
    else if(msg == "mMoneyOk") {
    	msg = val + "체결 성공!!!";
    }
    else if(msg == "mMoneyNo") {
    	msg = val + "체결 실패]!!!";
    }
    
    alert(msg);
    if(url != "") location.href = url;
  </script>
</head>
<body>

</body>
</html>