<%@page import="kr.or.ddit.user.model.User"%>
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

<title>jsp_board</title>

<%@ include file="/commonJsp/basicLib.jsp" %>

<script>
	$(function() {
		$(".btnUp").first().attr("class", "btn disabled");
		$(".btnDown").last().attr("class", "btn disabled");
		
		$(".btnUp").on("click", function() {
			var pForm = $(this).parent($("form"));
			var location = $(pForm).children(".boardLocation").val();
			$(pForm).children(".change").val("up");
			
			if(location != 1) {
				$(pForm).attr("action", "${cp }/locationChangeBoard");
				$(pForm).submit();
			}
		});
		
		$(".btnDown").on("click", function() {
			var pForm = $(this).parent($("form"));
			var location = $(pForm).children(".boardLocation").val();
			var lastLocation = pForm.parent().children(".boardForm").last().children(".boardLocation").val();
			$(pForm).children(".change").val("down");
			//
			console.log(location); 
			console.log(lastLocation); 
			//
			if(location != lastLocation) {
				$(pForm).attr("action", "${cp }/locationChangeBoard");
				$(pForm).submit();
			}
		});
		
		$(".updateBtn").on("click", function() {
			var pForm = $(this).parent($("form"));
			$(pForm).attr("action", "${cp }/updateBoard");
			$(pForm).submit();
		});
		
	})
	
</script>

</head>

<body>
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
					<div class="col-sm-12 blog-main">
						<h2 class="sub-header">게시판 관리</h2>
						<c:forEach items="${boardList}" var="board">
								<form class="form-inline boardForm" method="post">
									<input type="hidden" class="boardSeq" name="boardSeq" value="${board.boardSeq }"/>
									<input type="hidden" class="userId" name="userId" value="${board.userId }"/>
									<input type="hidden" class="boardLocation" name="boardLocation" value="${board.boardLocation }"/>
									<input type="hidden" class="change" name="change"/>

									<button type="button" class="btn btn-default btnUp">
	         								<span class="glyphicon glyphicon-menu-up"></span>
	       							</button>
									<button type="button" class="btn btn-default btnDown">
	         								<span class="glyphicon glyphicon-menu-down"></span>
	       							</button>
									
									<input type="text" class="form-control" name="boardNm" value="${board.boardNm }"/>
									<c:choose>
											<c:when test="${board.boardStatus == 0}"> <%-- 미사용 --%>
												<select name="boardStatus" class="form-control">
											        <option>사용</option>
											        <option selected>미사용</option>
											    </select>
											</c:when>
											<c:otherwise>	<%-- 사용 --%>
												<select name="boardStatus" class="form-control">
											        <option selected>사용</option>
											        <option>미사용</option>
											    </select>
											</c:otherwise>
									</c:choose>
									
									<button type="button" class="btn btn-info updateBtn">수정</button>
	       							<br><br>
								</form>
								
						</c:forEach>
						
						<br><br><br>
						
						<h2 class="sub-header">게시판 추가</h2>
						<form class="form-inline" method="post" action="${cp }/insertBoard">
							<input type="text" class="form-control" name="boardNm" placeholder="게시판 이름"/>
							<input type="hidden" name="userId" value="${S_USERVO.userId }"/>
							<select name="boardStatus" class="form-control">
								<option selected>사용</option>
								<option>미사용</option>
							</select>
							<button type="submit" class="btn btn-info insertBtn">추가</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
