<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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
	<title>moneyInput.jsp</title>
	<script>
	</script>
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<style>
	/*여러단계 폼 양식 CSS 부분*/
		#regForm 
		{
		  background-color: #274555;
		  margin: 100px auto;
		  font-family: Raleway;
		  padding: 40px;
		  width: 70%;
		  min-width: 300px;
		}
		
		h1 
		{
		  text-align: center;  
		}
		
		input 
		{
		  padding: 10px;
		  width: 100%;
		  font-size: 17px;
		  font-family: Raleway;
		  border: 1px solid #aaaaaa;
		}
		
		input.invalid 
		{
		  background-color: #ff7761;
		}
		
		.tab 
		{
		  display: none;
		}
		
		button 
		{
		  background-color: #4CAF50;
		  color: #ffffff;
		  border: none;
		  padding: 10px 20px;
		  font-size: 17px;
		  font-family: Raleway;
		  cursor: pointer;
		}
		
		button:hover 
		{
		  opacity: 0.8;
		}
		
		#prevBtn 
		{
		  background-color: #E53A40;
		}
		
		.step 
		{
		  height: 15px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: #bbbbbb;
		  border: none;  
		  border-radius: 50%;
		  display: inline-block;
		  opacity: 0.5;
		}
		
		.step.active 
		{
		  opacity: 1;
		}
		
		.step.finish 
		{
		  background-color: #4CAF50;
		}
		
	/*자동완성 양식 CSS 부분*/
	.autocomplete
	{
	  position: relative;
	  display: inline-block;
	  width:70%;
	  color:blue;
	}
	
	.autocomplete-items 
	{
	  /* position: absolute; */
	  border: 1px solid #d4d4d4;
	  border-bottom: none;
	  border-top: none;
	  z-index: 99;
	  top: 100%;
	  left: 0;
	  right: 0;
	}
	
	.autocomplete-items div 
	{
	  padding: 10px;
	  cursor: pointer;
	  background-color: #fff; 
	  border-bottom: 1px solid #d4d4d4; 
	}
	
	.autocomplete-items div:hover 
	{
	  background-color: #e9e9e9; 
	}
	
	.autocomplete-active 
	{
	  background-color: DodgerBlue !important; 
	  color: #ffffff; 
	}
	</style>
</head>
<body style="background-image: url('${ctp}/image/bg10.jpg');background-size:inherit;color:white;">
<%@ include file="/include/navhome.jsp" %>
<%@ include file="/include/sCheck.jsp" %>
<link href="${contextPath }/main.a3f694c0.css" rel="stylesheet">s
	<div class="container">
		<form id="regForm" name="regForm" action="${ctp}/moneyInputOk.don">
		  <h1>${ymd}<br>[${kumak_kubun}]</h1>
		  <hr style="border: 1px dotted white;">
		  <div class="tab">
		    <p style="font-size: 2em;" align="center">&#8361;
		    	<input type="text" style="text-align: right;width:50%;" oninput="this.className = ''" id="kumak" name="kumak"  onkeyup="numberWithCommas(this.value)" autofocus>&nbsp;&nbsp;원
		    </p>
		  </div>
		  <div class="tab">
		  	<!--사용자가 주로 입력한 내역에 대해서 자동완성 기능 제공  -->
		    <div class="autocomplete">
			  	<label style="font-size:1.5em;color:#fcbe32;">내역 : </label> 
		    	<input type="text" oninput="this.className = ''" id="title" name="title" placeholder="내역을 입력하세요">
		    </div>
		    <hr>
		    <div style="text-align: left;">
			    <label style="font-size:1.5em;color:#fcbe32;">내역구분 : </label><br>
		    	<!-- <input type="text" oninput="this.className = ''" id="part" name="part" placeholder="아래 내역구분중 하나를 클릭하세요" readonly> -->
			    <c:if test="${kumak_kubun == '입금'}">
			    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart1" type="button" value="월급" onclick="kumak_kubun_click(1)">월급</button>
			    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart2" type="button" value="용돈" onclick="kumak_kubun_click(2)">용돈</button>
				    <c:set var="btnCnt" value="3"/>
				    <c:forEach var="partItem" items="${part_titleArr}">
				    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart${btnCnt}" type="button" value="${partItem}" onclick="kumak_kubun_click('${btnCnt}')">${partItem}</button>
					    <c:set var="btnCnt" value="${btnCnt=btnCnt+1}"/>
				    </c:forEach>
				    <!-- 입금에 대한 내역구분 사용자정의 추가 버튼 -->
			    	<button class="btn" style="background-color:#eb9f9f;margin-top: 5px;font-size:1.5em;" type="button" title="구분추가" data-toggle="modal" data-target="#partAdd" data-backdrop="static">추가(+)</button>
			    </c:if>
			    
			    <c:if test="${kumak_kubun == '지출'}">
			    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart1" type="button" value="식비" onclick="kumak_kubun_click(1)">식비</button>
			    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart2" type="button" value="교통비" onclick="kumak_kubun_click(2)">교통비</button>
				    <c:set var="btnCnt" value="3"/>
				    <c:forEach var="partItem" items="${part_titleArr}">
				    	<button class="btn" style="background-color:#ede574;margin-top: 5px;font-size:1.5em;" id="btnPart${btnCnt}" type="button" value="${partItem}" onclick="kumak_kubun_click('${btnCnt}')">${partItem}</button>
					    <c:set var="btnCnt" value="${btnCnt=btnCnt+1}"/>
				    </c:forEach>
				    <!-- 지출에 대한 내역구분 사용자정의 추가 버튼 -->
			    	<button class="btn" style="background-color:#eb9f9f;margin-top: 5px;font-size:1.5em;" type="button" title="구분추가" data-toggle="modal" data-target="#partAdd" data-backdrop="static">추가(+)</button>
			    </c:if>
		    </div>
		  </div>
		  
		  <c:if test="${kumak_kubun == '지출'}">
			  <div class="tab">
			    <p align="center"><button class="btb btn-danger" style="width:50%;border-radius:12px;" id="btnJichulKubun1" type="button" value="현금" onclick="jichul_kubun_click(1)">현금</button></p>
			    <p align="center"><button class="btb btn-success" style="width:50%;border-radius:12px;" id="btnJichulKubun2" type="button" value="체크카드" onclick="jichul_kubun_click(2)">체크카드</button></p>
			    <p align="center"><button class="btb btn-primary" style="width:50%;border-radius:12px;" id="btnJichulKubun3" type="button" value="신용카드" onclick="jichul_kubun_click(3)">신용카드</button></p>
			  </div>
		  </c:if>
		  <hr style="border: 1px dotted white;">
		  <div style="overflow:auto;">
		    <div style="float:right;">
		      <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
		      <button type="button" id="nextBtn" onclick="nextPrev(1)">다음</button>
		    </div>
		  </div>
		  <div style="text-align:center;margin-top:40px;">
		    <span class="step"></span>
		    <span class="step"></span>
		    <c:if test="${kumak_kubun == '지출'}">
			    <span class="step"></span>
		    </c:if>
		  </div>
		  <!-- 히든 타입 선언부 -->
		  <input type="hidden" name="mid" value="${smid}">
		  <input type="hidden" name="ymd" value="${ymd}">
		  <input type="hidden" name="kumak_kubun" value="${kumak_kubun}">
		  <input type="hidden" name="part" value="">
		  <input type="hidden" name="jichul_kubun" value="">
		</form>
	</div>
	<!-- 내역구분 사용자정의 추가 모달 시작-->
	  <!-- The Modal -->
	  <div class="modal fade" id="partAdd" style="color: black;">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header" style="background-color: #ff7761;">
	          <h4 class="modal-title">사용자정의 내역구분 [${kumak_kubun}] 추가</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
				<div class="alert alert-warning">
					<input type="text" class="form-control" id="part_title">
			  	</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-info" onclick="partAdd()">등록</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">나가기</button>
	        </div>
	    
	      </div>
	    </div>
	  </div>
	 <!-- 모달종료 -->
	<script>
		//여러단계 폼 양식 스크립트 부분
		var currentTab = 0; 
		showTab(currentTab); 
		
		function showTab(n) {
		  var x = document.getElementsByClassName("tab");
		  x[n].style.display = "block";
		  if (n == 0) {
		    document.getElementById("prevBtn").style.display = "none";
		  } else {
		    document.getElementById("prevBtn").style.display = "inline";
		  }
		  if (n == (x.length - 1)) {
		    document.getElementById("nextBtn").innerHTML = "등록";
		    document.getElementById("nextBtn").style.backgroundColor = "#30A9DE";
		  } else {
		    document.getElementById("nextBtn").innerHTML = "다음";
		    document.getElementById("nextBtn").style.backgroundColor = "";
		  }
		  fixStepIndicator(n)
		}
		
		function nextPrev(n) {
		  var x = document.getElementsByClassName("tab");
		  if (n == 1 && !validateForm()) return false;
		  x[currentTab].style.display = "none";
		  currentTab = currentTab + n;
		  var kumak_kubun = "${kumak_kubun}";
		  if (kumak_kubun == "지출" && currentTab == 2)
		  {
			  jichul_formCheck_1();
		  }
		  if (kumak_kubun == "지출" && currentTab >= x.length)
		  {
			  jichul_formCheck_2();
		  }
		  if (kumak_kubun == "입금" && currentTab >= x.length) 
		  {
			  ipkum_formCheck();
		    //document.getElementById("regForm").submit();//최종 서브밋부분
		    //return false;
		  }
		  showTab(currentTab);
		}
		
		function ipkum_formCheck()
		{
			if(regForm.part.value == "")
			{
				alert("내역구분을 체크!!하세요");
				currentTab = currentTab - 1;
			}
			else
			{
				regForm.submit();
				return false;
			}
		}
		
		function jichul_formCheck_1()
		{
			if(regForm.part.value == "")
			{
				alert("내역구분을 체크!!하세요");
				currentTab = currentTab - 1;
			}
		}
		
		function jichul_formCheck_2()
		{
			if(regForm.jichul_kubun.value == "")
			{
				alert("지출구분을 체크!!하세요");
				currentTab = currentTab - 1;
			}
			else
			{
				regForm.submit();
				return false;
			}
		}
		
		function validateForm() {
		  var x, y, i, valid = true;
		  x = document.getElementsByClassName("tab");
		  y = x[currentTab].getElementsByTagName("input");
		  for (i = 0; i < y.length; i++) {
		    if (y[i].value == "") {
		      y[i].className += " invalid";
		      valid = false;
		    }
		  }
		  if (valid) {
		    document.getElementsByClassName("step")[currentTab].className += " finish";
		  }
		  return valid; 
		}
		
		function fixStepIndicator(n) {
		  var i, x = document.getElementsByClassName("step");
		  for (i = 0; i < x.length; i++) {
		    x[i].className = x[i].className.replace(" active", "");
		  }
		  x[n].className += " active";
		}
		
		function numberWithCommas(x) {
		  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
		  x = x.replace(/([^1-9])([0-9]{10})/g,'');   // 입력값이 숫자가 아니면 공백
		  x = x.replace(/,/g,'');          // ,값 공백처리
		  $("#kumak").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
		  
		  //입력금액이 0과 같거나 작으면 리셋
		  if(parseInt(x) <= 0)
		  {
			  $("#kumak").val("");
		  }
		}
		
		//자동완성 스크립트 부분
		function autocomplete(inp, arr) 
		{
		//alert(arr);
		  var currentFocus;
		  inp.addEventListener("input", function(e){
		      var a, b, i, val = this.value;
		      closeAllLists();
		      
		      if (!val) { return false;}
		      
		      currentFocus = -1;
		      a = document.createElement("DIV");
		      a.setAttribute("id", this.id + "autocomplete-list");
		      a.setAttribute("class", "autocomplete-items");
		      this.parentNode.appendChild(a);
			      
		      for (var i = 0; i < arr.length; i++) {
		        if (arr[i].trim().substr(0, val.length) == val.trim()) { //앞뒤공백제거함
		          b = document.createElement("DIV");
		          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
		          b.innerHTML += arr[i].substr(val.length);
		          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
		          b.addEventListener("click", function(e) {
		              inp.value = this.getElementsByTagName("input")[0].value;
		              closeAllLists();
		          });
		          a.appendChild(b);
		        }
		      }
	  	  });
		  
		  inp.addEventListener("keydown", function(e) {
		      var x = document.getElementById(this.id + "autocomplete-list");
		      if (x) x = x.getElementsByTagName("div");
		      if (e.keyCode == 40) {
		        currentFocus++;
		        addActive(x);
		      } else if (e.keyCode == 38) { 
		        currentFocus--;
		        addActive(x);
		      } else if (e.keyCode == 13) {
		        e.preventDefault();
		        if (currentFocus > -1) {
		          if (x) x[currentFocus].click();
		        }
		      }
		  });
		  
		  function addActive(x) 
		  {
		    if (!x) return false;
		    removeActive(x);
		    if (currentFocus >= x.length) currentFocus = 0;
		    if (currentFocus < 0) currentFocus = (x.length - 1);
		    x[currentFocus].classList.add("autocomplete-active");
		  }
		  
		  function removeActive(x) 
		  {
		    for (var i = 0; i < x.length; i++) {
		      x[i].classList.remove("autocomplete-active");
		    }
		  }
		  
		  function closeAllLists(elmnt) 
		  {
		    var x = document.getElementsByClassName("autocomplete-items");
		    for (var i = 0; i < x.length; i++) {
		      if (elmnt != x[i] && elmnt != inp) {
		        x[i].parentNode.removeChild(x[i]);
		      }
		    }
		  }
		  
		  document.addEventListener("click", function (e) {
		      closeAllLists(e.target);
		  });
		}
		
		//받아온 List는 문자열로 받아지기 때문에 배열로 만들어주기 위해 변환한다
		var tmpStr = "${titleArr}";
		tmpStr = tmpStr.replace("[","");
		tmpStr = tmpStr.replace("]","");
		tmpStr = tmpStr.trim();
		var titleArr = tmpStr.split(",");
		autocomplete(document.getElementById("title"), titleArr);//자동완성 함수 호출
		
		//사용자정의 내역구분 모달창에서 내역구분 추가함수
		function partAdd()
		{
			var mid = "${smid}";
			var part_title = document.getElementById("part_title").value;
			var part_kubun = "${kumak_kubun}";
			//alert(mid + "/" + part_title + "/" + part_kubun);
			if(part_title == "")
			{
				alert("등록하실 내용을 입력하세요");
				document.getElementById("part_title").focus();
			}
			else
			{
				var ans = confirm("입력하신 내용으로 추가하시겠습니까?");
				if(ans)
				{
					$.ajax({
						url : "${ctp}/moneyPartAdd.don",
						type : "post",
						data : {
							mid : mid,
							part_title : part_title,
							part_kubun : part_kubun
						},
						success:function(res){
							if(res == 1)
							{
								alert("등록성공!");
								location.reload();
							}
							else
							{
								alert("등록오류!! 다시 등록해주세요");
							}
						}
					});
				}
			}
		}
		
		
		//btnPart 버튼 체크
		function kumak_kubun_click(btnPartId)
		{
			var id = btnPartId;
			document.getElementById("btnPart"+id).style.backgroundColor = "#ff7761";
			regForm.part.value = document.getElementById("btnPart"+id).value;//클릭한 내역구분 값을 넣어준다
			for(var i=1; i < ${btnCnt}; i++)
			{
				if(i != id)
				{
					document.getElementById("btnPart"+i).style.backgroundColor = "#ede574";
				}
			}
		}
		
		//btnJichulKubun 버튼 체크
		function jichul_kubun_click(btnJichulKubunId)
		{
			var id = btnJichulKubunId;
			document.getElementById("btnJichulKubun"+id).style.backgroundColor = "#3f4040";
			regForm.jichul_kubun.value = document.getElementById("btnJichulKubun"+id).value;//클릭한 내역구분 값을 넣어준다
			for(var i=1; i < 4; i++)
			{
				if(i != id)
				{
					document.getElementById("btnJichulKubun"+i).style.backgroundColor = "";
				}
			}
		}
	</script>
	<!-- Footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>