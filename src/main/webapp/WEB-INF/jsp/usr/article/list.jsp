<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name } 게시판" />
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div>게시물 갯수 : ${articlesCount }개</div>
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="70" />
					<col width="200" />
					<col />
					<col width="100" />
					<col width="80" />
					<col width="60" />
				</colgroup>
				<thead>
					<tr bgcolor="gray">
						<th>번호</th>
						<th>날짜</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td>${article.id}</td>
							<td>${article.regDate.substring(2,16)}</td>
							<td><a class="hover:underline"
								href="${rq.getArticleDetailUriFromArticleList(article) }">${article.title}</a></td>
							<td>${article.extra__writerName}</td>
							<td>${article.hitCount}</td>
							<td>${article.goodReactionPoint}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	<div class="page-menu mt-3 flex justify-center">
		<div class="btn-group">
			<c:set var="pageMenuLen" value="4" />
			<c:set var="startPage"
				value="${page - pageMenuLen >= 1 ? page- pageMenuLen : 1}" />
			<c:set var="endPage"
				value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount}" />

			<c:set var="pageBaseUri" value="?boardId=${boardId }" />
			<c:set var="pageBaseUri"
				value="${pageBaseUri }&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
			<c:set var="pageBaseUri"
				value="${pageBaseUri }&searchKeyword=${param.searchKeyword}" />

			<c:if test="${startPage > 1}">
				<a class="btn btn-sm" href="${pageBaseUri }&page=1">1</a>
				<c:if test="${startPage > 2}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${page == i ? 'btn-active' : '' }"
					href="${pageBaseUri }&page=${i }">${i }</a>
			</c:forEach>
			<c:if test="${endPage < pagesCount}">
				<c:if test="${endPage < pagesCount - 1}">
					<a class="btn btn-sm btn-disabled">...</a>
				</c:if>
				<a class="btn btn-sm" href="${pageBaseUri }&page=${pagesCount }">${pagesCount }</a>
			</c:if>
		</div>
	</div>
	<form class="mt-3 flex justify-center">
		<input type="hidden" name="boardId" value=${param.boardId } />
		<select data-value="${param.searchKeywordTypeCode }"
			name="searchKeywordTypeCode" class="select select-bordered">
			<option disabled="disabled">검색</option>
			<option value="title">제목</option>
			<option value="body">내용</option>
			<option value="title,body">제목 + 내용</option>
		</select>
		<input name="searchKeyword" type="text"
			class="ml-2 w-96 input input-bordered" placeholder="검색어를 입력해주세요"
			maxlength="20" value="${param.searchKeyword }" />
		<button type="submit" class="ml-2 btn btn-bordered">검색</button>
	</form>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>