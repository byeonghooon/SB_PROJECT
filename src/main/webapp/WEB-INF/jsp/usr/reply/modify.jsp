<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="REPLY MODIFY" />
<%@ include file="../common/head.jspf"%>

<script>
	// 댓글관련
	let ReplyModify__submitDone = false;
	function ReplyModify__submit(form) {
		if (ReplyModify__submitDone) {
			return;
		}
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요');
			form.body.focus();
			return;
		}
		ReplyModify__submitDone = true;
		form.submit();
	}
</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<form class="table-box-type-1" method="POST"
			action="../reply/doModify"
			onsubmit="ReplyModify__submit(this); return false;">
			<input type="hidden" name="id" value="${reply.id }" />
			<input type="hidden" name="replaceUri" value="${param.replaceUri }" />
			<table class="table table-zebra w-full">
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<th>게시물 번호</th>
						<td>
							<div>${reply.relId }</div>
						</td>
					</tr>
					<tr>
						<th>게시물 제목</th>
						<td>
							<div>${relDataTitle }</div>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<td>
							<div>${reply.id }</div>
						</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${reply.regDate }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${reply.updateDate }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${reply.extra__writerName }</td>
					</tr>
					<tr>
						<th>추천</th>
						<td><span class="badge ">${reply.goodReactionPoint }</span></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="textarea textarea-bordered w-full"
								type="text" name="body" placeholder="내용을 입력해주세요" >${reply.body }</textarea>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button class="btn btn-active btn-ghost" type="submit" value="수정" >
							수정
							</button>
						</td>
					</tr>
				</tbody>

			</table>
		</form>

		<div class="btns">
			<a class="btn-text-link btn btn-active btn-ghost" href="${param.replceUri }">뒤로가기</a>
		</div>
	</div>
</section>
<%@ include file="../common/foot.jspf"%>