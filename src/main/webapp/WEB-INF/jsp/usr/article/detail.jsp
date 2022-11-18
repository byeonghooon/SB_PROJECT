<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	// 조회수 관련
	function ArticleDetail__increaseHitCount() {
		const localStorageKey = 'article__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}
		localStorage.setItem(localStorageKey, true);

		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}
	$(function() {
		// 실전코드
		//ArticleDetail__increaseHitCount();
		// 연습코드
		setTimeout(ArticleDetail__increaseHitCount, 2000);
	})
</script>


<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<th bgcolor="gray">번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th bgcolor="gray">작성날짜</th>
						<td>${article.regDate }</td>
					</tr>
					<tr>
						<th bgcolor="gray">수정날짜</th>
						<td>${article.updateDate }</td>
					</tr>
					<tr>
						<th bgcolor="gray">작성자</th>
						<td>${article.extra__writerName }</td>
					</tr>
					<tr>
						<th bgcolor="gray">조회수</th>
						<td>
							<span class="badge article-detail__hit-count">${article.hitCount }</span>
						</td>
					</tr>
					<tr>
						<th bgcolor="gray">추천</th>
						<td>
							<span class="badge ">${article.goodReactionPoint }</span>
							<c:if test="${actorCanMakeReaction}">
								<span>&nbsp;</span>
								<a
									href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri} "
									class="btn btn-outline btn-xs">좋아요 👍</a>
								<span>&nbsp;</span>
								<a
									href="/usr/reactionPoint/doBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
									class="btn btn-outline btn-xs">싫어요 👎</a>
							</c:if>
							<c:if test="${actorCanCancelGoodReaction}">
								<span>&nbsp;</span>
								<a
									href="/usr/reactionPoint/doCancelGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri} "
									class="btn btn-xs btn-primary">좋아요 👍</a>
								<span>&nbsp;</span>
								<a onclick="alert(this.title); return false;" title="좋아요를 먼저 취소해주세요"
									href="#" class="btn btn-outline btn-xs">싫어요 👎</a>
							</c:if>
							<c:if test="${actorCanCancelBadReaction}">
								<span>&nbsp;</span>
								<a onclick="alert(this.title); return false;" title="싫어요를 먼저 취소해주세요"
									href="#" class="btn btn-outline btn-xs">좋아요 👍</a>
								<span>&nbsp;</span>
								<a
									href="/usr/reactionPoint/doCancelBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
									class="btn btn-xs btn-primary">싫어요 👎</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<th bgcolor="gray">제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th bgcolor="gray">내용</th>
						<td>
							<div class="toast-ui-viewer">
								<script type="text/x-template">${article.body}</script>
						</td>
					</tr>
				</tbody>

			</table>
		</div>
		<div class="btns mt-3">
			<c:if test="${empty param.listUri}">
			<button class="btn btn-active btn-ghost" type="button"
				onclick="history.back();">뒤로가기</button>
			</c:if>
			<c:if test="${not empty param.listUri}">
				<a class="btn-text-link btn btn-active btn-ghost" href="${param.listUri }">뒤로가기</a>
			</c:if>	
			<c:if test="${article.extra__actorCanModify }">
				<a class="btn btn-active btn-ghost"
					href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.extra__actorCanDelete }">
				<a class="btn btn-active btn-ghost"
					onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>

<script>
	// 댓글관련
	let ReplyWrite__submitFormDone = false;
	function ReplyWrite__submitForm(form) {
		if (ReplyWrite__submitFormDone) {
			return;
		}
		form.body.value = form.body.value.trim();
		if (form.body.value.length < 2) {
			alert('2글자 이상 입력해주세요');
			form.body.focus();
			return;
		}
		ReplyWrite__submitFormDone = true;
		form.submit();
	}
</script>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<h2>댓글 작성</h2>
		<c:if test="${rq.isLogined() }">
			<form action="../reply/doWrite" method="post"
				onsubmit="ReplyWrite__submitForm(this); return false;">
				<input type="hidden" name="relTypeCode" value="article" />
				<input type="hidden" name="relId" value="${article.id }" />
				<input type="hidden" name="replaceUri" value="${rq.currentUri }" />
				<div>작성자 : ${rq.loginedMember.nickname }</div>
				<textarea class="textarea textarea-bordered w-full" type="text" name="body"
					placeholder="댓글을 입력해주세요" rows="3" /></textarea>
				<button class="btn btn-active btn-xs btn-ghost" type="submit">댓글작성</button>
			</form>
		</c:if>
		<c:if test="${rq.isNotLogined()}">
			<a class="btn btn-xs btn-ghost" href="${rq.loginUri }">로그인</a> 후 이용해주세요
		</c:if>
	</div>
</section>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<h2>댓글 리스트(${replies.size() })</h2>
		<table class="table table-fixed w-full">
			<colgroup>
				<col width="70" />
				<col width="200" />
				<col width="80" />
				<col width="60" />
				<col width="400" />
				<col width="100" />
			</colgroup>
			<thead>
				<tr bgcolor="gray">
					<th>번호</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>추천</th>
					<th class="text-center">내용</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reply" items="${replies }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${reply.regDate.substring(2,16)}</td>
						<td>${reply.extra__writerName}</td>
						<td>${reply.goodReactionPoint}</td>
						<td class="text-center">${reply.getForPrintBody()}</td>
						<td>
							<c:if test="${reply.extra__actorCanModify }">
								<a class="btn-text-link btn-ghost"
									href="../reply/modify?id=${reply.id }&replaceUri=${rq.encodedCurrentUri}">수정</a>
							</c:if>
							<c:if test="${reply.extra__actorCanDelete }">
								<a class="btn-text-link btn-ghost"
									onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
									href="../reply/doDelete?id=${reply.id }&replaceUri=${rq.encodedCurrentUri}">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>