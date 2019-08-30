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
						<h1>${post.postNm }</h1>
						작성자: ${post.userId } | 작성일: ${post.postRegDate }
						<hr>
						${post.postContent }
						<hr> 
						첨부파일:
						<hr> 
						댓글: 댓글작성버튼
						<hr>
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
