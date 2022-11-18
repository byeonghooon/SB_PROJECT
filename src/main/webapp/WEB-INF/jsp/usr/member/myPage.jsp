<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE" />
<%@ include file="../common/head.jspf"%>
<%@ page import="com.kbh.project.util.Ut" %>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<th bgcolor="gray">가입일</th>
						<td>${rq.loginedMember.regDate}</td>
					</tr>
					<tr>
						<th bgcolor="gray">로그인 아이디</th>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<th bgcolor="gray">이름</th>
						<td>${rq.loginedMember.name }</td>
					</tr>
					<tr>
						<th bgcolor="gray">닉네임</th>
						<td>${rq.loginedMember.nickname }</td>
					</tr>
					<tr>
						<th bgcolor="gray">전화번호</th>
						<td>${rq.loginedMember.cellphoneNum  }</td>
					</tr>
					<tr>
						<th bgcolor="gray">이메일</th>
						<td>${rq.loginedMember.email }</td>
					</tr>
					
				</tbody>

			</table>
		</div>
		<div class="btns mt-3">
			<button class="btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
			<a href="../member/checkPassword?replaceUri=${Ut.getUriEncoded('../member/modify') }" class="btn btn-active btn-ghost"> 회원정보수정 </a>		
		</div>
	</div>
</section>




<%@ include file="../common/foot.jspf"%>