<%@page import="kr.or.ddit.user.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Jsp-basicLib</title>
<%@ include file="/commonJsp/basicLib.jsp" %>
<style>
	tr:nth-child(odd) {
		background: #FAFAFA;
	}
	
	.userTr:hover {
		background: #FFCA6C;
		cursor: pointer;
	}
</style>
<script>
	$(document).ready(function() {
		
		// 사용자 정보 클릭 시 이벤트 핸들러
		$(".userTr").on("click", function() {
			// 클릭된 tr태그의 자식태그(td)중 첫번째 자식의 텍스트 문자열
			var tdText = $(this).children().eq(1).text();
			console.log("tdText: " + tdText);
			
			// input 태그에 저장된 값 확인
			var inputValue = $(this).find("input").val();
			console.log("inputValue: " + inputValue);
			
			// data 속성으로 값(tr 태그에 저장된 값) 확인
			var dataValue = $(this).data("userid"); // 모두 소문자로 치환됨
			console.log("dataValue: " + dataValue);
			
			// input 태그에 값 설정
			$("#userId").val(dataValue);
			
			// form 태그 이용하여 전송
			console.log("serialize: " + $("#frm").serialize());
			
			$("#frm").submit();
		});
		
	});
</script>
</head>

<body>
	<!-- 개발자 입장에서 데이터를 전송하기 위하여 사용하는 form -->
	<form id="frm" action="${cp }/postPagingList" method="get">
		<input type="hidden" id="boardSeq" name="boardSeq"/>
	</form>
	
	<!-- header -->
	<%@ include file="/header.jsp" %> 

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<!-- left -->
				<%@ include file="/left.jsp" %>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="row">
					<div class="col-sm-10 blog-main">
						<h2 class="sub-header">${board.boardNm }</h2>
						<div class="table-responsive">
							<table class="table">
								<tr>
									<th class="text-center">게시글 번호</th>
									<th >제목</th>
									<th class="text-center">작성자 아이디</th>
									<th class="text-center">작성일시</th>
								</tr>
								
								<c:forEach items="${postList}" var="post">
<%-- 									<tr class="userTr" data-userId="${post.postSeq }"> --%>
									<tr>
										<td class="text-center">${post.POSTSEQ}</td>
										<td>
											<!-- 공백주기 -->
											<c:forEach begin="2" end="${post.LEVEL }" var="i" step="1">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<c:if test="${post.LEVEL == i}">
													<c:choose>
														<c:when test="${post.POSTSTATUS == 1}">
															<span class="glyphicon glyphicon-menu-right"></span>
														</c:when>
														<c:otherwise>
															<span class="glyphicon glyphicon-menu-right" style="color:silver;"></span>
														</c:otherwise>
													</c:choose>
													
												</c:if>
											</c:forEach>
											<!-- 게시글 제목 -->
											<c:choose>
												<c:when test="${post.POSTSTATUS == 1}">
													<a href="${cp }/post?postSeq=${post.POSTSEQ }" style="color:black;">
														${post.POSTNM}
													</a>
												</c:when>
												<c:when test="${post.POSTSTATUS == 0}">
													<span style="color:silver;">삭제된 게시글입니다.</span>
												</c:when>
											</c:choose>
										</td>
										<td class="text-center">${post.USERID}</td>
										<td class="text-center">${post.POSTREGDATE}</td>
									</tr>
								</c:forEach>
								
							</table>
						</div>
												
						<a href="${cp }/insertPost?boardSeq=${boardSeq }" class="btn btn-default pull-right">
							<span class="glyphicon glyphicon-pencil"></span> 새글쓰기
						</a>

						<div class="text-center">
							<ul class="pagination">
							
							
								<!--   <<   -->
								<c:choose>
									<c:when test="${pageVo.page == 1 || (paginationSize == 0) }">
										<li class="disabled">
											<span aria-hidden="true">&laquo;</span>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${cp }/postPagingList?boardSeq=${boardSeq }&page=1" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!--   <   -->
								<c:choose>
									<c:when test="${pageVo.page == 1 }">
										<li class="disabled">
											<span aria-hidden="true">&lt;</span>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${cp }/postPagingList?boardSeq=${boardSeq }&page=${pageVo.page - 1}" aria-label="Previous">
												<span aria-hidden="true">&lt;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!--   page   출력 -->
								<c:forEach begin="1" end="${paginationSize }" var="idx">
									<c:choose>
										<c:when test="${idx == pageVo.page }">
											<%-- 현재 페이지를 클릭했을때도 재요청되므로 막아준다.
											<li class="active"><a href="${cp }/userPagingList?page=${idx }&pagesize=10">${idx }</a></li>
											--%>
											<li class="active"><span>${idx }</span></li>
											 
										</c:when>
										<c:otherwise>
											<li><a href="${cp }/postPagingList?boardSeq=${boardSeq }&page=${idx }">${idx }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<!--   >   -->
								<c:choose>
									<c:when test="${(pageVo.page == paginationSize) || (paginationSize == 0) }">
										<li class="disabled">
											<span aria-hidden="true">&gt;</span>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${cp }/postPagingList?boardSeq=${boardSeq }&page=${pageVo.page + 1}" aria-label="Previous">
												<span aria-hidden="true">&gt;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!--   >>   -->
								<c:choose>
									<c:when test="${pageVo.page == paginationSize || (paginationSize == 0) }">
										<li class="disabled">
											<span aria-hidden="true">&raquo;</span>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${cp }/postPagingList?boardSeq=${boardSeq }&page=${paginationSize }" aria-label="Previous">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
