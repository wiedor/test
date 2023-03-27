<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import= "java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="hrdnetui" uri="http://www.keis.or.kr/tags/hrdnet-ui/jsp" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.*" %>      
      
 <!-- ���� ���������� -->
 <div id="subContentWrapBody" class="subContArea beombucheo full">
     <div class="subContArea full full-area">
         
         <div class="headingTitleArea line-bottom"><!-- ����Ͽ����� class �߰� -->
             <h3 class="headingTitle">����ó �ű�� �Ʒ� ��� ��ƺ���</h3>
             <!-- ����Ͽ����� class �߰� -->
                     <p class="headingText mo-tal pd0">�ű�� ����缺�� ���� �н���(�Ʒ�������)�� ���ؿ� ���� ������ �� �ִ� �Ʒû������ �оߺ��� �ȳ��ص帳�ϴ�.<br>�پ��� ������ Ȯ�� �Ͻ÷��� �Ʒ� �оߺ� �������� Ŭ���Ͽ� Ȯ�� �Ͻ� �� �ֽ��ϴ�.</p>
             <div class="headingIcon">
                 <ul> 
                     <li><button type="button" class="twitter" title="Ʈ���� ��â���� ����">Ʈ����</button></li>
                     <li><button type="button" class="facebbok" title="���̽��� ��â���� ����">���̽���</button></li>
                     <li><button type="button" class="print" title="����Ʈ">����Ʈ</button></li>
                 </ul>
             </div>
         </div>
             
         <div class="contentArea">
                 <div class="bumbu-sch">
                     <h3 class="visually-hidden">�оߺ� �Ʒû�� Ű���� �˻�</h3>
                     <div class="sch-area">
                        <form:form name="searchForm1" id="searchForm1" method="post">
                         <input type="text" placeholder="Ű���带 �Է��ϼ���" title="�˻��� �Է�" name = "searchWord" id ="searchWord" />
                         <button id="searchBtn" type="button" class="btn sch" onclick="fn_search()" title="�˻�">�˻�</button>
                         </form:form>
                     </div>
                 </div>
                 
                 

             	<!-- �����˻����  -->
				<div class="subjectList">
                <h3 class="visually-hidden">�оߺ� �Ʒû��</h3>
					<ul class="trade01 beombucheo-list"> 
						<c:set var="index" value="1"/>
						
				 	<c:forEach var="traList" items="${traList}" varStatus="status">
				 		<c:if test="${traList.comcdValueSod>index}">
			                    <li id = "icoBumbuco<c:out value="${traList.comcdValueSod}"/>">
			                    
								<c:choose>
									<c:when test="${traList.comcdValueSod < 10 }">
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=00${traList.comcdValueSod}'/>" title= '${traList.comcdValueNm } ����ȳ� ���� �̵�'>
							 		</c:when>
							 		<c:when test="${traList.comcdValueSod ge 10 && traList.comcdValueSod < 100  }">
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=0${traList.comcdValueSod}'/>" title='${traList.comcdValueNm } ����ȳ� ���� �̵�'>
							 		</c:when>
							 		<c:otherwise>
							 			<a href="<c:url value='/hrdp/di/pdiao/PDIAO0110L.do?nwtcRlmCd=${traList.comcdValueSod}'/>" title='${traList.comcdValueNm } ����ȳ� ���� �̵�'>
							 		</c:otherwise>
							 	</c:choose>
							 	
			                        <div class="ico-bumbu ico-bumbuco<c:out value="${traList.comcdValueSod}"/>">
										<strong class="title"><c:out value="${traList.comcdValueNm}"/></strong>
									</div> 
                                   	<p><c:out value="${traList.comcdValueDc}"/></p>
                                   	<span class="link"><i class="visually-hidden"><c:out value="${traList.comcdValueNm }"/></i> ��� �ȳ� ���� </span>
                                   </a>
                              	 </li>
						</c:if>
					</c:forEach> 						
				    </ul>
				</div>
				<!--// �˻���� -->
		</div>
	</div>
</div>


<script>
/* �����ټ� ���� 180417 : ������ Ÿ��Ʋ �� ���� */



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
	
	var title = "����ó ������ �Ʒ� ���";
 document.title= title + ' | HRD-Net';
 
});

</script>


<script type="text/javascript">
/* �����ټ� ���� 180503 : ������ Ÿ��Ʋ �� ���� */
$(function() {


$(".lnbArea").css("display","none");  
$(".location > ul").empty();   
$(".location > ul").append("<li class='goHome verPC'><a href='/hrdp/ma/pmmao/indexNew.do' title=\"Ȩ\">Ȩ</a></li>");
$(".location > ul").append("<li style='padding:0 14px 0 14px;'><a href='/hrdp/gi/pgiao/PGIAO0300D.do' title=\"Ȩ\">��������</a></li>");
$(".location > ul").append("<li style='padding:0 14px 0 14px;'><a href='/hrdp/di/pdiao/PDIAO0100L.do' title=\"Ȩ\">����ó ������ �ű��</a></li>");

});

</script>