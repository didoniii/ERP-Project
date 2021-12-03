<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/common/sessionChk.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="/project/css/common/outline.css" rel="stylesheet" type="text/css">
<link href="/project/css/hr/hrList.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	window.onload = function() {
		var label = document.getElementsByClassName('label');
		label[0].setAttribute('style', 'background: #186343');
	}
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="/common/header.jsp" />
	</div>
	<div id="body_container">
		<div class="side_bar">
			<div>인 사</div>
			<div class="label">사원 목록</div>
			<div class="label">정보 수정</div>
			<div class="label">사원 등록</div>
		</div>
		<div class="body">
			<div class="toolbar">
				<div class="tool">구매</div>
				<div class="tool">판매</div>
				<div class="tool">재고</div>
				<div class="tool">회계</div>
				<div class="tool">인사</div>
				<div></div>
			</div>
			<div class="content">
				<div class="content_head">
					<div class="label_name">사원 목록</div>
				</div>
				<div class="content_body">
					<table>
						<tr>
							<th>사번</th>
							<th>사원명</th>
							<th>부서명</th>
							<th>전화번호</th>
							<th>이메일</th>
						</tr>
						<c:forEach var="hr" items="${hrList}">
							<tr>
								<td>${hr.emp_no}</td>
								<td>${hr.emp_name}</td>
								<td>${hr.dept_name}</td>
								<td>${hr.emp_tel}</td>
								<td>${hr.emp_email}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="page">
						<a href="/project/hr/list.do?p=${p-5}">&lt;</a>
						<c:forEach begin="${firstPage}" end="${lastPage}" varStatus="vs">
							<c:if test="${p == vs.index}">
								<b><a href="/project/hr/list.do?p=${vs.index}">${vs.index}</a></b>
							</c:if>
							<c:if test="${p != vs.index}">
								<a href="/project/hr/list.do?p=${vs.index}">${vs.index}</a>
							</c:if>
						</c:forEach>
						<a href="/project/hr/list.do?p=${p+5}">&gt;</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/project/script/header.js"></script>
	<script type="text/javascript" src="/project/script/label.js"></script>
	<script type="text/javascript" src="/project/script/toolbar.js"></script>
</body>
</html>