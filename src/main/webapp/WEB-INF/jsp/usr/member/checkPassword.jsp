<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN" />
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3 text-center">
		<form method="POST" action="../member/doCheckPassword">
			<input type="hidden" name="replaceUri" value="${param.replaceUri }" />
			<input required="required" type="text" name="loginPw" placeholder="password"
				class="input input-bordered" />



			<div class="btns mt-3">
				<button class="btn btn-active btn-ghost" type="button"
					onclick="history.back();">뒤로가기</button>
				<button class="btn btn-active btn-ghost" type="submit" value="확인">확인</button>
			</div>
		</form>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>