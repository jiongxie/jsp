<!-- 화면 참고 : https://www.bootdey.com/snippets/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="/include/navhome.jsp" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link href="./assets/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="./assets/favicon.ico" rel="icon">
  <title>chat.jsp(채팅화면)</title>
  <link rel="stylesheet" type="text/css" href="./css/chat.css">
  <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
  <script src="./js/bootstrap.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script>
    var lastIdx = 0; // 마지막 접속자의 채팅 메세지의 고유번호를 전역변수로 선언
    
    $(document).ready(function() {
    	chatListFunction("ten");
    	
    	getInfiniteChat();  // 주기적으로 chatting화면을 호출하기위한 함수
    });
    
    // 페이지가 로딩된후 다시 1초에 한번씩 새로운 메세지를 서버에서 읽어온다.
    function getInfiniteChat() {
    	setInterval(function() {
    		chatListFunction(lastIdx);
    	},1000);
    }
  
    // 메세지 내용을 입력하는 함수
    function submitFunction() {
    	var name = $("#name").val();
    	var content = $("#content").val();
    	var avatar = document.myform.avatar.value;
    	$.ajax({
    		url : "${contextPath}/chatInput",
    		type:"post",
    		data: {
    			name   : encodeURIComponent(name),
    			content: encodeURIComponent(content),
    			avatar : avatar
    		}
    	});
  		$("#content").val("");
  		$("#content").focus();
    }
    
    // chatList컨트롤러를 호출하여, ajax방식으로 데이터를 json형태로 가져와서 출력시켜준다.
    function chatListFunction(listType) {
    	$.ajax({
    		url : "${contextPath}/chatList",
    		type: "post",
    		data: {listType : listType},
    		success: function(data) {     // DB에서 읽어온 대화내용을 json형태로 화면에 출력한다.
    			if(data == "") return;
    			var testData =  data.replace(/\r/gi, '\\r').replace(/\n/gi, '\\n').replace(/\t/gi, '\\t').replace(/\f/gi, '\\f');
					var parsed = JSON.parse(testData);
					var res = parsed.res;     // json형식의 자료를 일반값으로 변경하기위한 '파싱'처리를 한다.
    	    for(var i=0; i<res.length; i++) {
    	    	addChar(res[i][1].value,res[i][2].value,res[i][3].value,res[i][4].value);
    	    }
    	    lastIdx = Number(parsed.last);
    		}
    	});
    }
    
    // 가져온 내용을 출력할 준비를 하는 함수
    function addChar(name, content, cdate, avatar) {
    	$("#chatList").append("<div class='row'>"
        		+ "<div class='col-lg-12'>"
        		+ "<div class='media'>"
        		+ "<a class='pull-left' href='#'>"
        		+ "<img class='media-object img-circle' src='./images/avatar"+avatar+".png' width='50px' alt=''/>"
        		+ "</a>"
        		+ "<div class='media-body'>"
        		+ "<h4 class='media-heading'>"+name
        		+ "<span class='small pull-right'>"+cdate+"&nbsp; </span></h4>"
        		+ "<p>"+content+"</p>"
        		+ "</div>"
        		+ "</div>"
        		+ "</div>"
    	+ "</div><hr/>");
    	$("#chatList").scrollTop($("#chatList")[0].scrollHeight);  // 스크롤바를 강제로 마지막에 위치한다.
    }
    
    // 엔터를 치면 전송.. Shift엔터는 다음줄로 이동
    $(function() {
			$("textarea").on("keydown", function(event) {
				if(event.keyCode == 13) {
					if(!event.shiftKey) { //shit키를 같이 치지 않으면
						event.preventDefault();
						submitFunction();
					}
				}
			});
		});
  </script>
</head>
<body onLoad="document.myform.content.focus()">
<%@ include file="/include/sCheck.jsp" %>
<br/>
<div class="container bootstrap snippet">
  <div class="row">
    <div class="col-xs-12">
      <div class="portlet portlet-default">
        <div class="portlet-heading">
          <div class="portlet-title">
            <h4><i class="fa fa-circle text-green"></i>채팅방</h4>
          </div>
          <div class="clearfix"></div>
        </div>
        <div id="chat" class="panel-collapse collapse in">
					<!-- 실제로 채팅대화 내용을 주고 받는  메세지를 출력하는 부분(아이디 : chatList) -->
          <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
          </div>
          <div class="portlet-footer">
            <form role="form" name="myform" id="myform" onSubmit="return false;">
              <div class="row">
                <div class="form-group col-xs-12">
                  <input type="text" style="height:30px;" id="name" value="${snickname}" readonly/>
                  <!-- 아바타 추가 -->
                  &nbsp;&nbsp;&nbsp;
  <%    if(level == 0) { %>
	                  <input type="radio" id="avatar" name="avatar" value="1" checked/><img src="./images/avatar1.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="2"/><img src="./images/avatar2.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="3"/><img src="./images/avatar3.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="4"/><img src="./images/avatar4.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="5"/><img src="./images/avatar5.png" width="22px" class="img-circle"/>
 <%    } else if(level == 1) { %>		
	                  <input type="radio" id="avatar" name="avatar" value="1" /><img src="./images/avatar1.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="2"/><img src="./images/avatar2.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="3" checked/><img src="./images/avatar3.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="4"/><img src="./images/avatar4.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="5"/><img src="./images/avatar5.png" width="22px" class="img-circle"/>
<%    } else if(level == 2) { %>		
	                  <input type="radio" id="avatar" name="avatar" value="1" /><img src="./images/avatar1.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="2"/><img src="./images/avatar2.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="3" /><img src="./images/avatar3.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="4"/><img src="./images/avatar4.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="5" checked/><img src="./images/avatar5.png" width="22px" class="img-circle"/>
<%    } else if(level == 3) { %>		
	                  <input type="radio" id="avatar" name="avatar" value="1" /><img src="./images/avatar1.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="2" checked/><img src="./images/avatar2.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="3" /><img src="./images/avatar3.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="4"/><img src="./images/avatar4.png" width="22px" class="img-circle"/> &nbsp;
	                  <input type="radio" id="avatar" name="avatar" value="5" /><img src="./images/avatar5.png" width="22px" class="img-circle"/>
<%    } %>		             
                </div>
              </div>
              <div class="row" style="height:90px;">
                <div class="form-group col-xs-10">
                  <textarea style="height:80px;" id="content" class="form-control" placeholder="메세지 입력..." maxlength="200"></textarea>
                </div>
                <div class="form-group col-xs-2">
                  <a href='${contextPath }/components.jsp'><button type="button" class="btn btn-default pull-right" >MyPage</button></a>
                  <button type="button" class="btn btn-default pull-right" onclick="submitFunction()">전송</button> 
                  <div class="clearfix"></div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>