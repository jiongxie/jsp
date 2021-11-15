<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/include/navhome.jsp" %>
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

  <title>All weather investment</title>  
 <link href="./main.a3f694c0.css" rel="stylesheet"></head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>

  </style>
</head>



<body>




<!-- Add your site or app content here -->
<div class="background-image-container white-text-container">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
            		<div class="container">
								  <form name="myform" method="post" action="<%=request.getContextPath()%>/gInputOk" class="was-validated">
								    <h5 style="color:black;">방명록 글쓰기</h5>
								    <div class="form-group">
								      <label for="name">성명 :</label>
								      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required autofocus/>
								      <!-- <div class="valid-feedback">검사</div> -->
								      <!-- <div class="invalid-feedback">성명을 입력하세요.</div> -->
								    </div>
								    <div class="form-group">
									    <label for="email">Email address:</label>
									    <input type="text" class="form-control" name="email" placeholder="이메일을 입력하세요." id="email"/>
									  </div>
								    <div class="form-group">
									    <label for="homepage">Homepage address:</label>
									    <input type="text" class="form-control" name="homepage" value="http://" placeholder="이메일을 입력하세요." id="homepage"/>
									  </div>
									  <div class="form-group">
										  <label for="content">방문소감 :</label>
										  <textarea class="form-control" rows="5" id="content" name="content" required></textarea>
										</div>
								    <button type="submit" class="btn btn-secondary">방명록 등록</button>
								    <button type="reset" class="btn btn-secondary">방명록 다시작성</button>
								    <button type="button" class="btn btn-secondary" onclick="location.href='gList.jsp';">돌아가기</button>
								    <input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
								  </form>
								</div>
                <p><br/></p>
                
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>