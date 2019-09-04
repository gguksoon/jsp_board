<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#cateTitle {
		display: inline-block;
	}
</style>
<ul class="nav nav-pills nav-stacked">
	<!-- a tag: get method -->
	<li class="active">
		<a href="${cp }/manageBoard">
			<h3 id="cateTitle">
				<span class="glyphicon glyphicon-wrench"></span>&nbsp;게시판 관리
			</h3>			
			<span class="sr-only">(current)</span>
		</a>
	</li>

<!-- 	<div class="col-sm-3 sidenav hidden-xs"> -->
<!--       <h2>Logo</h2> -->
<!--         <li class="active"><a href="#section1">Dashboard</a></li> -->
<!--         <li><a href="#section2">Age</a></li> -->
<!--         <li><a href="#section3">Gender</a></li> -->
<!--         <li><a href="#section3">Geo</a></li> -->
<!--     </div> -->

	<c:forEach items="${boardList}" var="board">
		<c:if test="${board.boardStatus == 1 }">
			<li>
				<a href="${cp }/postPagingList?boardSeq=${board.boardSeq }">
					<span class="glyphicon glyphicon-chevron-right"></span>
					&nbsp;${board.boardNm }
					<span class="sr-only">(current)</span>
				</a>
			</li>
		</c:if>
	</c:forEach>
</ul>