<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<%@ include file="/include/sCheck.jsp" %>
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

  <title>bList.jsp</title>  
<link href="./main.97292821.css" rel="stylesheet">
	<script>
    function pageCheck() {
    	var pageSize = pageForm.pageSize.value;
    	location.href="${contextPath}/bList.bo?pag=${pag}&pageSize="+pageSize;
    }
    function sCheck() {
    	var searchString = searchForm.searchString.value;
    	if(searchString == "") {
    		alert("검색어를 입력하세요.");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
  </script>
	<style>
    table {
      width : 400px;
      margin : 0px auto;
    }
    table, th,td {
      border: 5px solid #aaa;
      padding : 15px;
      color: blue;
      font-weight: bold;
    }
    th {
      text-align: center;
      color:blue;
      font-weight: bold;
    }
    td {
    	color:blue;
      font-weight: bold;
    }
     .background-image-container {
	  width: 100%;
	  height: 100%;
	  text-align: center;
	  position: relative;
	  z-index: 1;
		}
		.background-image-container::after {
		  width: 100%;
		  height: 100%;
		  content: "";
		  background-image: url('./assets/images/img-20.jpg');
			backgournd-position: center center;		  
		  position: absolute;
		  top: 0;
		  left: 0;
		  z-index: -1;
		  opacity: 0.5;
		}
  </style>
</head>
<body>




<!-- Add your site or app content here -->
<div class="background-image-container white-text-container" >
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="container">
				        	<a href="./bList.bo" class="btn btn-primary btn-lg anchor-link" title="" style="color:black;">커뮤니티</a>
								  <table class="table table-sm">
								    <tr>
								      <td style="text-align:left;border:none;">
								        <table style="width:100%;">
								          <tr>
								            <td style="text-align:left;border:none;width:10%;"><button type="button" onclick="location.href='${contextPath}/bInput.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary btn-sm">글올리기 </button></td>
								            <td style="text-align:left;border:none;width:5%;">
									            <form name="pageForm">
											          <select name="pageSize" onchange="pageCheck()">
											            <option value="5"  ${pageSize==5  ? 'selected' : ''}>5건</option>
											            <option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
											            <option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
											            <option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
											          </select>
									        		</form>
								            </td>
								            <td style="text-align:right;border:none;width:85%;">
											      <!-- 페이징 처리 시작   -->
													    <c:if test="${pag != 1}"><a href="bList.bo?pag=1&pageSize=${pageSize}" style="color:#666">◁◁</a></c:if>
													    <c:if test="${pag > 1}"><a href="bList.bo?pag=${pag-1}&pageSize=${pageSize}" style="color:#666">◀</a></c:if>
													    ${pag}Page / ${totPage}Pages
													    <c:if test="${pag < totPage}"><a href="bList.bo?pag=${pag+1}&pageSize=${pageSize}" style="color:#666">▶</a></c:if>
													    <c:if test="${pag != totPage}"><a href="bList.bo?pag=${totPage}&pageSize=${pageSize}" style="color:#666">▷▷</a></c:if>
													  <!-- 페이징 처리 끝   -->
								            </td>
								          </tr>
								        </table>
								      </td>
								    </tr>
								  </table>
								  <table class="table table-hover">
								    <tr style="text-align: center;">
								      <th>글번호</th>
								      <th>글제목</th>
								      <th>글쓴이</th>
								      <th>글쓴날자</th>
								      <th>조회(댓글)수</th>
								      <th>좋아요</th>
								    </tr>
								    <c:forEach var="vo" items="${vos}">  <!-- for(String str : 배열명) -->
									    <tr>
									      <td>${vo.idx}</td>
									      <td style="text-align:left;">
									        <a href="${contextPath}/bContent.bo?idx=${vo.idx}&pag=${pag}" style="color:#333">${vo.title}</a>
									        <c:if test="${vo.wNdate <= 24}"><img src="${contextPath}/images/new.gif"/></c:if>
									      </td>
									      <td>
									        <c:set var="varLen" value="${fn:length(vo.homepage)}"/>
									        <c:set var="homepage" value="${fn:substring(vo.homepage,7,varLen)}"/>
									        <c:if test="${!empty homepage}">
									          <a href="${vo.homepage}" target="_blank"><font color='#00f'>${vo.name}</font></a>
									        </c:if>
									        <c:if test="${empty homepage}">
									          ${vo.name}
									        </c:if>
									      </td>
									      <td>${vo.wdate}</td>
									      <td>${vo.readnum}(${vo.replyCount})</td>
									      <td>${vo.good}</td>
									    </tr>
								    </c:forEach>
								  </table>
								</div>
								  <!-- 
								  <c:set var="blockSize" value="${blockSize}"/>
								  <c:set var="pag" value="${pag}"/>
								  <c:set var="totPage" value="${totPage}"/>
								    시작페이지 구하는 방법 1: startPageNum = (pag-1)/blockSize)*blockSize+1
								                  2: startPageNum = pag - (pag-1)%blockSize 
								  -->
								<!-- 블록 페이징처리 시작 -->
								<div class="container" style="text-align:center">
								  <ul class="pagination justify-content-center">
									  <c:set var="startPageNum" value="${pag - (pag-1)%blockSize}"/>
									  <c:if test="${pag != 1}">
									    <li class="page-item"><a href="bList.bo?pag=1&pageSize=${pageSize}" class="page-link" style="color:#666">◁◁</a></li>
									    <li class="page-item"><a href="bList.bo?pag=${pag-1}&pageSize=${pageSize}" class="page-link" style="color:#666">◀</a></li>
									  </c:if>
									  <c:forEach var="i" begin="0" end="2">
									    <c:if test="${(startPageNum+i) <= totPage}">
									      <c:if test="${pag == (startPageNum+i)}">
									        <li class="page-item active"><a href="bList.bo?pag=${startPageNum+i}&pageSize=${pageSize}" class="page-link btn btn-secondary active" style="color:#666"><font color="#fff"><b>${startPageNum+i}</b></font></a></li>
									      </c:if>
									      <c:if test="${pag != (startPageNum+i)}">
									        <li class="page-item"><a href="bList.bo?pag=${startPageNum+i}&pageSize=${pageSize}" class="page-link" style="color:#666">${startPageNum+i}</a></li>
									      </c:if>
									    </c:if>
									  </c:forEach>
									  <c:if test="${pag != totPage}">
									    <li class="page-item"><a href="bList.bo?pag=${pag+1}&pageSize=${pageSize}" class="page-link" style="color:#666">▶</a></li>
									    <li class="page-item"><a href="bList.bo?pag=${totPage}&pageSize=${pageSize}" class="page-link" style="color:#666">▷▷</a></li>
									  </c:if>
									</ul>
								</div>
								<!-- 블록 페이징처리 끝 -->
								<br/>
								<!-- 검색기 처리 시작 -->
								<div class="container" style="text-align:center">
								  <form name="searchForm" method="get" action="${contextPath}/bSearch.bo">
								    <b>검색 : </b>
								    <select name="search" size=1>
								      <option value="title" selected>글제목</option>
								      <option value="name">글쓴이</option>
								      <option value="content">글내용</option>
								    </select> &nbsp;
								    <input type="text" name="searchString"/>
								    <input type="button" value="검 색" onclick="sCheck()"/>
								    <input type="hidden" name="pag" value="${pag}"/>
								    <input type="hidden" name="pageSize" value="${pageSize}"/>
								  </form>
								</div>
								<!-- 검색기 처리 끝 -->
								<p><br/></p>
                <h1><a href="" style="color:black;">All weather investment</a></h1>
                <p><br/><p>
                <a href="#contact-section-container" class="btn btn-primary btn-lg anchor-link" title="" style="color:black;">Get in touch</a>
            </div>
        </div>
    </div>
</div>

<div class="section-container" id="contact-section-container5">
	<div class="section-container">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12 col-md-12 section-container-spacer">
	                <h2 class="text-center">고객지원</h2>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-xs-12 col-md-4">
	                <div class="fa-container">
	                    <i class="fa fa-comment-o fa-3x" aria-hidden="true"></i>
	                </div>
	                <h3 class="text-center">고객상담</h3>
	                <p>고객 상담시간은 매주 월요일에서 금요일까지 오전 11시~오후 5시로 운영됩니다/</p>
	            </div>
	
	            <div class="col-xs-12 col-md-4">
	                <div class="fa-container">
	                    <i class="fa fa-heart-o fa-3x" aria-hidden="true"></i>
	                </div>
	                <h3 class="text-center">서비스</h3>
	                <p>기본형
										투자 금액 크기와 위험 성향에 따라 포트폴리오가 달라집니다.
										투자 금액이 클수록, 또 위험 성향이 높을수록 올웨더 포트폴리오를 가장 잘 추종할 수 있도록 운용됩니다.
										반면 투자 금액이 적고 위험 성향에서 안전을 추구할수록, 올웨더의 압축형 포트폴리오가 제공됩니다. 이 때 전체 투자 비중에서 채권 및 안전 자산 비중을 높게 구성하여 운용합니다.</p>
	            </div>
	            <div class="col-xs-12 col-md-4">
	                <div class="fa-container">
	                    <i class="fa fa-bell-o fa-3x" aria-hidden="true"></i>
	                </div>
	                <h3 class="text-center">고객관리</h3>
	                <p> 투자원금에 대해 기본수수료율을 적용하여 청구합니다.
										수수료율 : 0.3%
										청구시기 : 6월 말, 12월 말 종료 후 영업일 기준 10일 이내, 투자중지일 또는 계약해지일
										계산방법 : [투자원금 평균 - 500만원(공제)] × 수수료율 × (운용일수/365)
										</p>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<div class="section-container" id="contact-section-container4">
	<div class="section-container section-half-background-image-container">
	    <div class="image-column" style="background-image: url('./assets/images/img-01.jpg')"></div>
	    <div class="container">
	        <div class="row">
	            <div class="section-label reveal">
	                <p>we are</p>
	            </div>
	            <div class="col-md-6 col-md-offset-6 text-column">
	                <h2>투자비젼</h2>
	                <h3>사계절 포트폴리오란?</h3>
	                <p>1. 각 ETF 들이 각 자산군들을 대표하는가?
										당연히 의문이 있습니다. VT가 전체 주식시장을 상징한다고 할 수 있을까? 좀 더 효율적인 인덱싱 방식이 존재하지 않을까? 제가 VT 1개 외에도 3가지 지역으로 나눠서 투자하는 방식도 소개도 드렸는데, 그렇다면 그 방식이 맞는걸까? 쉽게 대답하기 어려운 질문입니다. FTSE vs MSCI 의 Indexing 에 대한 문제도 쉽게 대답하기 어려운 문제입니다. 각 문제에 대해서 고민을 하고 결정을 내려야겠죠.
										단순히 주식만 언급했지만 다른 자산군들에게도 던질 수 있는 질문입니다.</p>
	                <p>2. ETF에 예상치 못한 리스크가 존재하는가?
											ETF의 Prospectus 에 보면 꽤 많은 Risk에 대해서 논하고 있습니다. 예를 들어 몇몇 ETF는 선물, 스왑계약으로 구현이 되어있습니다. 그렇다면 각각 계약이 안전하게 구성되었고 혹시라도 있을 위기에서 안전한지 고민이 필요합니다. 마이클 버리도 의문을 제기했던 것처럼 ETF 의 Liquidity Risk 또한 인지하고 있어야 할 부분입니다. 우리가 매매하는 ETF들에도 그런 Risk가 있는지를 봐야 할 것입니다.</p>
	                <p>3. 그 비율은 적절한가?
											황금비율이라는 것은 여전히 존재하지 않는다고 생각합니다만, 제가 편한 비율 또 투자자들이 편히 투자할 수 있는 비율이 존재하겠죠. 그런 세부적인 사항을 맞추기 위한 연구를 여전히 진행중입니다.
											많은 Risk Parity 전략이 동적으로 비율을 바꿔서 운영하고 있습니다. 각 회사들마다의 특징 또 고민이 있는데, 그런 부분들을 어떻게 녹여볼지 고민하고 있습니다.</p>
									<p>4. 추가하거나 빼야 할 자산군이 있는가?
										이미 투자를 결정한 자산군이라도 한번 보고 두번 보고 세번 봐야합니다. 몇가지 자산군들은 전통적인 자산배분에서는 포함되지 않는 자산군이고 학자들마다 또 투자자들마다 의견이 엇갈리는 자산군들이 있습니다. 그런 자산군의 투자에 대해 끝없는 재검토가 필요합니다.
										순수한 자산배분을 원하시는 분들은 60 / 40 Portfolio(AOR)가 좋다고 생각합니다.
										예를 들면, 채권을 대체하는 자산군들에 대해 연구하고 있는 곳들이 있습니다. 브리지워터에서는 채권을 대체하는 자산군에 대해서 연구하고 있습니다.
										물론 무조건 자산군을 추가한다고 좋은 것은 아닙니다. 반대로 너무 자산군이 적어도 안되겠죠.</p>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<div class="section-container" id="contact-section-container3">
	<div class="section-container">
	    <div class="container">
	        <div class="row">
	            <div class="col-xs-12 col-md-12 section-container-spacer">
	                <h2 class="text-center">대표 상품</h2>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-xs-12 col-md-4">
	                <img src="./assets/images/img-02.jpg" alt="" class="img-responsive">
	                <h3 class="text-center">사계절 펀드</h3>
	                <p>주식 30%, 중기국채 15%, 장기국채 40%, 원자재, 금 각각 7.5%
											A. 30% 주식 – 미국 주가지수 ETF 등 주식
											B. 중기 미국 국채(7-10년채) 15%, 장기 미국 국채 40%(20-25년채)
											C. 각각 7.5%를 원자재, 금에 투자</p>
	            </div>
	
	            <div class="col-xs-12 col-md-4">
	                <img src="./assets/images/img-03.jpg" alt="" class="img-responsive">
	                <h3 class="text-center">가치투자 펀드</h3>
	                <p>가치에 비해 
										 가격이 과소평가 되어 있을 때
										 주식을 매수하는 전략(최소1년보유의무)</p>
	            </div>
	            <div class="col-xs-12 col-md-4">
	                <img src="./assets/images/img-04.jpg" alt="" class="img-responsive">
	                <h3 class="text-center">스윙매매 차트투자</h3>
	                <p>주식을 사거나 팔아서 몇 일에서 몇 주까지 포지션을 유지한다. 또한 스윙 트레이딩 투자자는 기술적, 펀더멘탈 또는 계량적 가치평가에 근거하여 매수 또는 매도 포지션을 취하게 되며, 데이 트레이딩 투자자와 달리 거래하는 데 시간이 더 걸릴 수 있다.</p>
	            </div>
	        </div>
	    </div>
	</div>
</div>


<div class="section-container" id="contact-section-container2">
	<div class="">
	    <div class='container-fluid'>
	        <div class="row map-container">
	            <div id="map"></div>
	            <div class="col-xs-10 col-md-4 contact-block-container reveal">
	                <div class="row">
	                    <div class="col-xs-12 col-sm-6">
	                        <h3>Phone</h3>
	                        <p>+82 010 5686 5693</p>
	
	                        <h3>E-mail</h3>
	                        <p>byeonhs0018@naver.com</p>
	
	                    </div>
	
	                    <div class="col-xs-12 col-sm-6">
	                        <h3>Address</h3>
	                        <p>47, Seohyeonjung-ro 31beon-gil, Heungdeok-gu, Cheongju-si, Chungcheongbuk-do, Republic of Korea</p>
	
	                        <h3>Open hours</h3>
	                        <p>Mon - Fri : 9AM - 5PM</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>


<div class="section-container" id="contact-section-container">
    <div class="container contact-form-container">
        <div class="row">
            <div class="col-xs-12 col-md-offset-2 col-md-8">
                <div class="section-container-spacer">
                    <h2 class="text-center">Get in touch</h2>
                </div>
                <form action="">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" placeholder="Email">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <textarea class="form-control" rows="3" placeholder="Enter your message"></textarea>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1">Email me a copy
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" value="option2">I am a human
                        </label>
                    </div>

                    <button type="submit" class="btn btn-primary">Send message</button>
                    <a href="" class="btn btn-default">Reset</a>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
document.addEventListener("DOMContentLoaded", function (event) {
    
  googleMapInit(); 
  scrollToAnchor();
  scrollRevelation('reveal');
});
</script>

<footer class="footer-container white-text-container">
    <div class="container">
        <div class="row">
                <div class="col-md-4">
                    <h4>About us</h4>
                    <p>All weather investment주식회사는'자본시장과 금융투자에 관한 법률'에서 규정하는 투자일임업/투자자문업 라이센스 보유기업으로, 전문인력, 자본금, 이해상충방지 요건 등을 갖추고 금융위 및 금감원 관리감독 받는 제도권 금융회사입니다.</p>
                </div>

                <div class="col-md-4">
                    <h4>Do you like ? Share this !</h4>
                    <div>
                        <p>
                            <a href="https://www.twitter.com" class="fa-icon" title="">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>
                            <a href="https://www.facebook.com" class="fa-icon" title="">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                            </a>
                            <a href="https://www.linkedin.com" class="fa-icon" title="">
                                <i class="fa fa-linkedin" aria-hidden="true"></i>
                            </a>
                        </p>
                    </div>
                    <div>
                        <p><small>2020.11.22 Brian Co. all rights reserved. © Untitled | Website created with <a href="http://www.mashup-template.com/" title="Create website with free html template">Mashup Template</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Unsplash</a></small></p>
                    </div>

                </div>

                <div class="col-md-4">
                        
                    <h4>Subscribe to newsletter</h4>
                    
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control footer-input-text">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default btn-newsletter ">OK</button>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
        </div>
    </div>
</footer>

<script>
document.addEventListener("DOMContentLoaded", function (event) {
  navbarToggleSidebar();
});
</script>
</html>