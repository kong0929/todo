<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CALENDAR</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<ul class="nav justify-content-end">
		<li class="nav-item">
		  <a class="nav-link disabled" href="#">${loginMember.memberId}님 반갑습니다</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</li>
	</ul>
<br><br><br>
	<div class="container p-3 align-items-center" id="mainContent">
	<p align="right">이달의 일정 수: ${todoList.size()} </p>
		<table class="table table-bordered" style="width: 100%; height:50%" >
			<thead>
				<tr class="align-items-center text-center">
					<td class="text-center pageButton h4" width="15%">
						<a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=pre" class="btn">&lt;이전 달</a>
					</td>
					<td class="text-center h3" colspan="5" width="70%" >
						${targetYear}년 ${targetMonth}월
					</td>
					<td class="text-center pageButton h4" width="15%">
						<a href="${pageContext.request.contextPath}/member/calendar?currentYear=${targetYear}&currentMonth=${targetMonth}&option=next" class="btn">다음 달&gt;</a>
					</td>
				</tr>
				<tr class="text-center">
					<td style="color:red;font-weight:bold;">일</td><td style="font-weight:bold;">월</td><td style="font-weight:bold;">화</td><td style="font-weight:bold;">수</td><td style="font-weight:bold;">목</td><td style="font-weight:bold;">금</td><td style="color:blue;font-weight:bold;">토</td>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<c:forEach var="i" begin="1" end="${startBlank+endDay+endBlank}" step="1">
						<c:if test="${i-startBlank >= 1 && i-startBlank<=endDay}">
							<td>
								<a href="${pageContext.request.contextPath}/member/todoList?y=${targetYear}&m=0${targetMonth}&d=${i-startBlank}" class="btn">${i-startBlank}</a>
								<div>
									<!-- 날짜별 일정 -->
									<c:forEach var="todo" items="${todoList}">
										<c:if test="${i-startBlank == todo.todoDate.substring(8)}">
											<div>
												<a href="${pageContext.request.contextPath}/member/todoList?y=${targetYear}&m=${targetMonth}&d=${i-startBlank}" class="btn">${todo.todoContent}</a>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</td>
						</c:if>
						<c:if test="${i-startBlank < 1 || i-startBlank>endDay}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							</tr><tr class="text-center">
						</c:if>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>