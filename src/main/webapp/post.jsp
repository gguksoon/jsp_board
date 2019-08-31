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
	.repArea {
		background: silver;
	}
</style>

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
						<!-- 제목 -->
						<h1>${post.postNm }</h1>
						작성자: ${post.userId } | 작성일: ${post.postRegDate }
						<hr>
						<!-- 내용 -->
						${post.postContent }
						<hr> 
						첨부파일:
						<hr> 
						<!-- 댓글 내용 -->
						<c:forEach items="${replyList }" var="reply">
							${reply.replyContent } [ ${reply.userId } / ${reply.replyRegDate } ]
							<c:if test="${reply.userId == S_USERVO.userId }">
								<span class="glyphicon glyphicon-remove"></span>
							</c:if>
							<br>
						</c:forEach>
						
						<!-- 댓글 입력창 -->
						<div class="form-group repArea">
							<form method="post" action="${cp }/insertReply">
								<input type="hidden" name="postSeq" value="${post.postSeq }"/>
								<span class="col-sm-10">
									<textarea class="form-control" rows="4" name="replyContent" id="replyContent" placeholder="댓글을 입력하세요." style="resize: none;"></textarea>
								</span>
								<span class="col-sm-2">
								<button type="submit" class="btn btn-info btn-lg btn-block" style="height: 95px;">입력</button>
								</span>
							</form>
						</div>
						<br><br><br><br><br>
						<hr>
						<!-- 버튼 -->
						수정, 삭제, 답글버튼		
<%-- 						<a href="${cp }/insertPost?boardSeq=${boardSeq }" class="btn btn-default pull-right"> --%>
<!-- 							<span class="glyphicon glyphicon-pencil"></span> 새글쓰기 -->
<!-- 						</a> -->

						<div class="text-center">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
