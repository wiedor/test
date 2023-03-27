<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import= "java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="hrdnetui" uri="http://www.keis.or.kr/tags/hrdnet-ui/jsp" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*" %>      
      
 <!-- 메인 컨텐츠영역 -->
 <div id="subContentWrapBody" class="subContArea beombucheo full">
     <div class="subContArea full full-area">
         
         <div class="headingTitleArea line-bottom"><!-- 모바일에서만 class 추가 -->
             <h3 class="headingTitle">범부처 신기술 훈련 사업 모아보기</h3>
             <!-- 모바일에서만 class 추가 -->
                     <p class="headingText mo-tal pd0">신기술 인재양성을 위해 학습자(훈련참여자)의 수준에 따라 참여할 수 있는 훈련사업들을 분야별로 안내해드립니다.<br>다양한 정보를 확인 하시려면 아래 분야별 아이콘을 클릭하여 확인 하실 수 있습니다.</p>
             <div class="headingIcon">
                 <ul> 
                     <li><button type="button" class="twitter" title="트위터 새창으로 공유">트위터</button></li>
                     <li><button type="button" class="facebbok" title="페이스북 새창으로 공유">페이스북</button></li>
                     <li><button type="button" class="print" title="프린트">프린트</button></li>
                 </ul>
             </div>
         </div>
             
         <div class="contentArea">
                 <div class="bumbu-sch">
                     <h3 class="visually-hidden">분야별 훈련사업 키워드 검색</h3>
                     <div class="sch-area">
                        <form:form name="searchForm1" id="searchForm1" method="post">
                         <input type="text" placeholder="키워드를 입력하세요" title="검색어 입력" name = "searchWord" id ="searchWord" />
                         <button id="searchBtn" type="button" class="btn sch" onclick="fn_search()" title="검색">검색</button>
                         </form:form>
                     </div>
                 </div>
                 
                 

             	<!-- 본문검색목록  -->
				<div class="subjectList">
                <h3 class="visually-hidden">분야별 훈련사업</h3>
					<ul class="trade01 beombucheo-list"> 
						<c:set var="index" value="1"/>
						
				 	<c:forEach var="traList" items="${traList}" varStatus="status">
				 		<c:if test="${traList.comcdValueSod>index}">
			                    <li id = "icoBumbuco<c:out value="${traList.comcdValueSod}"/>">
			                    
								<c:choose>
									<c:when test="${traList.comcdValueSod < 10 }">
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=00${traList.comcdValueSod}'/>" title= '${traList.comcdValueNm } 사업안내 보기 이동'>
							 		</c:when>
							 		<c:when test="${traList.comcdValueSod ge 10 && traList.comcdValueSod < 100  }">
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=0${traList.comcdValueSod}'/>" title='${traList.comcdValueNm } 사업안내 보기 이동'>
							 		</c:when>
							 		<c:otherwise>
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=${traList.comcdValueSod}'/>" title='${traList.comcdValueNm } 사업안내 보기 이동'>
							 		</c:otherwise>
							 	</c:choose>
							 	
			                        <div class="ico-bumbu ico-bumbuco<c:out value="${traList.comcdValueSod}"/>">
										<strong class="title"><c:out value="${traList.comcdValueNm}"/></strong>
									</div> 
                                   	<p><c:out value="${traList.comcdValueDc}"/></p>
                                   	<span class="link"><i class="visually-hidden"><c:out value="${traList.comcdValueNm }"/></i> 사업 안내 보기 </span>
                                   </a>
                              	 </li>
						</c:if>
					</c:forEach> 						
				    </ul>
				</div>
				<!--// 검색목록 -->
		</div>
	</div>
</div>


<script>
/* 웹접근성 개선 180417 : 페이지 타이틀 상세 정의 */



function fn_search(){
	var url = "<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=000' />";
	
	$("#searchForm1").prop("action", url);
	$("#searchForm1").prop("method", "post");
	$("#searchForm1").submit();
}

$('#searchWord').keypress(function(event) {
	
	if(event.keyCode == 13) {
		fn_search();
		return false;
	}			
});

$(function() {
	
	var title = "범부처 디지털 훈련 사업";
 document.title= title + ' | HRD-Net';
 
});

</script>


<script type="text/javascript">
/* 웹접근성 개선 180503 : 페이지 타이틀 상세 정의 */
$(function() {


$(".lnbArea").css("display","none");  
$(".location > ul").empty();   
$(".location > ul").append("<li class='goHome verPC'><a href='/hrdp/ma/pmmao/indexNew.do' title=\"홈\">홈</a></li>");
$(".location > ul").append("<li style='padding:0 14px 0 14px;'><a href='/hrdp/gi/pgiao/PGIAO0300D.do' title=\"홈\">지원제도</a></li>");
$(".location > ul").append("<li style='padding:0 14px 0 14px;'><a href='/hrdp/di/pdiao/PDIAO0100L.do' title=\"홈\">범부처 디지털 신기술</a></li>");

});

</script>